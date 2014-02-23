{******************************************************************************}
{                                                                              }
{                            PLASTIC 2003 PROJECT                              }
{                                 CSharp Add-in                                }
{               Copyright(c) 1998-2004 Plastic Software, Inc.                  }
{                                                                              }
{******************************************************************************}

// @FILE:
//   SaveDialogEx.pas
//
// @AUTHORS:
//   Jeongil Kim, Jongjin Bae
//
// @DESCRIPTION:
//   SaveDialog Extension For Vaild File Name
//
// @REVISION HISTORY:
//   Ver  Author        Date        Summary
//   ---  ------------  ----------  --------------------------------------------
//   1.0  All           2004-05-31  First, written
//
//  No part of this work covered by the copyright hereon may be reproduced,   //
//  stored in retrieval systems, in any form or by any means, electronic,     //
//  mechanical, photocopying, recording or otherwise, without the prior       //
//  permission of Plastic Software, Inc.                                      //
//                                                                            //
// $Id: SaveDialogEx.pas,v 1.1 2005/11/02 07:18:01 jwnara Exp $                                                                       //
//                                                                            //
// $Log: SaveDialogEx.pas,v $
// Revision 1.1  2005/11/02 07:18:01  jwnara
// initial checkin of source from jwnara
//
// Revision 1.2  2004/06/01 08:33:32  idlock
// ofNoValid Option 필요 없어서 생성자 삭제
//
// Revision 1.1  2004/06/01 01:41:34  idlock
// SaveDialog에서 상속받아 File Name이 사용가능한 File Name인지 확인하는 확장 컴포넌트 추가
//                                                                      //

unit SaveDialogEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Dialogs;

type
  EInvalidFileName = class(Exception);
  EDirectoryNotFound = class(Exception);

  TSaveDialogEx = class(TSaveDialog)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    function Execute: Boolean; override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('PlasticComponents', [TSaveDialogEx]);
end;

function IsValidFileName(AFileName: string): Boolean;
const
  NotAvailables: array[0..8] of string = ('\', '/', ':', '*', '?', '"', '<', '>', '|');
var
  I: Integer;
  FName: string;
  FDir: string;
begin
  Result := True;
  FName := ExtractFileName(AFileName);
  FDir :=  ExtractFilePath(AFileName);

  if FName = '' then
  begin
    Result := False;
    Exit;
  end;

  if (FDir <> '') and (not DirectoryExists(FDir)) then
    raise EDirectoryNotFound.Create('Directory not found.');

  for I := 0 to Length(NotAvailables) - 1 do
  begin
    if Pos(NotAvailables[I], FName) > 0 then
    begin
      Result := False;
      Exit;
    end;
  end;

end;

function TSaveDialogEx.Execute: Boolean;
begin
  try
    if not IsValidFileName(FileName) then
      FileName := '';
  except
    on Exception do FileName := '';
  end;
  
  Result := inherited Execute;
  if (Result = True) and (not IsValidFileName(FileName)) then
    raise EInvalidFileName.Create('Invalid file name.');
end;
end.
