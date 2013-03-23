unit OptionInspectorRows;

{******************************************************************************}
{                                                                              }
{                            PLASTIC 2002 PROJECT                              }
{                                                                              }
{               Copyright(c) 1998-2002 Plastic Software, Inc.                  }
{                                                                              }
{******************************************************************************}

// @FILE:
//   OptionInspectorRows.pas
//
// @AUTHORS:
//   Minkyu Lee, Hyesoo Kim, Jungil Kim
//
// @DESCRIPTION:
//   Option inspector row classes
//
// @REVISION HISTORY:
//   Ver  Author        Date        Summary
//   ---  ------------  ----------  --------------------------------------------
//   1.0  All           2002-07-26  First, written
//
//  No part of this work covered by the copyright hereon may be reproduced,   //
//  stored in retrieval systems, in any form or by any means, electronic,     //
//  mechanical, photocopying, recording or otherwise, without the prior       //
//  permission of Plastic Software, Inc.


interface

uses
  OptionNodes,
  Classes, dxInspct;

type
  // POptionInspectorRow
  POptionInspectorRow = class
  end;

  POptionInspectorIntegerRow = class(POptionInspectorRow)
  private
    FCategoryRow: TdxInspectorTextRow;
    FOptionItem: POptionItem;
    FInspectorRow: TdxInspectorTextRow;
  public
    constructor Create(CategoryRow: TdxInspectorTextRow; AOptionItem: POptionItem);
  end;

implementation

////////////////////////////////////////////////////////////////////////////////
// POptionInspectorIntegerRow

constructor POptionInspectorIntegerRow.Create(
  CategoryRow: TdxInspectorTextRow; AOptionItem: POptionItem);
begin

end;

end.
