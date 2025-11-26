using System.Text;

namespace Cselian.Biblios.Projects
{
	public class ProphetReader : BibReader
	{
		protected override string FileName { get { return @"D:\D\web\subs\biblios\_content\prophet.html"; } }
		protected override string OutputFile { get { return @"D:\D\web\subs\biblios\prophet\content.php"; } }
		protected override string NodeFormat { get { return "c{0}"; } }

		private StringBuilder titles = new StringBuilder();

		protected override void ReadLine(string line)
		{
			if (line.StartsWith("<!--"))
			{
				NewNode(true);
				WriteNode(false);
				WritePage(false);
			}
			else if (line.StartsWith("<h4>"))
			{
				var title = line.Replace("<h4>", string.Empty).Replace("</h4>", string.Empty);
				titles.AppendFormat(",\"{0}\"", title).AppendLine();
			}
			else
			{
				if (ItemCounter > 10) needsNewPage = true;
				ItemCounter++;
				WriteItem(Whole, CleanupPara(line));
			}
		}

		protected override void AfterRead()
		{
			var use = titles.ToString();
		}

		private string CleanupPara(string line)
		{
			return line.Replace("<p>", string.Empty).Replace("</p>", string.Empty);
		}
	}
}
