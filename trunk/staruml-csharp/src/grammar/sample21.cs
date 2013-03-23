using System;
using System.WinForms;
using System.Drawing;

public class MyForm : Form
{
    protected MenuItem _itemNativeSize;
    protected MenuItem _itemFitToWindow;
    protected bool _NativeSize = true;
    protected int _FilterIndex = -1;	
    protected Bitmap _MyBitmap;

    public MyForm ()
    {
        // Set the form's title
        Text = "Image Viewer";

        // Set the form's size
        ClientSize = new Size (640, 480);

        // Create a menu
        MainMenu menu = new MainMenu ();
        MenuItem item = menu.MenuItems.Add ("&Options");
        item.Popup += new EventHandler (OnPopupOptionsMenu);
		item.MenuItems.Add (new MenuItem ("&Open...",
            new EventHandler (OnOpenImage), Shortcut.CtrlO));
        item.MenuItems.Add ("-");
        item.MenuItems.Add (_itemFitToWindow =
            new MenuItem ("Size Image to &Fit Window",
            new EventHandler (OnFitToWindow))
        );
        item.MenuItems.Add (_itemNativeSize =
            new MenuItem ("Show Image in &Native Size",
            new EventHandler (OnNativeSize))
        );
        item.MenuItems.Add ("-");
        item.MenuItems.Add (new MenuItem ("E&xit",
            new EventHandler (OnExit)));

        // Attach the menu to the form
        Menu = menu;
    }

    // Handler for Options menu popups
    private void OnPopupOptionsMenu (object sender, EventArgs e)
    {
        _itemNativeSize.Checked = _NativeSize ? true : false;
        _itemFitToWindow.Checked = _NativeSize ? false : true;
    }	

    // Handler for the Open command
    private void OnOpenImage (object sender, EventArgs e)
    {
        OpenFileDialog ofd = new OpenFileDialog ();

        ofd.Filter = "Image Files (JPEG, GIF, BMP, etc.)|" +
            "*.jpg;*.jpeg;*.gif;*.bmp;*.tif;*.tiff;*.png|" +
            "JPEG files (*.jpg;*.jpeg)|*.jpg;*.jpeg|"      +
            "GIF Files (*.gif)|*.gif|"                     +
            "BMP Files (*.bmp)|*.bmp|"                     +
            "TIFF Files (*.tif;*.tiff)|*.tif;*.tiff|"      +
            "PNG Files (*.png)|*.png|"                     +
            "All files (*.*)|*.*";

        if (_FilterIndex != -1)
            ofd.FilterIndex = _FilterIndex;

        if (ofd.ShowDialog () == DialogResult.OK) {
            String fileName = ofd.FileName;
            if (fileName.Length != 0) {
                _FilterIndex = ofd.FilterIndex;
                try {
                    _MyBitmap = new Bitmap (fileName);
                    Text = "Image Viewer - " + fileName;
                    AutoScroll = true;
                    AutoScrollMinSize = _MyBitmap.Size;
                    Invalidate ();
                }
                catch {
                    MessageBox.Show (String.Format ("{0} is not " +
                        "a valid image file", fileName), "Error",
                        MessageBox.OK | MessageBox.IconError);
                }
            }
        }
    }

    // Handler for the Size Image to Fit Window command
    private void OnFitToWindow (object sender, EventArgs e)
    {
        _NativeSize = false;
        SetStyle (ControlStyles.ResizeRedraw, true);
        if (_MyBitmap != null) {
            AutoScroll = false;
            Invalidate ();
        }
    }

    // Handler for the Show Image in Native Size command
    private void OnNativeSize (object sender, EventArgs e)
    {
        _NativeSize = true;
        SetStyle (ControlStyles.ResizeRedraw, false);
        if (_MyBitmap != null) {
            AutoScroll = true;
            AutoScrollMinSize = _MyBitmap.Size;
            Invalidate ();
        }
    }

    // Handler for the Exit command
    private void OnExit (object sender, EventArgs e)
    {
        Close ();
    }

    // OnPaint handler
    protected override void OnPaint (PaintEventArgs e)
    {
        if (_MyBitmap != null) {
            Graphics g = e.Graphics;
            if (_NativeSize)
                g.DrawImage (_MyBitmap,
                    AutoScrollPosition.X, AutoScrollPosition.Y,
                    _MyBitmap.Width, _MyBitmap.Height);
            else
                 g.DrawImage (_MyBitmap, ClientRectangle);
        }
    }

    public static void Main (string[] args) 
    {
        Application.Run (new MyForm ());
    }
}

