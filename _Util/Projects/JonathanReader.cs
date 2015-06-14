using System;
using System.Linq;
using System.Text;
using System.Collections.Generic;

namespace Cselian.Biblios.Projects
{
	public class JonathanReader : BibReader
	{
		protected override string FileName { get { return @"D:\D\web\subs\biblios\_content\jonathan.txt"; } }
		protected override string OutputFile { get { return @"D:\D\web\subs\biblios\jls\content.php"; } }
		protected override string NodeFormat { get { return "p{0}"; } }

		private StringBuilder titles = new StringBuilder();
		string currentLine;
		private int Lines;
		private List<int> LinesPerPage = new List<int>();

		protected override void ReadLine(string line)
		{
			if (line.StartsWith("###")) //start of line
			{
				NewNode(true);
				WriteNode(false);
				WritePage(false);
				currentLine = null;
				Lines = 0;
			}
			else if (line.StartsWith("	"))
			{
				if (Lines > 25)
				{
					LinesPerPage.Add(Lines);
					if (currentLine != null) WriteItem(Whole, currentLine);
					currentLine = null;
					needsNewPage = true;
					Lines = 0;
				}
				if (currentLine != null) WriteItem(Whole, currentLine);
				currentLine = line.Substring(1);
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
