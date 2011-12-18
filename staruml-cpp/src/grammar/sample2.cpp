#if !defined \
(AFX_EDITOR_H__8E69B351_BA44_11D2_B974_44455354616F__INCLUDED_)
#define AFX_EDITOR_H__8E69B351_BA44_11D2_B974_44455354616F__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

#define SAMPLE_DEF = InitInstance

/////////////////////////////////////////////////////////////////////////////
// CEditorApp:
// See editor.cpp for the implementation of this class
//

class CEditorApp : public CWinApp
{
public:
	CEditorApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CEditorApp)
	public:
	virtual BOOL SAMPLE_DEF();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CEditorApp)
	//}}AFX_MSG
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_EDITOR_H__8E69B351_BA44_11D2_B974_44455354616F__INCLUDED_)


// editor.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "editor.h"
#include "editorDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CEditorApp


/////////////////////////////////////////////////////////////////////////////
// CEditorApp construction

CEditorApp::CEditorApp()
{
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CEditorApp object

CEditorApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CEditorApp initialization

BOOL CEditorApp::SAMPLE_DEF()
{
	AfxEnableControlContainer();

	// Standard initialization

#ifdef _AFXDLL
	Enable3dControls();			// Call this when using MFC in a shared DLL
#else
	Enable3dControlsStatic();	// Call this when linking to MFC statically
#endif

	CEditorDlg dlg;
	m_pMainWnd = &dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
	}
	else if (nResponse == IDCANCEL)
	{
	}

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}

