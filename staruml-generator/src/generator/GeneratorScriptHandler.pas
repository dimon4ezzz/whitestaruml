unit GeneratorScriptHandler;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes,
WSGenerator_TLB, StdVcl;

type
  TGeneratorScriptHandler = class(TAutoObject, IConnectionPointContainer, IGeneratorScriptHandler)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IGeneratorScriptHandlerEvents;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }

  private // Added code
    FArgs: IHashTable;
    FLogger: ILogger;

  public
    procedure Initialize; override;

  public // Added code
    procedure SetArgs(Args: IHashTable);
    procedure SetLogger(Logger: ILogger);
    procedure Abort;

  protected
    // IGeneratorScriptHandler
    function Args: IHashTable; safecall;
    function Logger: ILogger; safecall;
    { Protected declarations }
    property ConnectionPoints: TConnectionPoints read FConnectionPoints
      implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;

  end;

implementation

uses ComServ;

procedure TGeneratorScriptHandler.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IGeneratorScriptHandlerEvents;
end;

procedure TGeneratorScriptHandler.Initialize;
begin
  inherited Initialize;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil then
    FConnectionPoint := FConnectionPoints.CreateConnectionPoint(
      AutoFactory.EventIID, ckSingle, EventConnect)
  else FConnectionPoint := nil;
end;


procedure TGeneratorScriptHandler.Abort;
begin
  FEvents.Abort(0);
end;

function TGeneratorScriptHandler.Args: IHashTable;
begin
  Result := FArgs;
end;

function TGeneratorScriptHandler.Logger: ILogger;
begin
  Result := FLogger;
end;

procedure TGeneratorScriptHandler.SetArgs(Args: IHashTable);
begin
  FArgs := Args;
end;

procedure TGeneratorScriptHandler.SetLogger(Logger: ILogger);
begin
  FLogger := Logger;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TGeneratorScriptHandler, Class_GeneratorScriptHandler,
    ciMultiInstance, tmApartment);
end.
