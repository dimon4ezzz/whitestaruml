unit EventPub;

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
  Classes, Core, UMLAux, WhiteStarUML_TLB;

const
  NumOfEventKind = 21;

type
  // PEventKind
  PEventKind = (EK_APPLICATION_ACTIVATE,
                EK_APPLICATION_DEACTIVATE,
                EK_APPLICATION_MINIMIZE,
                EK_APPLICATION_RESTORE,
                EK_OPTIONS_APPLIED,
                EK_PROJECT_OPENED,
                EK_PROJECT_SAVED,
                EK_PROJECT_CLOSING,
                EK_PROJECT_CLOSED,
                EK_DOCUMENT_MODIFIED,
                EK_DOCUMENT_SAVED,
                EK_UNIT_SEPARATED,
                EK_UNIT_MERGED,
                EK_UNIT_OPENED,
                EK_SELECTION_CHANGED,
                EK_DIAGRAM_ACTIVATED,
                EK_ELEMENTS_ADDED,
                EK_ELEMENTS_DELETING,
                EK_ELEMENTS_DELETED,
                EK_MODELS_CHANGED,
                EK_VIEWS_CHANGED
                );

  // PEventPublisher
  PEventPublisher = class
  private
    EventSubscribersArray: array[0..NumOfEventKind-1] of TInterfaceList;
    procedure AddSubscribeList(const ASubscriber: IEventSubscriber; EventIndex: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Subscribe(const ASubscriber: IEventSubscriber; AEvent: EventKind);
    procedure SubscribeAll(const ASubscriber: IEventSubscriber);
    procedure Unsubscribe(const ASubscriber: IEventSubscriber; AEvent: EventKind);
    procedure UnsubscribeAll(const ASubscriber: IEventSubscriber);
    function GetEventArgModelAt(Index: Integer): PModel;
    function GetEventArgModelCount: Integer;
    function GetEventArgViewAt(Index: Integer): PView;
    function GetEventArgViewCount: Integer;
    function GetEventArgDocument: PDocument;
    function GetEventArgUnit: PUMLUnitDocument;
    procedure NotifyEvent(AEvent: PEventKind);
  end;

var
  EventPublisher: PEventPublisher;

implementation

uses
  StarUMLApp;

////////////////////////////////////////////////////////////////////////////////
// PEventPublisher

constructor PEventPublisher.Create;
var
  I: Integer;
begin
  inherited;
  for I := 0 to High(EventSubscribersArray) do
    EventSubscribersArray[I] := TInterfaceList.Create;
end;

destructor PEventPublisher.Destroy;
var
  I: Integer;
begin
  for I := High(EventSubscribersArray) downto 0 do
    EventSubscribersArray[I].Free;
  inherited;
end;

procedure PEventPublisher.AddSubscribeList(const ASubscriber: IEventSubscriber; EventIndex: Integer);
var
  Idx: Integer;
begin
  Idx := EventSubscribersArray[EventIndex].IndexOf(ASubscriber);
  if Idx < 0 then
    EventSubscribersArray[EventIndex].Add(ASubscriber);
end;

procedure PEventPublisher.Subscribe(const ASubscriber: IEventSubscriber; AEvent: EventKind);
begin
  if ASubscriber <> nil then
    AddSubscribeList(ASubscriber, Ord(AEvent));
end;

procedure PEventPublisher.SubscribeAll(const ASubscriber: IEventSubscriber);
var
  I: Integer;
begin
  if ASubscriber <> nil then
    for I := 0 to High(EventSubscribersArray) do
      AddSubscribeList(ASubscriber, I);
end;

procedure PEventPublisher.Unsubscribe(const ASubscriber: IEventSubscriber; AEvent: EventKind);
begin
  if ASubscriber <> nil then
    EventSubscribersArray[Ord(AEvent)].Remove(ASubscriber);
end;

procedure PEventPublisher.UnsubscribeAll(const ASubscriber: IEventSubscriber);
var
  I: Integer;
begin
  if ASubscriber <> nil then
    for I := 0 to High(EventSubscribersArray) do
      EventSubscribersArray[I].Remove(ASubscriber);
end;

function PEventPublisher.GetEventArgModelAt(Index: Integer): PModel;
begin
  Result := StarUMLApplication.EventArgModels[Index];
end;

function PEventPublisher.GetEventArgModelCount: Integer;
begin
  Result := StarUMLApplication.EventArgModelCount;
end;

function PEventPublisher.GetEventArgViewAt(Index: Integer): PView;
begin
  Result := StarUMLApplication.EventArgViews[Index];
end;

function PEventPublisher.GetEventArgViewCount: Integer;
begin
  Result := StarUMLApplication.EventArgViewCount;
end;

function PEventPublisher.GetEventArgDocument: PDocument;
begin
  if StarUMLApplication.EventArgDocument <> nil then
    Result := StarUMLApplication.EventArgDocument
  else
    Result := nil;
end;

function PEventPublisher.GetEventArgUnit: PUMLUnitDocument;
begin
  if StarUMLApplication.EventArgUnit <> nil then
    Result := StarUMLApplication.EventArgUnit
  else
    Result := nil;
end;

procedure PEventPublisher.NotifyEvent(AEvent: PEventKind);
var
  I: Integer;
  SubscriberList: TInterfaceList;
  Subscriber: IEventSubscriber;
  R: HResult;
begin
  SubscriberList := EventSubscribersArray[Ord(AEvent)];
  for I := 0 to SubscriberList.Count - 1 do
  begin
    R := SubscriberList.Items[I].QueryInterface(IID_IEventSubscriber, Subscriber);
    if R <> E_UNEXPECTED then
      Subscriber.NotifyEvent(Ord(AEvent));
  end;
end;

// PEventPublisher
////////////////////////////////////////////////////////////////////////////////

initialization
  EventPublisher := PEventPublisher.Create;
finalization
  EventPublisher.Free;
end.
