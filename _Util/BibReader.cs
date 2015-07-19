using System.IO;
using System.Linq;
using System.Text;
using System.Collections.Generic;

namespace Cselian.Biblios
{
	public abstract class BibReader
	{
		protected enum Location
		{
			Start, End, Middle, Whole
		}

		protected static readonly Location Start = Location.Start;
		protected static readonly Location End = Location.End;
		protected static readonly Location Middle = Location.Middle;
		protected static readonly Location Whole = Location.Whole;
		protected Encoding enc;

		protected StringBuilder sb;
		protected string tail;

		public void Read() //EncodingInfo info
		{
			enc = Encoding.GetEncoding(CodePage);
			var lines = File.ReadAllLines(GetPath(FileName), enc);
			sb = new StringBuilder("<?php").AppendLine();
			foreach (var item in lines)
			{
				var line = Escape(item);
				ReadLine(line);
			}
			WritePage(true);
			WriteNotes();

			sb.AppendLine();
			if (tail != null) sb.AppendLine(tail);
			sb.AppendLine("?>");
			WriteFile(OutputFile, sb);
			sb = null;
			System.Windows.Forms.MessageBox.Show(OutputFile + " Written");
			AfterRead();
		}

		#region Counting and Array

		protected int IxMain = 0;
		protected int IxSub = 0;
		protected int Page = 0;
		protected int ItemCounter = 1;
		protected bool needsNewPage; //may think we need new page on last line of node. so this cant be determined till the next line is parsed.

		protected void NewNode(bool main)
		{
			WriteNotes();
			inFootnote = false;

			if (main)
			{
				IxMain++;
				IxSub = 1;
			}
			else
			{
				IxSub++;
			}
			Page++;
			needsNewPage = false;
			ItemCounter = 1;
			nodeStartPage = Page.ToString();
		}

		protected void NewPage()
		{
			inFootnote = false;

			Page++;
			if (itemWritten) WritePage(true);
			WritePage(false);
			itemWritten = false;
			ItemCounter = 0;
		}

		protected void WriteNode(bool end)
		{
			if (itemWritten)
			{
				WritePage(true);
				itemWritten = false;
			}
			sb.AppendFormat("$data['" + NodeFormat + "'] = array();",
				IxMain, IxSub).AppendLine();
		}

		protected void WritePage(bool end)
		{
			if (end)
			{
				if (noteWritten) { noteWritten = false; return; }
				sb.Append(");").AppendLine(); return;
			}
			sb.AppendFormat("$data['" + NodeFormat + "'][{2}] = array('',",
				IxMain, IxSub, Page).AppendLine();
		}

		protected bool itemWritten;

		protected void WriteItem(Location where, string line)
		{
			if (needsNewPage) { NewPage(); needsNewPage = false; }
			if (itemWritten && (where == Location.Start || where == Location.Whole))
			{
				sb.Append(",").AppendLine();
			}

			if (where == Location.Start || where == Location.Whole)
			{
				sb.Append("'");
			}

			sb.Append(line);

			if (where == Location.End || where == Location.Whole)
			{
				sb.Append("'");
			}
			else
			{
				sb.AppendLine();
			}

			itemWritten = true;
		}

		private StringBuilder notes = new StringBuilder();
		protected bool inFootnote;
		protected string noteName;
		private List<string> notePages = new List<string>();
		private string nodeStartPage;
		private bool noteWritten;
		protected int? noteWrittenAt;

		protected void WriteNote(string note, string key)
		{
			if (noteWrittenAt.HasValue) noteWrittenAt = null;
			notes.AppendFormat("$extraData['" + NodeFormat + "'][{2}] = '{3}';", IxMain, IxSub, key, note).AppendLine();
			notePages.Add(Page.ToString());
			inFootnote = false;
		}

		private void WriteNotes()
		{
			if (notes.Length > 0)
			{
				WritePage(true);
				noteWritten = true;
				notes.Insert(0, string.Format("$extraData['" + NodeFormat + @"'] = array();
$extraData['" + NodeFormat + "pages'] = array({2} /*start*/, {3});\r\n", IxMain, IxSub, nodeStartPage, string.Join(", ", notePages.ToArray())));

				noteWrittenAt = sb.Length;
				sb.AppendLine(notes.ToString());
				notes = new StringBuilder();
				notePages = new List<string>();
			}
		}

		#endregion

		#region Protected Methods and Settings

		protected virtual string Name { get { return null; } }
		protected abstract string NodeFormat { get; }
		protected abstract string FileName { get; }
		protected abstract string OutputFile { get; }
		protected virtual int CodePage { get { return 1252; } }
		protected abstract void ReadLine(string line);
		protected virtual void AfterRead() { }

		#endregion

		#region Formatting

		private readonly static char[] lower = "abcdefghijklmnopqrstuvwxyz".ToCharArray();

		protected string Escape(string line)
		{
			if (string.Empty.Equals(line.Trim()))
				return string.Empty;
			return line.Replace("'", "&#39;");
		}

		protected bool AllCaps(string line)
		{
			if (line == string.Empty) return false;
			var letters = line.ToCharArray();
			var any = letters.Any(x => lower.Contains(x));
			return !any;
		}

		#endregion

		protected string GetPath(string relative)
		{
			if (relative.Contains(":")) return relative;

			var root = new DirectoryInfo(@".\").FullName;
			root = root.Substring(0, root.IndexOf("_Util"));
			return Path.Combine(root, relative);
		}

		protected void WriteFile(string file, StringBuilder sb)
		{
			File.WriteAllText(GetPath(file), sb.ToString(), enc);
		}

		protected bool IsNumeric(string word)
		{
			int num;
			return int.TryParse(word, out num);
		}

		public override string ToString()
		{
			return Name ?? Path.GetFileNameWithoutExtension(FileName);
		}
	}
}
