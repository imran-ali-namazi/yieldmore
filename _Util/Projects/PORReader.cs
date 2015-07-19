using System.Text;

namespace Cselian.Biblios.Projects
{
	public class PORReader : BibReader
	{
		protected override string FileName { get { return @"wp-content\data\books\iat\Nisargadatta_I_Am_That.txt"; } }
		protected override string OutputFile { get { return @"wp-content\data\books\iat\content.php"; } }
		protected override string NodeFormat { get { return "c{1}"; } }

		protected override string Name { get { return "I Am That"; } }

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
				itemWritten = false;
				if (IxSub != 1) WritePage(true);
				sb.AppendLine().AppendLine("$titles['" + (main ? "" : "c" + IxSub.ToString()) + "'] = '" + line.Replace("#", string.Empty).Split('	')[1] + "';");
				WriteNode(false);
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
				WriteItem(Whole, line.Replace("‘", "&lsquo;").Replace("’", "&rsquo;"));
			}
		}
	}
}
