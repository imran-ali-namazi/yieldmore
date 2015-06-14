using System.Text;

namespace Cselian.Biblios.Projects
{
	public class PORReader : BibReader
	{
		protected override string FileName { get { return @"_Util\Content\13EssaysInPhilosophyAndYoga POR.txt"; } }
		protected override string OutputFile { get { return @"wp-content\data\auro\por\content.php"; } }
		protected override string NodeFormat { get { return "s{0}c{1}"; } }

		protected override string Name { get { return "Problem of Rebirth"; } }

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
				Page = newPage;
				sb.AppendLine().AppendLine("$titles['s" + IxMain.ToString() + (main ? "" : "c" + IxSub.ToString()) + "'] = '" + line.Replace("#", string.Empty) + "';");
				WriteNode(false);
				WritePage(false);
				if (main) IxSub = 0;
			}
			else if (line.StartsWith("#"))
			{
				NewPage();
				newPage = Page = int.Parse(line.Substring(1).Split('	')[0]);
			}
			else
			{
				Page = newPage;
				WriteItem(Whole, line);
			}
		}
	}
}
