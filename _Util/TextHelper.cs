using System.Collections.Generic;
using System.IO;

namespace Cselian.Biblios
{
	public static class TextHelper
	{
		public static void MergeParas(string file)
		{
			var op = new List<string>();

			var para = string.Empty;
			foreach (var line in File.ReadAllLines(file))
			{
				if (line == string.Empty)
				{
					if (para != string.Empty) op.Add(para);
					para = string.Empty;
					op.Add(string.Empty);
				}
				else
				{
					para += (para != string.Empty ? " " : string.Empty) + line.TrimEnd();
				}
			}

			file = Path.ChangeExtension(file, ".paras.txt");
			File.WriteAllLines(file, op.ToArray());
		}

		public static void ChapterNumbers(string file)
		{
			var op = new List<string>();
			foreach (var line in File.ReadAllLines(file))
			{
				int i;
				var bits = line.Split('.');
				if (int.TryParse(bits[0], out i))
					op.Add("##" + i.ToString() + "	" + bits[1].Trim());
				else
					op.Add(line);
			}
			file = Path.ChangeExtension(file, ".chaps.txt");
			File.WriteAllLines(file, op.ToArray());
		}
	}
}
