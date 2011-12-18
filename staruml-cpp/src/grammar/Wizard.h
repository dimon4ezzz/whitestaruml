///////////////////////////////////////////////////////////
//  Wizard.h
//  Implementation of the Class Wizard
//  Created on:      08-6-2004 ¿ÀÀü 10:38:12
///////////////////////////////////////////////////////////

#if !defined(EA_6343E33E_E3BA_4dce_AF15_2E0288BE6191__INCLUDED_)
#define EA_6343E33E_E3BA_4dce_AF15_2E0288BE6191__INCLUDED_

/**
 * Wizard dialog
 */
class Wizard : public CDialog
{

public:
	Wizard();

public:
	/**
	 * Dialog Data
	 */
	enum <anonymous>
	{
		IDD = IDD_WIZARD
	};
	int m_iOS;
	int m_iTotalDownload;
	int m_iBitByte;
	Wizard(CWnd* pParent = NULL);
	virtual ~Wizard();
	void SetPrefs(CPreferences* in_prefs);
	void Localize();
	virtual BOOL OnInitDialog();
	virtual void OnBnClickedApply();
	virtual void OnBnClickedCancel();
	virtual void OnBnClickedWizRadioOsNtxp();
	virtual void OnBnClickedWizRadioUs98me();
	virtual void OnBnClickedWizLowdownloadRadio();
	virtual void OnBnClickedWizMediumdownloadRadio();
	virtual void OnBnClickedWizHighdownloadRadio();
	virtual void OnBnClickedWizResetButton();
	virtual void OnNMClickProviders(NMHDR* pNMHDR, LRESULT* pResult);

protected:
	CPreferences *app_prefs;
	CListCtrl m_provider;
	virtual void DoDataExchange(CDataExchange* pDX);

private:
	void SetCustomItemsActivation();

};




#endif // !defined(EA_6343E33E_E3BA_4dce_AF15_2E0288BE6191__INCLUDED_)