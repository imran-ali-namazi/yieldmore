using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cselian.Biblios.Projects
{
	public class MBReader : BibReader
	{
		protected override string FileName { get { return @"D:\Imran\xampplite\htdocs\biblios\_content\mb\mb.txt"; } }
		protected override string OutputFile { get { return @"D:\Imran\xampplite\htdocs\biblios\mb\content.php"; } }
		protected override string NodeFormat { get { return "c{0}"; } }

		private StringBuilder titles = new StringBuilder();
		string currentLine;
		private int Lines;
		private List<int> LinesPerPage = new List<int>();

		protected override void ReadLine(string line)
		{
			if (line.StartsWith("**")) //start of line
			{
				NewNode(true);
				WriteNode(false);
				WritePage(false);
				currentLine = null;
				Lines = 0;
			}
			else if (line.StartsWith("<p>"))
			{
				if (Lines > 25)
				{
					LinesPerPage.Add(Lines);
					if (currentLine != null) WriteItem(Whole, currentLine);
					currentLine = null;
					needsNewPage = true;
					Lines = 0;
				}
				currentLine = line.Substring(3);
			}
			else if (line.EndsWith("</p>"))
			{
				line = line.Substring(0, line.Length - 4);
				currentLine += " " + line.TrimEnd();
				if (currentLine != null)
				{
					WriteItem(Whole, currentLine);
					currentLine = null;
				}
				Lines += 1;
			}
			else if (line == "")
			{
			}
			else
			{
				currentLine += " " + line;
				Lines += 1;
			}
		}

		protected override void AfterRead()
		{
			var pages = LinesPerPage.Select(x => x.ToString()).ToArray();
			var txt = string.Join(Environment.NewLine, pages);
		}
	}
}
