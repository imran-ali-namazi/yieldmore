using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cselian.Biblios.Projects
{
	public class EGReader : BibReader
	{
		protected override string Name { get { return "Essays on the Gita"; } }
		protected override string FileName { get { return @"_content\eg\eg.txt"; } }
		protected override string OutputFile { get { return @"eg\content.php"; } }
		protected override string NodeFormat { get { return "s{0}c{1}"; } }

		private StringBuilder titles = new StringBuilder();
		private StringBuilder titlesWithFootnote = new StringBuilder();
		string currentLine;
		private bool inPageHeader;
		string lastChapterNumber;
		string lastHeader;
		int lineInFile;
		private Dictionary<string, List<int>> WordOccurencesByLine = new Dictionary<string, List<int>>();

		private Dictionary<string, string> WordInfo = new Dictionary<string, string>();
		private StringBuilder words = new StringBuilder();

		//string lineToWrite;
		//private StringBuilder Altered = new StringBuilder();

		/// <summary>
		/// so that we can detect when a new para is started, whether ellipses are to be inserted.
		/// </summary>
		bool endPageWritten;

		public EGReader()
		{
			IxMain = 1;
			IxSub = 0;
			return; //TODO: resolve paths
			tail = "include_once 'content-bg.php'";
			var lines = System.IO.File.ReadAllLines(GetPath(@"_content\eg\Words.txt"));
			foreach (var word in lines)
			{
				var bits = word.Split('\t');
				if (!WordInfo.ContainsKey(bits[0])) WordInfo.Add(bits[0], string.Concat(bits[4], "\t", bits[5]));
			}
		}

		protected override void ReadLine(string line)
		{
			//var lineToWrite = line.Trim();
			//lineToWrite = line;
			if (line.StartsWith("****")) //start of page
			{
				if (currentLine != null) { WriteItem(Location.Whole, currentLine); currentLine = null; }
				Page = int.Parse(line.Substring(4)) - 1 - 12;
				if (Page > 2) { needsNewPage = true; endPageWritten = true; }
				inPageHeader = true;
				lastChapterNumber = null;
			}
			else if (line == "###")
			{
				// new chapter marker (for sorting out first letter capitalization ocr problem manually)
			}
			else if (inPageHeader && line != string.Empty)
			{
				var l = line.Trim();
				var isSame = lastHeader != null && (l.StartsWith(lastHeader) || l.EndsWith(lastHeader))
					|| (l.StartsWith("Essays on the Gita") || l.EndsWith("Essays on the Gita"));

				if (!isSame)
				{
					#region isSame
					if (lastChapterNumber == null)
					{
						lastChapterNumber = l;
						titles.Append(lineInFile).Append("	").Append(Page).Append("	").Append(l).Append("	");
						if (lastHeader == "Equality" && l == "XX")
							lastHeader = null;
					}
					else
					{
						if (l.EndsWith("1"))
						{
							l = l.Substring(0, l.Length - 1);
							titlesWithFootnote.Append(Page).Append("	").Append(lastChapterNumber).Append("	").AppendLine(l);
						}

						lastHeader = l;
						inPageHeader = false;
						titles.AppendLine(l);
						if (l == "The Vision of the World-Spirit - The Double Aspect")
							lastHeader = "The Double Aspect";
						else if (l == "The Vision of the World-Spirit - Time the Destroyer")
							lastHeader = "Time the Destroyer";

						NewNode(l == "The Two Natures");
						WriteNode(false);
						WritePage(false);
						currentLine = null;
					}
					#endregion
				}
				else
				{
					inPageHeader = false;
				}
			}
			else if (line.StartsWith("@@@")) //5 spaces: '     '
			{
				if (endPageWritten) { endPageWritten = false; }
				if (currentLine != null) WriteItem(Whole, currentLine);
				currentLine = ScanAndReturn(line.Substring(3));
				//lineToWrite = "@@@" + line.Substring(5);
			}
			else if (line == string.Empty)
			{
				if (inFootnote) { WriteNote(currentLine, noteName); currentLine = null; }
			}
			else
			{
				if (endPageWritten) { sb.Insert((noteWrittenAt.HasValue ? noteWrittenAt.Value - 5 : sb.Length - 1), " &hellip;"); endPageWritten = false; noteWrittenAt = null; }

				if (line.StartsWith("!!!")) //footnote
				{
					if (inFootnote) { WriteNote(currentLine, noteName); currentLine = null; }
					else if (currentLine != null) { WriteItem(Whole, currentLine); currentLine = null; }
					line = line.Substring(3);
					inFootnote = true;
					currentLine = ScanAndReturn(line);
				}
				else
				{
					currentLine += " " + ScanAndReturn(line);
				}
			}

			//Altered.AppendLine(lineToWrite);
			lineInFile++;
		}

		protected override void AfterRead()
		{
			var sb = new StringBuilder("#Word	Occurs	PageFirst	LineFirst	Category	S = Sanskrit; C = Common; P = Special; F = Fix; R - Reference; N - Name").AppendLine();
			WordOccurencesByLine.OrderBy(x => x.Key).ToList()
				.ForEach(x => sb.AppendFormat("{0}	{1}	{2}	{3}	{4}", x.Key, x.Value.Count - 1, x.Value[0], x.Value[1], GetWordInfo(x.Key)).AppendLine());
			WriteFile(@"_content\eg\stats.txt", sb);

			sb = new StringBuilder();
			WordInfo.Remove("#Word");
			WordInfo.ToList().ForEach(x => sb.AppendFormat("{0}	{1}", x.Key, x.Value).AppendLine());
			WriteFile(@"_content\eg\wordsremaining.txt", sb);

			WriteProblems();
			//WriteFile(@"_content\eg\eg1.txt", Altered);

			titles.AppendLine().AppendLine("With Footnotes:").Append(titlesWithFootnote.ToString());
			WriteFile(@"_content\eg\titles.txt", titles);
		}

		private string GetWordInfo(string key)
		{
			string val;
			if (WordInfo.TryGetValue(key, out val))
			{
				WordInfo.Remove(key);
				return val;
			}
			return "\t";
		}

		private void WriteProblems()
		{
			// TODO: replace ı with i
			var detailsWanted = new List<string> { 
				"*", 
				"?",
				"	", //tab
				"ad",
				"mad-",
				"op-",
				"pos",
				//"—"
			};

			foreach (var item in WordOccurencesByLine)
			{
				if (detailsWanted.Contains(item.Key) == false)
					continue;

				Probs.AppendFormat("{0}	{1}	in lines:", item.Key, item.Value.Count - 1).AppendLine();
				foreach (var line in item.Value)
				{
					Probs.AppendLine(line.ToString());
				}
			}
			WriteFile(@"_content\eg\probs.txt", Probs);
		}

		private readonly string[] Separators = new string[] { " ", ",", ".", "&ldquo;", "&rdquo", "&#39;", ";", " - ", "(", ")", ":", "~", "!", "?" };

		private readonly string[] SanskritDelimiters = new string[] { "<i>", "</i>" };

		private StringBuilder Probs = new StringBuilder();

		private string ScanAndReturn(string orig)
		{
			var delimited = false;
			var line = orig;
			if (line.Contains(SanskritDelimiters[0]))
			{
				if (line.Contains(SanskritDelimiters[1]))
				{
					delimited = true;
					// NOTE: what if line starts / ends on a delimiter?
					var started = line.StartsWith(SanskritDelimiters[0]);
					var ended = line.EndsWith(SanskritDelimiters[1]);

					var bits = line.Split(SanskritDelimiters, StringSplitOptions.RemoveEmptyEntries);
					line = bits[started ? 0 : 1].Replace(" ", "//").Replace(",", @"\\").Replace(".", @"~~").Replace("&#39;", "@@");
					line = SanskritDelimiters[0] + line + SanskritDelimiters[1];

					if (!started) line = bits[0] + line;
					if (!ended) line = line + bits[started ? 1 : 2];
				}
				else
				{
					Probs.AppendFormat("Missing </i> on line", lineInFile).AppendLine();
					//problem
				}
			}

			var words = line.Split(Separators, StringSplitOptions.RemoveEmptyEntries);
			var foot = Footnote(words);
			if (foot != null)
			{
				if (foot == words[0])
				{
					//lineToWrite = "!!!" + lineToWrite;
					Probs.AppendFormat("Footnote page	{2}	line	{0}	text	{1}", lineInFile + 1, line, Page).AppendLine();
					noteName = foot;
					orig = orig.Substring(noteName.Length + 1);
				}
				else
				{
					var link = string.Format("<a href=\"javascript:noteShow(this, \\'f{0}\\');\"><sup><b>{0}</b></sup></a>", foot);
					orig = orig.Replace(foot, link);
				}
			}

			List<int> locns;
			foreach (var word in words)
			{
				var w = delimited ? word.Replace("//", " ").Replace(@"\\", ",").Replace(@"~~", ".").Replace("@@", "&#39;") : word;

				if (WordOccurencesByLine.TryGetValue(w, out locns) == false)
				{
					locns = new List<int>();
					locns.Add(-Page);
					WordOccurencesByLine[w] = locns;
				}

				locns.Add(lineInFile);
			}

			return orig.Replace("—", "&mdash;");
		}

		private string Footnote(string[] words)
		{
			var nums = words.Where(x => IsNumeric(x)).ToArray();
			if (nums.Length > 1)
			{
				Probs.AppendFormat("Multiple notes on line	{0}", lineInFile + 1).AppendLine();
			}
			return nums.Length > 0 ? nums[0] : null;
		}
	}
}
