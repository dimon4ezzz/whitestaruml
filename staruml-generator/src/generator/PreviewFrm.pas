unit PreviewFrm;

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
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

const
  MAX_IMAGE_WIDTH = 200;
  MAX_IMAGE_HEIGHT = 230;
  IMAGE_INTERVAL = 30;
  
type
  TPreviewForm = class(TForm)
    PreviewScrollBox: TScrollBox;
    CloseButton: TButton;
    procedure AutoSizeImage(AImage: TImage);
  public
    procedure Preview(Images: TStringList);
  end;

implementation

{$R *.dfm}

procedure TPreviewForm.AutoSizeImage(AImage: TImage);
var
  W, H: Integer;
begin
  W := AImage.Picture.Width;
  H := AImage.Picture.Height;

  if W > MAX_IMAGE_WIDTH then begin
    H := MAX_IMAGE_WIDTH * H div W;
    W := MAX_IMAGE_WIDTH;
  end;
  if H > MAX_IMAGE_HEIGHT then begin
    W := MAX_IMAGE_HEIGHT * W div H;
    H := MAX_IMAGE_HEIGHT;
  end;

  AImage.Width := W;
  AImage.Height := H;
  AImage.Stretch := True;
end;

procedure TPreviewForm.Preview(Images: TStringList);
var
  Img: TImage;
  H, VC: Integer;
  I: Integer;
begin
  VC := PreviewScrollBox.ClientHeight div 2;
  H := IMAGE_INTERVAL;
  for I := 0 to Images.Count - 1 do begin
    Img := TImage.Create(Self);
    Img.Parent := PreviewScrollBox;
    try
      Img.Picture.LoadFromFile(Images[I]);
      AutoSizeImage(Img);
    except
      on E: Exception do begin
        Img.Width := IMAGE_INTERVAL;
        Img.Height := IMAGE_INTERVAL;
      end;
    end;
    Img.Left := H;
    Img.Top := VC - Img.Height div 2;
    H := H + Img.Width + IMAGE_INTERVAL;
  end;
  Img := TImage.Create(Self);
  Img.Parent := PreviewScrollBox;
  Img.Left := H;
  Img.Top := 1;
  Img.Width := 1;
  Img.Height := 1;

  ShowModal;
end;

end.
