using System.Text;

namespace Cselian.Biblios.Projects
{
	public class PUReader : BibReader
	{
		protected override string FileName { get { return @"D:\D\web\subs\biblios\_content\prometheus.php"; } }
		protected override string OutputFile { get { return @"D:\D\web\subs\biblios\pu\content.php"; } }
		protected override string NodeFormat { get { return "a{0}s{1}"; } }

		private bool capsStarted;

		protected override void ReadLine(string line)
		{
			if (line.StartsWith("<!--"))
			{
				var main = line.StartsWith("<!--new");
				NewNode(main);
				WriteNode(false);
				WritePage(false);
			}
			else if ((AllCaps(line) && !line.Contains(",")) || 
				(line.Contains(":") && 
					AllCaps(line.Substring(0, line.IndexOf(":")))))
			{
				WriteItem(Start, Speaker(line));
				capsStarted = true;
			}
			else
			{
				if (line == string.Empty)
				{
					if (ItemCounter > 30) needsNewPage = true;
					return;
				}
				ItemCounter++;
				var loc = capsStarted ? End : Whole;
				WriteItem(loc, CleanupPageNr(line));
				capsStarted = false;
			}
		}

		private string CleanupPageNr(string line)
		{
			if (line.Contains("      "))
			{
				return line.Substring(0, line.IndexOf("      "));
			}
			return line;
		}

		private string Speaker(string line)
		{
			return string.Format("<h5>{0}</h5>", line);
		}
	}
}
