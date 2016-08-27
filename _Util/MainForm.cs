using System;
using System.Windows.Forms;

namespace Cselian.Biblios
{
	public partial class MainForm : Form
	{
		public MainForm()
		{
			InitializeComponent();
			listBox1.DataSource = Readers();
		}

		private BibReader[] Readers()
		{
			return new BibReader[]
			{
				new Projects.LeithianReader(),
				new Projects.QuranReader(),
				new Projects.PORReader(),
				new Projects.BGReader(),
				new Projects.EGReader(),
				new Projects.MBReader(),
				new Projects.JonathanReader(),
				new Projects.ProphetReader(),
				new Projects.PUReader(),
			};
		}

		private void btnGeneratePhp_Click(object sender, EventArgs e)
		{
			if (listBox1.SelectedIndex == -1) return;
			var r = Readers()[listBox1.SelectedIndex]; //need a new object to reset all variables
			r.Read();
		}

		private void btnParagraphs_Click(object sender, EventArgs e)
		{
			TextHelper.MergeParas(BibReader.GetPath(txtFile.Text));
		}

		private void btnChapterNumbers_Click(object sender, EventArgs e)
		{
			TextHelper.ChapterNumbers(BibReader.GetPath(txtFile.Text));
		}
	}
}
