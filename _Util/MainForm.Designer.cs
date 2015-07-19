namespace Cselian.Biblios
{
	partial class MainForm
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.btnReadProject = new System.Windows.Forms.Button();
			this.listBox1 = new System.Windows.Forms.ListBox();
			this.txtFile = new System.Windows.Forms.TextBox();
			this.btnFileSelect = new System.Windows.Forms.Button();
			this.btnParagraphs = new System.Windows.Forms.Button();
			this.btnChapterNumbers = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// btnReadProject
			// 
			this.btnReadProject.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
			this.btnReadProject.Location = new System.Drawing.Point(324, 38);
			this.btnReadProject.Name = "btnReadProject";
			this.btnReadProject.Size = new System.Drawing.Size(127, 23);
			this.btnReadProject.TabIndex = 0;
			this.btnReadProject.Text = "Generate Php";
			this.btnReadProject.UseVisualStyleBackColor = true;
			this.btnReadProject.Click += new System.EventHandler(this.btnGeneratePhp_Click);
			// 
			// listBox1
			// 
			this.listBox1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.listBox1.FormattingEnabled = true;
			this.listBox1.Location = new System.Drawing.Point(324, 65);
			this.listBox1.Name = "listBox1";
			this.listBox1.Size = new System.Drawing.Size(127, 121);
			this.listBox1.TabIndex = 2;
			// 
			// txtFile
			// 
			this.txtFile.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.txtFile.Location = new System.Drawing.Point(12, 12);
			this.txtFile.Name = "txtFile";
			this.txtFile.Size = new System.Drawing.Size(408, 20);
			this.txtFile.TabIndex = 3;
			this.txtFile.Text = "D:\\Imran\\xampp\\htdocs\\cs\\subds\\ym\\_Util\\Content\\Nisargadatta_I_Am_That.txt";
			// 
			// btnFileSelect
			// 
			this.btnFileSelect.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
			this.btnFileSelect.Location = new System.Drawing.Point(426, 12);
			this.btnFileSelect.Name = "btnFileSelect";
			this.btnFileSelect.Size = new System.Drawing.Size(26, 20);
			this.btnFileSelect.TabIndex = 4;
			this.btnFileSelect.Text = "...";
			this.btnFileSelect.UseVisualStyleBackColor = true;
			// 
			// btnParagraphs
			// 
			this.btnParagraphs.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.btnParagraphs.Location = new System.Drawing.Point(12, 38);
			this.btnParagraphs.Name = "btnParagraphs";
			this.btnParagraphs.Size = new System.Drawing.Size(306, 23);
			this.btnParagraphs.TabIndex = 5;
			this.btnParagraphs.Text = "Put Paragraphs on one Line";
			this.btnParagraphs.UseVisualStyleBackColor = true;
			this.btnParagraphs.Click += new System.EventHandler(this.btnParagraphs_Click);
			// 
			// btnChapterNumbers
			// 
			this.btnChapterNumbers.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.btnChapterNumbers.Location = new System.Drawing.Point(12, 65);
			this.btnChapterNumbers.Name = "btnChapterNumbers";
			this.btnChapterNumbers.Size = new System.Drawing.Size(306, 23);
			this.btnChapterNumbers.TabIndex = 5;
			this.btnChapterNumbers.Text = "Add ## to chapters starting with num.";
			this.btnChapterNumbers.UseVisualStyleBackColor = true;
			this.btnChapterNumbers.Click += new System.EventHandler(this.btnChapterNumbers_Click);
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(464, 211);
			this.Controls.Add(this.btnChapterNumbers);
			this.Controls.Add(this.btnParagraphs);
			this.Controls.Add(this.btnFileSelect);
			this.Controls.Add(this.txtFile);
			this.Controls.Add(this.listBox1);
			this.Controls.Add(this.btnReadProject);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.MinimumSize = new System.Drawing.Size(480, 250);
			this.Name = "MainForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Biblios Reader";
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.Button btnReadProject;
		private System.Windows.Forms.ListBox listBox1;
		private System.Windows.Forms.TextBox txtFile;
		private System.Windows.Forms.Button btnFileSelect;
		private System.Windows.Forms.Button btnParagraphs;
		private System.Windows.Forms.Button btnChapterNumbers;
	}
}

