var bookVisible = false;

function toggleBookmark() {
	var lnk = document.getElementById("booktoggler");
	bookVisible = !bookVisible;

	lnk.className = (bookVisible ? "" : "alt");
	document.getElementById("frmQuote").style.display = (!bookVisible ? "block" : "none");
	document.getElementById("BookmarkPane").style.display = (bookVisible ? "block" : "none");
}

function Bookmark(pg, item)
{
	if (!bookVisible) return false;
	var urlStart = document.getElementById("BookmarkStart").value;
	var lnk = document.getElementById("BookmarkUrl");
	var pageStart = parseInt(document.getElementById("qpage").value);
	lnk.href = urlStart + (pageStart - 1 + parseInt(pg)) + "&itm=" + item;
	lnk.innerHTML = lnk.href;
	return true;
}

var quoting = false;
function toggleQuoting()
{
	quoting = !quoting;
	document.getElementById('quotebar').style.display = (quoting ? "block" : "none");
	
	var pgs = getElementsByClass('tabbertab', null);
	for (var i=0; i<pgs.length; i++)
	{
		var pg = pgs[i];
		var els = pg.getElementsByTagName("p");
		for (var j=0; j<els.length; j++) //pgs.length
		{
			if (quoting)
			{
				var ep = (j == els.length - 1) ? 1 : 0; //end page
				var lnk = '<a class="qt" href="javascript:mnuQT('+(i+1)+', '+(j+1)+', '+ep+', this);">qt</a>';
				els[j].innerHTML = lnk + els[j].innerHTML;
			}
			else
			{
				els[j].removeChild(els[j].childNodes[0]);
			}
		}
    //toggleClass(els[j], "qt", quoting);
  }
}

var qstart = true;
function mnuQT(pg, item, ei)
{
	var qt; var qd;
	if (qstart)
	{
		qd = "p=" + pg + ";i=" + item;
		qt = "Pg: " + pg + ", Itm: " + item;
	}
	else
	{
		qd = document.getElementById('qdata').value;
		qt = document.getElementById('qtext').innerHTML;
		qd += ";ep=" + pg; if (ei!=1) qd += ";ei=" + item;
		qt += " End Pg:" + pg; if (ei!=1) qt += ", End Itm:" + item;
	}

	document.getElementById('qdata').value = qd;
	document.getElementById('qtext').innerHTML = qt;
	if (qstart == false)
	{
		var txt = document.getElementById('qname');
		txt.value = "Enter name";
		txt.focus(); txt.select();
		document.getElementById('qsubmit').disabled="";
	}
	qstart = !qstart;
}

function QuoteSubmit() {
	document.getElementById('qsubmit').disabled="disabled";
}

function QuoteClear() {
	document.getElementById('qdata').value = "";
	document.getElementById('qname').value = "";
	document.getElementById('qtext').innerHTML = "Begin Quoting";
	qstart = true;
}

//Helper Methods

function toggleClass(obj, cls, add)
{
	cls = " " + cls;
  if (!add)
    obj.className = obj.className.replace(new RegExp(cls + "\\b"), "");
  else
    obj.className += cls; //styleToSet="none" }
  alert(obj.className);
}

/* http://www.dustindiaz.com/top-ten-javascript/ */
/* tag is to more specifically target only TAGs having class searchClass */
function getElementsByClass(searchClass,node,tag) {
	var classElements = new Array();
	if ( node == null )
		node = document;
	if ( tag == null )
		tag = '*';
	var els = node.getElementsByTagName(tag);
	var elsLen = els.length;
	var pattern = new RegExp('(^|\\s)'+searchClass+'(\\s|$)');
	for (i = 0, j = 0; i < elsLen; i++) 
  {
		if ( pattern.test(els[i].className) ) {
			classElements[j] = els[i];
			j++;
		}
	}
	return classElements;
}
