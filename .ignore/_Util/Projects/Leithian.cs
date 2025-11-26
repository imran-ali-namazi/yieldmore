using System.Text;

namespace Cselian.Biblios.Projects
{
	public class LeithianReader : BibReader
	{
		protected override string FileName { get { return @"wp-content\data\poems\leithian\content.txt"; } }
		protected override string OutputFile { get { return @"wp-content\data\poems\leithian\content.php"; } }
		protected override string NodeFormat { get { return "c{1}"; } }

		protected override string Name { get { return "Leithian"; } }

		private int newPage;
		private bool lastWasNewPara;

		protected override void ReadLine(string lineRaw)
		{
			var line = lineRaw.Trim();

			if (line == "@")
			{
				lastWasNewPara = true;
				return;
			}

			if (lastWasNewPara)
			{
				lastWasNewPara = false;
				line = "<br/>" + line;
			}

			if (line == "" || line.StartsWith("--"))
			{
				return;
			}
			else if (line.StartsWith("###") || line.StartsWith("##"))
			{
				var main = line.StartsWith("###");
				NewNode(main);
				itemWritten = false;
				if (IxSub != 1) WritePage(true);
				sb.AppendLine().AppendLine("$titles['" + (main ? "" : "c" + IxSub.ToString()) + "'] = '" + line.Replace("#", string.Empty) + "';");
				WriteNode(false);
				if (main) IxSub = 0;
				//newPage++;
				Page--; // = newPage;
				NewPage();
			}
			else if (line.StartsWith("#")) //not yet been added
			{
				NewPage();
				//newPage = Page = int.Parse(line.Substring(1).Split('	')[0]);
			}
			else
			{
				//Page = newPage;
				WriteItem(Whole, line.Replace("‘", "&lsquo;").Replace("’", "&rsquo;"));
			}
		}
	}
}
