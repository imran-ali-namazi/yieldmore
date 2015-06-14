using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cselian.Biblios.Projects
{
	public class BGReader : BibReader
	{
		protected override string Name { get { return "Auro's Bhagawad Gita"; } }
		protected override string FileName { get { return @"_content\eg\bg.txt"; } }
		protected override string OutputFile { get { return @"eg\content-bg.php"; } }
		protected override string NodeFormat { get { return "s3c{0}"; } }

		private readonly char[] Space = " ".ToCharArray();
		private StringBuilder titles = new StringBuilder("Line	ChapterNr	Title").AppendLine();
		private bool InHeader;
		private int lineInFile;
		string currentLine;

		public BGReader()
		{
			IxMain = 1;
			Page = 595;
		}

		protected override void ReadLine(string line)
		{
			//var lineToWrite = line.Trim();
			//lineToWrite = line;
			if (line.StartsWith("<b>")) //start of chapter
			{
				if (currentLine != null)
				{
					WriteItem(Whole, currentLine);
					currentLine = null;
				}
				WriteNode(true);
				WritePage(false);
				InHeader = true;
			}
			else if (InHeader)
			{
				if (line.Contains(@"</b>"))
				{
					NewNode(true);
					titles.AppendFormat("{0}	{1}	{2}", lineInFile, IxMain, line.Substring(0, line.IndexOf("</b>"))).AppendLine();
					InHeader = false;
				}
			}
			else if (line != string.Empty && line != "<br>")
			{
				var l = line.Trim();
				if (l.EndsWith("<br>")) l = l.Substring(0, l.Length - 4);
				var bits = l.Split(Space, 2);
				if (bits[0].EndsWith(".") && bits.Length > 1 && (bits[0].Contains("-") || IsNumeric(bits[0].Substring(0, bits[0].Length - 1))))
				{
					if (currentLine != null) WriteItem(Whole, currentLine);
					currentLine = l;
				}
				else
				{
					currentLine += " " + l;
				}
			}

			//Altered.AppendLine(lineToWrite);
			lineInFile++;
		}

		protected override void AfterRead()
		{
			//WriteFile(@"_content\eg\mb-titles.txt", titles);
		}
	}
}
