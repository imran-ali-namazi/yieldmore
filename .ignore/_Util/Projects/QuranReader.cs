using System.Text;

namespace Cselian.Biblios.Projects
{
	public class QuranReader : BibReader
	{
		protected override string FileName { get { return @"wp-content\data\scriptures\quran\content.txt"; } }
		protected override string OutputFile { get { return @"wp-content\data\scriptures\quran\content.php"; } }
		protected override string NodeFormat { get { return "s{1}"; } }

		protected override string Name { get { return "Quran"; } }

		private int newPage;

		protected override void ReadLine(string line)
		{
			if (line == "" || line.Contains("----"))
			{
				return;
			}
			else if (line.StartsWith("###") || line.StartsWith("##"))
			{
				var main = line.StartsWith("###");
				NewNode(main);
				itemWritten = false;
				if (IxSub != 1) WritePage(true);
				sb.AppendLine().AppendLine("$titles['" + (main ? "" : "s" + IxSub.ToString()) + "'] = '" + line.Replace("#", string.Empty) + "';");
				WriteNode(false);
				if (main) IxSub = 0;
				newPage++;
				Page = newPage - 1;
				NewPage();
			}
			else if (line.StartsWith("#")) //not yet been added
			{
				NewPage();
				newPage = Page = int.Parse(line.Substring(1).Split('	')[0]);
			}
			else
			{
				//Page = newPage;
				WriteItem(Whole, line.Replace("‘", "&lsquo;").Replace("’", "&rsquo;"));
			}
		}
	}
}
