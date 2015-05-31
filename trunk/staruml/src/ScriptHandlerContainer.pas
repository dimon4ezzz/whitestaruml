unit ScriptHandlerContainer;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, WhiteStarUML_TLB, StdVcl;

type
  TScriptHanderContainer = class(TAutoObject, IScriptHanderContainer)
  protected
    function FindScriptHandler(const ScriptHandlerId: WideString): IDispatch; safecall;
  end;

implementation

uses ComServ, AddinMgr;

function TScriptHanderContainer.FindScriptHandler(const ScriptHandlerId: WideString): IDispatch;

var
  AddIn: PAddIn;
  PluginIntf: IStarUMLAddIn;
  ScriptHandlerProvider: IScriptHandlerProvider;
begin
  Result := nil;
  AddIn := AddInManager.FindAddIn(ScriptHandlerId);
  if Assigned(AddIn) then begin
    PluginIntf := (AddIn as PStarUMLAddIn).COMInterface;
    ScriptHandlerProvider := PluginIntf as IScriptHandlerProvider;
    if Assigned(ScriptHandlerProvider) then
      Result := ScriptHandlerProvider.GetScriptHandler;
  end;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TScriptHanderContainer, Class_ScriptHanderContainer,
    ciMultiInstance, tmApartment);
end.
