using System.Text;

namespace Cselian.Biblios.Projects
{
	public class HOGReader : BibReader
	{
		protected override string FileName { get { return @"wp-content\data\auro\hog\content.txt"; } }
		protected override string OutputFile { get { return @"wp-content\data\auro\hog\content.php"; } }
		protected override string NodeFormat { get { return "s{0}c{1}"; } }

		protected override string Name { get { return "Hour of God"; } }

		private int newPage;
		string currentLine;

		protected override void ReadLine(string line)
		{
			line = line.TrimEnd();
			if (line == "")
			{
				if (currentLine != null) WriteItem(Whole, currentLine);
				currentLine = null;
				return;
			}
			else if (line.StartsWith("###") || line.StartsWith("##"))
			{
				var main = line.StartsWith("###");
				NewNode(main);
				Page = newPage;
				itemWritten = false;
				if (IxSub != 1) WritePage(true);
				sb.AppendLine().AppendLine("$titles['" + "s" + IxMain.ToString() + (main ? "" : "c" + IxSub.ToString()) + "'] = '" + line.Replace("#", string.Empty) + "';");
				WriteNode(false);
				if (main) IxSub = 0;
			}
			else if (line.StartsWith("#"))
			{
				NewPage();
				newPage = Page = int.Parse(line.Substring(1));
			}
			else
			{
				currentLine += (currentLine == null ? "" : " ") + line;

				Page = newPage;
			}
		}
	}
}
