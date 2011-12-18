unit OptionRowsBase;

interface

uses
  OptionNodes;

type

  POptionItemRowBase = class;

  // POptionItemRowChangeEvent
  POptionItemRowChangeEvent = procedure(OptionItemRow: POptionItemRowBase);

  // POptionItemRow
  POptionItemRowBase = class
  protected
    FOptionItem: POptionItem;
    FOnOptionItemRowChange: POptionItemRowChangeEvent;
    // override this procedure to create TdxInspectorRow and define event handlers of TdxInspectorRow
    procedure CreateInspectorRow; virtual; abstract;
    procedure DrawInspector; virtual; abstract;

  public
    //constructor Create(AInspector: TdxInspector; AOptionItem: POptionItem; ParentRow: TdxInspectorRow);
    constructor Create(AOptionItem: POptionItem);
    procedure Refresh;
    procedure HandleKeyPress(var Key: Char); virtual;
    procedure HandleValueChange; virtual;
    property OptionItem: POptionItem read FOptionItem;
    property OnOptionItemRowChange: POptionItemRowChangeEvent
      read FOnOptionItemRowChange write FOnOptionItemRowChange;
  end;

implementation

////////////////////////////////////////////////////////////////////////////////
// POptionItemRow

constructor POptionItemRowBase.Create(AOptionItem: POptionItem);
begin
  FOptionItem := AOptionItem;
end;

procedure POptionItemRowBase.Refresh;
begin
  DrawInspector;
end;

procedure POptionItemRowBase.HandleKeyPress(var Key: Char);
begin
  // not implemented.
  // override this procedure to handle keypress event in inspector
end;

procedure POptionItemRowBase.HandleValueChange;
begin
  // not implemented.
  // OnEdited, OnExit and OnChangeNode event handler call this procedure
end;


// POptionItemRow
////////////////////////////////////////////////////////////////////////////////

end.
