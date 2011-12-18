unit JavaDoc;

{******************************************************************************}
{                                                                              }
{                StarUML - The Open Source UML/MDA Platform.                   }
{                                                                              }
{              Copyright (C) 2002-2005 - Plastic Software, Inc.                }
{                                                                              }
{                                                                              }
{ This program is free software; you can redistribute it and/or modify it      }
{ under the terms of the GNU General Public License as published by the Free   }
{ Software Foundation; either version 2 of the License, or (at your option)    }
{ any later version.                                                           }
{                                                                              }
{ This program is distributed in the hope that it will be useful, but WITHOUT  }
{ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        }
{ FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     }
{ more details.                                                                }
{                                                                              }
{ You should have received a copy of the GNU General Public License along with }
{ this program; if not, write to the Free Software Foundation, Inc., 51        }
{ Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          }
{                                                                              }
{ Linking StarUML statically or dynamically with other modules is making a     }
{ combined work based on StarUML. Thus, the terms and conditions of the GNU    }
{ General Public License cover the whole combination.                          }
{                                                                              }
{ In addition, as a special exception, Plastic Software give you permission to }
{ combine StarUML program with free software programs or libraries that are    }
{ released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the }
{ standard release of ExpressBar, ExpressNavBar, ExpressInspector,             }
{ ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    }
{ modified versions of such code, with unchanged license). You may copy and    }
{ distribute such a system following the terms of the GNU GPL for StarUML and  }
{ the licenses of the other code concerned, provided that you include the      }
{ source code of that other code when and as the GNU GPL requires distribution }
{ of source code. Plastic Software also give you permission to combine StarUML }
{ program with dynamically linking plug-in (or add-in) programs that are       }
{ released under the GPL-incompatible and proprietary license.                 }
{                                                                              }
{ Note that people who make modified versions of StarUML are not obligated to  }
{ grant this special exception for their modified versions; it is their choice }
{ whether to do so. The GNU General Public License gives permission to release }
{ a modified version without this exception; this exception also makes it      }
{ possible to release a modified version which carries forward this exception. }
{******************************************************************************}

interface

uses
  Classes;

type
  // forward declarations
  PJavaDocComment = class;

  // PJavaDocTag
  PJavaDocTag = class
  protected
    FContainedComment: PJavaDocComment;
    FText: string;
  public
    property ContainedComment: PJavaDocComment read FContainedComment;
  end;

  // PParamTag
  PParamTag = class(PJavaDocTag)
  protected
    FName: string;
    FDescription: string;
  public
    property Name: string read FName;
    property Description: string read FDescription;
  end;

  // PReturnTag
  PReturnTag = class(PJavaDocTag)
  protected
    FDescription: string;
  public
    property Description: string read FDescription;
  end;

  // PJavaDocComment
  PJavaDocComment = class
  private
    FText: string;
    FTags: TList;
    function GetTagCount: Integer;
    function GetTag(Index: Integer): PJavaDocTag;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddTag(Value: PJavaDocTag);
    property Text: string read FText;
    property TagCount: Integer read GetTagCount;
    property Tags[Index: Integer]: PJavaDocTag read GetTag;
  end;

  // PJavaDocReader
  PJavaDocReader = class
  private
    function GetCommentLineText(Str: string): string;
    procedure ReadJavaDocTag(DC: PJavaDocComment; Text: string);
    function IsJavaDoc(CommentStr: string): Boolean;
    function ExtractJavaDoc(CommentStr: string): string;
  public
    function ReadJavaDocComment(CommentStr: string): PJavaDocComment;
  end;

implementation

uses
  SysUtils;

const
  TAG_PARAM = '@param';
  TAG_RETURN = '@return';

////////////////////////////////////////////////////////////////////////////////
// PJavaDocComment

constructor PJavaDocComment.Create;
begin
  FTags := TList.Create;
end;

destructor PJavaDocComment.Destroy;
var
  I: Integer;
begin
  for I := FTags.Count - 1 downto 0 do begin
    PJavaDocTag(FTags[I]).Free;
    FTags.Delete(I);
  end;
  FTags.Free;
  inherited;
end;

function PJavaDocComment.GetTagCount: Integer;
begin
  Result := FTags.Count;
end;

function PJavaDocComment.GetTag(Index: Integer): PJavaDocTag;
begin
  Result := PJavaDocTag(FTags[Index]);
end;

procedure PJavaDocComment.AddTag(Value: PJavaDocTag);
begin
  if FTags.IndexOf(Value) = -1 then
    FTags.Add(Value);
end;

// PJavaDocComment
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// PJavaDocReader

function IsSpaceSymbol(C: string): Boolean;
begin
  Result := (C = ' ') or (C = #9);
end;

function IsAsterisksLeading(Str: string): Boolean;
var
  S: string;
begin
  S := TrimLeft(Str);
  Result := ((Length(S) > 0) and (Copy(S, 1, 1) = '*'));
end;

function IsBlockTagDefinition(Str: string): Boolean;
var
  S: string;
begin
  S := TrimLeft(Str);
  Result := ((Length(S) > 0) and (Copy(S, 1, 1) = '@'));
end;

function GetTagName(Text: string): string;
var
  Str, S: string;
  I: Integer;
begin
  Assert(IsBlockTagDefinition(Text));
  Str := TrimLeft(Text);
  S := '';
  for I := 0 to Length(Str) - 1 do begin
    if IsSpaceSymbol(Copy(Str, I + 1, 1)) then begin
      Result := S;
      Exit;
    end;
    S := S + Copy(Str, I + 1, 1);
  end;
  Result := S;
end;

function GetFirstWord(Text: string): string;
var
  Str, S: string;
  I: Integer;
begin
  Assert(Copy(Str, 1, 1) <> ' ');
  Str := TrimLeft(Text);
  S := '';
  for I := 0 to Length(Str) - 1 do begin
    if IsSpaceSymbol(Copy(Str, I + 1, 1)) then begin
      Result := S;
      Exit;
    end;
    S := S + Copy(Str, I + 1, 1);
  end;
  Result := S;
end;

function IsRegistedBlockTag(Tag: string): Boolean;
begin
  Result := (Tag = TAG_PARAM) or (Tag = TAG_RETURN);
end;

function PJavaDocReader.GetCommentLineText(Str: string): string;
var
  S, C: string;
  I: Integer;
begin
  if IsAsterisksLeading(Str) then begin
    S := TrimLeft(Str);
    I := 0;
    repeat
      I := I + 1;
      C := Copy(S, I, 1);
    until (I >= Length(S)) or (C <> '*');
    if C = '*' then
      Result := ''
    else
      Result := Copy(S, I, Length(S) - I + 1);
  end
  else
    Result := Str;
end;

procedure PJavaDocReader.ReadJavaDocTag(DC: PJavaDocComment; Text: string);
var
  Str, Rest: string;
  Tag: string;
  ParamTag: PParamTag;
  ReturnTag: PReturnTag;
begin
  Str := TrimLeft(Text);
  Tag := GetTagName(Str);
  if Tag = TAG_PARAM then begin
    ParamTag := PParamTag.Create;
    Rest := TrimLeft(Copy(Str, Length(TAG_PARAM) + 1, Length(Str) - Length(TAG_PARAM)));
    ParamTag.FName := GetFirstWord(Rest);
    if ParamTag.FName <> '' then
      ParamTag.FDescription := TrimLeft(Copy(Rest, Length(ParamTag.FName) + 1, Length(Rest) - Length(ParamTag.FName)))
    else
      ParamTag.FDescription := '';
    DC.AddTag(ParamTag);
  end
  else if Tag = TAG_RETURN then begin
    ReturnTag := PReturnTag.Create;
    ReturnTag.FDescription := TrimLeft(Copy(Str, Length(TAG_RETURN) + 1, Length(Str) - Length(TAG_RETURN)));
    DC.AddTag(ReturnTag);
  end;
end;

function PJavaDocReader.IsJavaDoc(CommentStr: string): Boolean;
begin
  Result := (Copy(CommentStr, 1, 3) = '/**') and (Copy(CommentStr, Length(CommentStr) - 1, 2) = '*/');
end;

function PJavaDocReader.ExtractJavaDoc(CommentStr: string): string;
begin
  Assert(IsJavaDoc(CommentStr));
  Result := Copy(CommentStr, 3, Length(CommentStr) - 4);
end;

function PJavaDocReader.ReadJavaDocComment(CommentStr: string): PJavaDocComment;
var
  DC: PJavaDocComment;
  SL: TStringList;
  InBlockTag: Boolean;
  Txt, TagTxt: string;
  S: string;
  I: Integer;
begin
  Result := nil;
  if not IsJavaDoc(CommentStr) then Exit;

  DC := PJavaDocComment.Create;
  SL := TStringList.Create;
  Txt := '';
  TagTxt := '';
  InBlockTag := False;
  try
    try
      SL.Text := ExtractJavaDoc(CommentStr);
      for I := 0 to SL.Count - 1 do begin
        S := GetCommentLineText(SL.Strings[I]);
        if IsBlockTagDefinition(S) then begin
          if InBlockTag then
            ReadJavaDocTag(DC, TagTxt);
          InBlockTag := True;
          TagTxt := S;
        end
        else begin
          if InBlockTag then
            TagTxt := TagTxt + S + #13 + #10
          else
            Txt := Txt + S + #13 + #10;
        end;
      end;
      if InBlockTag then
        ReadJavaDocTag(DC, TagTxt);
      DC.FText := Txt;
    except
      DC.Free;
      DC := nil;
    end;
  finally
    SL.Free;
  end;
  Result := DC;
end;

// PJavaDocReader
////////////////////////////////////////////////////////////////////////////////

end.
