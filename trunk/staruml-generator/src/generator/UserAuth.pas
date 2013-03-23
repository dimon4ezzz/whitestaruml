unit UserAuth;

{******************************************************************************}
{                                                                              }
{                            PLASTIC 2002 PROJECT                              }
{                                                                              }
{               Copyright(c) 1998-2002 Plastic Software, Inc.                  }
{                                                                              }
{******************************************************************************}

// @FILE:
//   UserAuth.pas
//
// @AUTHORS:
//   Jungil Kim
//
// @DESCRIPTION:
//   User Authentification Unit
//
// @REVISION HISTORY:
//   Ver  Author        Date        Summary
//   ---  ------------  ----------  --------------------------------------------
//   1.0  All           2005-03-06  First, written
//
//  No part of this work covered by the copyright hereon may be reproduced,   //
//  stored in retrieval systems, in any form or by any means, electronic,     //
//  mechanical, photocopying, recording or otherwise, without the prior       //
//  permission of Plastic Software, Inc.

interface

uses
  Controls, SysUtils, Dialogs;

const
  PREFIX_AGORA_GENERATOR = 'AG10';
  PID_AGORA_GENERATOR_PERSONAL = PREFIX_AGORA_GENERATOR + 'P';
  PID_AGORA_GENERATOR_TRIAL = PREFIX_AGORA_GENERATOR + 'T';
  PID_AGORA_GENERATOR_COMMERCIAL = PREFIX_AGORA_GENERATOR + 'C';
  TRIAL_EXPIRATION_PERIOD = 30;

//  PREFIX_AGORA_PLASTIC_2005 = 'AP45';
//  PID_AGORA_PLASTIC_2005_COMMERCIAL = PREFIX_AGORA_PLASTIC_2005 + 'C';
//  PID_AGORA_PLASTIC_2005_PERSONAL = PREFIX_AGORA_PLASTIC_2005 + 'P';
//  PID_AGORA_PLASTIC_2005_TRIAL = PREFIX_AGORA_PLASTIC_2005 + 'T';



type
  // exceptions
  EInvalidRegistrationData = class(Exception);

  // PSerialCoder
  PSerialCoder = class
  private
    function XorString(Source: string; XorByte: Byte): string;
    function CharToBin(C: Char): string;
    function BinToChar(Bin: string): Char;
    function StrToBin(Str: string): string;
    function BinToStr(BinStr: string): string;
    function ShiftLeftString(Str: string; BitCount: Integer): string;
    function ShiftRightString(Str: string; BitCount: Integer): string;
    function Base64Decode(S: string): string;
    function IsBase64Char(C: Char): Boolean;
    function ExchangeBase64Char(C: Char): Char;
    function RestoreBase64Char(C: Char): Char;
    function ShuffleBase64Chars(Str: string): string;
    function RestoreShuffledChars(Str: string): string;
    function GetParityChar(Str: string): Char;
    function CreateSourceNumber(ProductID: string): string;
    function EncodeSerialNumber(SourceNumber: string): string;
    function DecodeSerialNumber(SerialNumber: string): string;
    function EncodeExpDate(ADate: TDate): string;
    function DecodeExpDate(DateStr: string): TDate;
    function ContainedNonAlphaNumCharInBase64(S: string): Boolean;
    function FileCreationTime(FileName: string): Integer;
    function GetFileTimeKey(FileName: string): Byte;
  public
    function CreateSerialNumber(ProductID: string): string;
    function IsValidSerialNumber(SerialNumber: string): Boolean;
    function LockSerialNumber(SerialNumber: string; FileName: string): string;
    function ExtractSerialNumber(LockedSerialNumber: string; FileName: string): string;
    function GetProductID(SerialNumber: string): string;
    function GetExpirationCode(ADate: TDate): string;
    function GetExpirationDate(ExpCode: string): TDate;
    function IsExpired(ExpCode: string): Boolean;
  end;

  // PRegistrationInfo
  PRegistrationInfo = record
    IsValidRegistration: Boolean;
    Company: string;
    UserName: string;
    SerialNumber: string;
    ProductID: string;
    ExpirationDate: TDate;
    Remainder: Integer;
  end;

  PExpiredCoder = class
  private
    IsValidExpired: Boolean;
  public
    procedure SetExpirationCode(ExpCode: Integer);
    function GetExpirationCode(): Integer;
  end;
var
  ExpirationDate: string;
  ExpiredCoder: PExpiredCoder;

function ReadRegistrationInfo: PRegistrationInfo;
//function ReadPlasticRegisterationInfo: PPlasticRegistrationInfo;

implementation

uses
  Utilities, Symbols,
  Windows, Forms, Registry, IdCoder3To4, IdGlobal;

const
  RK_REGISTRATION = '\SOFTWARE\PLASTIC SOFTWARE\GENERATOR\Registration';
  RV_COMPANY = 'Company';
  RV_USERNAME = 'UserName';
  RV_SERIAL_NUMBER = 'SerialNumber';
  RV_EXPIRATION = 'Expiration';
  RV_REMAINDER = 'Remainder';

  RK_EXP_REGISTRATION = '\pled';
  RV_EXP_HIDE = 'ExpValue';

//  RK_AGORA_PLASTIC_REGISTRATION = '\SOFTWARE\PLASTIC SOFTWARE\Plastic\Registration';

  ExchangingCharset: array [0..12, 0..1] of Char =
    (('0', 'a'), ('1', 'K'), ('2', 'c'), ('3', 'F'),
    ('4', 'A'), ('5', 'T'), ('6', 'z'), ('7', 'x'),
    ('8', 'O'), ('9', 'j'), ('+', 'w'), ('/', 'y'),
    ('=', 'U'));

////////////////////////////////////////////////////////////////////////////////
//  PSerialCoder

function PSerialCoder.XorString(Source: string; XorByte: Byte): string;
var
  S: string;
  I: Integer;
begin
  for I := 1 to Length(Source) do begin
    S := S + Chr(Ord(Source[I]) xor XorByte);
  end;
  Result := S;
end;

function PSerialCoder.CharToBin(C: Char): string;
var
  S: string;
  N: Byte;
begin
  N := Ord(C);
  S := '';
  if N and 128 = 128 then S := S + '1' else S := S + '0';
  if N and 64 = 64 then S := S + '1' else S := S + '0';
  if N and 32 = 32 then S := S + '1' else S := S + '0';
  if N and 16 = 16 then S := S + '1' else S := S + '0';
  if N and 8 = 8 then S := S + '1' else S := S + '0';
  if N and 4 = 4 then S := S + '1' else S := S + '0';
  if N and 2 = 2 then S := S + '1' else S := S + '0';
  if N and 1 = 1 then S := S + '1' else S := S + '0';
  Result := S;
end;

function PSerialCoder.BinToChar(Bin: string): Char;
var
  N: Integer;
begin
  Assert(Length(Bin) = 8);
  N := StrToInt(Bin[1]) * 128
    + StrToInt(Bin[2]) * 64
    + StrToInt(Bin[3]) * 32
    + StrToInt(Bin[4]) * 16
    + StrToInt(Bin[5]) * 8
    + StrToInt(Bin[6]) * 4
    + StrToInt(Bin[7]) * 2
    + StrToInt(Bin[8]) * 1;
  Result := Chr(N);
end;

function PSerialCoder.StrToBin(Str: string): string;
var
  S: string;
  I: Integer;
begin
  S := '';
  for I := 1 to Length(Str) do
    S := S + CharToBin(Str[I]);
  Result := S;
end;

function PSerialCoder.BinToStr(BinStr: string): string;
var
  S: string;
  Num: Integer;
  I: Integer;
begin
  Assert(Length(BinStr) mod 8 = 0);
  S := '';
  for I := 1 to Length(BinStr) div 8 do begin
    Num := StrToInt(BinStr[(I - 1) * 8 + 1]) * 128
      + StrToInt(BinStr[(I - 1) * 8 + 2]) * 64
      + StrToInt(BinStr[(I - 1) * 8 + 3]) * 32
      + StrToInt(BinStr[(I - 1) * 8 + 4]) * 16
      + StrToInt(BinStr[(I - 1) * 8 + 5]) * 8
      + StrToInt(BinStr[(I - 1) * 8 + 6]) * 4
      + StrToInt(BinStr[(I - 1) * 8 + 7]) * 2
      + StrToInt(BinStr[(I - 1) * 8 + 8]) * 1;
    S := S + Chr(Num);
  end;
  Result := S;
end;

function PSerialCoder.ShiftLeftString(Str: string; BitCount: Integer): string;
var
  BitStr: string;
  S: string;
begin
  BitStr := StrToBin(Str);
  S := Copy(BitStr, BitCount + 1, Length(BitStr) - BitCount)
    + Copy(BitStr, 1, BitCount);
  Result := BinToStr(S);
end;

function PSerialCoder.ShiftRightString(Str: string; BitCount: Integer): string;
var
  BitStr: string;
  S: string;
begin
  BitStr := StrToBin(Str);
  S := Copy(BitStr, Length(BitStr) - BitCount + 1, BitCount)
    + Copy(BitStr, 1, Length(BitStr) - BitCount);
  Result := BinToStr(S);
end;

function PSerialCoder.Base64Decode(S: string): string;
var
  Decoder: TIdBase64Decoder;
begin
  Decoder := TIdBase64Decoder.Create(Application);
  try
    Decoder.CodeString(S);
    Result := Decoder.CompletedInput;
    Fetch(Result, ';');
  finally
    Decoder.Free;
  end;
end;

function PSerialCoder.IsBase64Char(C: Char): Boolean;
begin
  Result := (C = '+') or (C = '/') or ((C >= '0') and (C <= '9'))
    or ((C >= 'A') and (C <= 'Z')) or ((C >= 'a') and (C <= 'z'))
    or (C = '='); // '=' is special signature
end;

function PSerialCoder.ExchangeBase64Char(C: Char): Char;
var
  I: Integer;
begin
  Assert(IsBase64Char(C));
  for I := 0 to Length(ExchangingCharset) - 1 do begin
    if C = ExchangingCharset[I][0] then begin
      Result := ExchangingCharset[I][1];
      Exit;
    end
    else if C = ExchangingCharset[I][1] then begin
      Result := ExchangingCharset[I][0];
      Exit;
    end;
  end;
  Result := C;
end;

function PSerialCoder.RestoreBase64Char(C: Char): Char;
begin
  Assert(IsBase64Char(C));
  Result := ExchangeBase64Char(C);
end;

function PSerialCoder.ShuffleBase64Chars(Str: string): string;
var
  S: string;
  I: Integer;
begin
  S := '';
  for I := 1 to Length(Str) do
    S := S + ExchangeBase64Char(Str[I]);
  Result := S;
end;

function PSerialCoder.RestoreShuffledChars(Str: string): string;
begin
  Result := ShuffleBase64Chars(Str);
end;

function PSerialCoder.GetParityChar(Str: string): Char;
var
  Sum: Integer;
  I: Integer;
begin
  Sum := 0;
  for I := 1 to Length(Str) do
    Sum := Sum + Ord(Str[I]);
  Result := Chr((Sum * 7) mod 256);
end;

function PSerialCoder.CreateSourceNumber(ProductID: string): string;
var
  S: string;
  I: Integer;
begin
  Assert(Length(ProductID) = 5);
  S := ProductID;
  Randomize;
  for I := 1 to 5 do
    S := S + Chr(Random(255));
  Result := S + GetParityChar(S);
end;

function PSerialCoder.EncodeSerialNumber(SourceNumber: string): string;
var
  Mask: Byte;
  S: string;
begin
  Mask := Random(255);
  S := XorString(SourceNumber, Mask) + Chr(Mask);
  S := ShiftRightString(S, 5);
  S := XorString(S, $3B);
  S := ShiftLeftString(S, 17);
  S := XorString(S, $56);
  S := Base64Encode(S);
  S := ShuffleBase64Chars(S);
  Result := S;
end;

function PSerialCoder.DecodeSerialNumber(SerialNumber: string): string;
var
  S: string;
begin
  S := RestoreShuffledChars(SerialNumber);
  S := Base64Decode(S);
  S := XorString(S, $56);
  S := ShiftRightString(S, 17);
  S := XorString(S, $3B);
  S := ShiftLeftString(S, 5);
  S := XorString(Copy(S, 1, Length(S) - 1), Ord(S[Length(S)]));
  Result := S;
end;

function PSerialCoder.EncodeExpDate(ADate: TDate): string;
var
  Mask: Byte;
  S: string;
begin
  S := DateToStr(ADate);
  if Length(S) mod 3 <> 0 then
    S := S + StringOfChar(#32, 3 - Length(S) mod 3);
  Mask := Random(255);
  S := XorString(S, Mask) + Chr(Mask);
  S := ShiftLeftString(S, 10);
  S := XorString(S, $1C);
  S := ShiftRightString(S, 5);
  S := XorString(S, $3A);
  S := Base64Encode(S);
  S := ShuffleBase64Chars(S);
  Result := S;
end;

function PSerialCoder.DecodeExpDate(DateStr: string): TDate;
var
  S: string;
begin
  S := RestoreShuffledChars(DateStr);
  S := Base64Decode(S);
  S := XorString(S, $3A);
  S := ShiftLeftString(S, 5);
  S := XorString(S, $1C);
  S := ShiftRightString(S, 10);
  S := XorString(Copy(S, 1, Length(S) - 1), Ord(S[Length(S)]));
  S := Trim(S);
  Result := StrToDate(S);
end;

function PSerialCoder.ContainedNonAlphaNumCharInBase64(S: string): Boolean;
begin
  Result := (Pos('/', S) <> 0) or (Pos('+', S) <> 0) or (Pos('=', S) <> 0);
end;

function PSerialCoder.FileCreationTime(FileName: string): Integer;
var
  Handle: THandle;
  FindData: TWin32FindData;
  LocalFileTime: TFileTime;
begin
  Handle := FindFirstFile(PChar(FileName), FindData);
  if Handle <> INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(Handle);
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
    begin
      FileTimeToLocalFileTime(FindData.ftCreationTime, LocalFileTime);
      if FileTimeToDosDateTime(LocalFileTime, LongRec(Result).Hi,
        LongRec(Result).Lo) then Exit;
    end;
  end;
  Result := -1;
end;

function PSerialCoder.GetFileTimeKey(FileName: string): Byte;
var
  Stamp: TTimeStamp;
begin
  if FileExists(FileName) then begin
    Stamp := DateTimeToTimeStamp(FileDateToDateTime(FileCreationTime(FileName)));
    Result := Stamp.Time mod 256;
  end
  else
    raise Exception.Create('File is not exists.');
end;

function PSerialCoder.CreateSerialNumber(ProductID: string): string;
var
  S: string;
begin
  if Length(ProductID) <> 5 then
    raise Exception.Create('Product id not valid.');
  repeat
    S := EncodeSerialNumber(CreateSourceNumber(ProductID));
  until not ContainedNonAlphaNumCharInBase64(S);
  Result := S;
end;

function PSerialCoder.IsValidSerialNumber(SerialNumber: string): Boolean;
var
  SourceNumber: string;
  Parity: Char;
begin
  if Length(SerialNumber) <> 16 then
    Result := False
  else begin
    try
      SourceNumber := DecodeSerialNumber(SerialNumber);
      Parity := GetParityChar(Copy(SourceNumber, 1, Length(SourceNumber) - 1));
      Result := (SourceNumber[Length(SourceNumber)] = Parity);
    except
      on E: Exception do
        Result := False;
    end;
  end;
end;

function PSerialCoder.LockSerialNumber(SerialNumber: string; FileName: string): string;
var
  Key: Byte;
  S: string;
begin
  try
    Key := GetFileTimeKey(FileName);
    S := SerialNumber + '  ';
    S := XorString(S, Key);
    S := ShiftLeftString(S, 3);
    S := XorString(S, $76);
    S := ShiftRightString(S, 8);
    S := Base64Encode(S);
    S := ShuffleBase64Chars(S);
    Result := S;
  except
    on E: Exception do
      raise Exception.Create('Unable to encrypt serial number.');
  end;
end;

function PSerialCoder.ExtractSerialNumber(LockedSerialNumber: string; FileName: string): string;
var
  Key: Byte;
  S: string;
begin
  if Length(LockedSerialNumber) <> 24 then
    Result := ''
  else begin
    try
      Key := GetFileTimeKey(FileName);
      S := RestoreShuffledChars(LockedSerialNumber);
      S := Base64Decode(S);
      S := ShiftLeftString(S, 8);
      S := XorString(S, $76);
      S := ShiftRightString(S, 3);
      S := XorString(S, Key);
      S := Copy(S, 1, 16);
      Result := S;
    except
      on E: Exception do
        raise Exception.Create('Unable to extract serial number.');
    end;
  end;
end;

function PSerialCoder.GetProductID(SerialNumber: string): string;
var
  SourceNumber: string;
begin
  if not IsValidSerialNumber(SerialNumber) then
    raise Exception.Create('Serial number is not valid.');
  SourceNumber := DecodeSerialNumber(SerialNumber);
  Result := Copy(SourceNumber, 1, 5);
end;

function PSerialCoder.GetExpirationCode(ADate: TDate): string;
begin
  Result := EncodeExpDate(ADate);
end;

function PSerialCoder.GetExpirationDate(ExpCode: string): TDate;
begin
  try
    Result := DecodeExpDate(ExpCode);
  except
    on E: Exception do
      raise Exception.Create('Invalid expiration date code.');
  end;
end;

function PSerialCoder.IsExpired(ExpCode: string): Boolean;
begin
  try
    Result := (Date > DecodeExpDate(ExpCode));
  except
    on E: Exception do
      raise Exception.Create('Invalid expiration date code.');
  end;
end;

//  PSerialCoder
////////////////////////////////////////////////////////////////////////////////

function ReadRegistrationInfo: PRegistrationInfo;

  function IsAgoraGeneratorProduct(ProductID: string): Boolean;
  begin
    Result := (ProductID = PID_AGORA_GENERATOR_COMMERCIAL)
//      or (ProductID = PID_AGORA_GENERATOR_PERSONAL)
      or (ProductID = PID_AGORA_GENERATOR_TRIAL);
  end;

var
  SerialCoder: PSerialCoder;
  RegInfo: PRegistrationInfo;
  ExpDate: string;
  Reg: TRegistry;
  ExpReg: TRegistry;
begin
  SerialCoder := PSerialCoder.Create;
  Reg := TRegistry.Create;
  ExpReg := TRegistry.Create;
  ExpiredCoder := PExpiredCoder.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    ExpReg.RootKey := HKEY_CLASSES_ROOT;
    if Reg.OpenKey(RK_REGISTRATION, False) then begin
      try
        RegInfo.Company := Reg.ReadString(RV_COMPANY);
        RegInfo.UserName := Reg.ReadString(RV_USERNAME);
        RegInfo.SerialNumber := SerialCoder.ExtractSerialNumber(Reg.ReadString(RV_SERIAL_NUMBER), GetDllFileName);

        RegInfo.IsValidRegistration := SerialCoder.IsValidSerialNumber(RegInfo.SerialNumber)
          and IsAgoraGeneratorProduct(SerialCoder.GetProductID(RegInfo.SerialNumber));
        if RegInfo.IsValidRegistration then
          RegInfo.ProductID := SerialCoder.GetProductID(RegInfo.SerialNumber)
        else
          RegInfo.ProductID := '';
        if RegInfo.ProductID = PID_AGORA_GENERATOR_TRIAL then begin
          try
            if ExpReg.OpenKey(RK_EXP_REGISTRATION, False) then begin
              ExpDate := ExpReg.ReadString(RV_EXP_HIDE);
              RegInfo.ExpirationDate := SerialCoder.GetExpirationDate(ExpDate);
              RegInfo.Remainder := Trunc(RegInfo.ExpirationDate) - Trunc(Date) + 1;
              ExpiredCoder.SetExpirationCode(RegInfo.Remainder);
            end;
          finally
            ExpReg.CloseKey;
            ExpReg.Free;
            ExpiredCoder.Free;
          end;
        end;
      except
        on E: Exception do
          raise EInvalidRegistrationData.Create('Invalid registration code.');
      end;
      Reg.CloseKey;
      Result := RegInfo;
    end
    else
      raise EInvalidRegistrationData.Create('Cannot find registration code.');
  finally
    Reg.Free;
    SerialCoder.Free;
  end;
end;

{ PExpirateCoder }

procedure PExpiredCoder.SetExpirationCode(ExpCode: Integer);
var
  RegExp: TRegistry;
begin
  RegExp := TRegistry.Create;
  try
    RegExp.RootKey := HKEY_CLASSES_ROOT;
    if RegExp.OpenKey(RK_EXP_REGISTRATION, True) then begin
      RegExp.WriteString(RV_REMAINDER, IntToStr(ExpCode));
    end;
  finally
    RegExp.CloseKey;
    RegExp.Free;
  end;
end;

function PExpiredCoder.GetExpirationCode():Integer;
var
  RegExp: TRegistry;
  temp: string;
begin
  RegExp := TRegistry.Create;
  try
    RegExp.RootKey := HKEY_CLASSES_ROOT;
    if RegExp.OpenKey(RK_EXP_REGISTRATION, false) then begin
      temp := RegExp.ReadString(RV_REMAINDER);
      result := StrToInt(temp);
    end;
  finally
    RegExp.CloseKey;
    RegExp.Free;
  end;
end;
end.

