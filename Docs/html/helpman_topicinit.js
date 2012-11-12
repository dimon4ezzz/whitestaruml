/* ---------------- Script � 2006-2010 EC Software ----------------
This script was created by Help & Manual. It is designed for use 
in combination with the output of Help & Manual and must not
be used outside this context.     http://www.helpandmanual.com

Do not modify this file! It will be overwritten by Help & Manual.
-----------------------------------------------------------------*/

var topicInitScriptAvailable = true;
var HMToggles = new Array();

function HMToggleExpandAll(value)
{
	if (HMToggles.length != null){ 
	  for (i=0; i<HMToggles.length; i++){ 
		HMToggleExpand(HMToggles[i], value); 
	  }
	}
}

function HMToggle()
{ 
	var op = HMToggle.arguments[0];
	for (i=1; i<HMToggle.arguments.length; i++) {
	  var objID = HMToggle.arguments[i]; 
       	  var obj = document.getElementById(objID);
 	  switch (op) {
		case "toggle": 
		  var state = obj.getAttribute("hm.state");
		  if (state == null) { state = "0" }; 
		  HMToggleExpand(obj, (state != "1"));
		  break;

		case "expand":
		  HMToggleExpand(obj, true);
		  break;

		case "collapse":
		  HMToggleExpand(obj, false);
		  break;
	  }
	}
}

function HMToggleExpand(obj, value)
{
	tagName = obj.nodeName.toLowerCase();
	switch (tagName) {
		case "span":
		  obj.style.display = (value ? "inline" : "none");
		  break;
		case "table":
                  if (document.all)
                    obj.style.display = (value ? "block" : "none");
                  else
                    obj.style.display = (value ? "table" : "none");
		  break;
		case "img":
		  obj.src = (value ? obj.getAttribute("hm.src1") : obj.getAttribute("hm.src0"));
		  var newTitle = (value ? obj.getAttribute("hm.title1") : obj.getAttribute("hm.title0"));
		  if (newTitle != null) { obj.title = newTitle; }
		  var newCaption = (value ? obj.getAttribute("hm.caption1") : obj.getAttribute("hm.caption0"));
		  if (newCaption != null) { obj.parentNode.parentNode.parentNode.nextSibling.firstChild.firstChild.innerHTML = newCaption; }
		  break;
	}
	obj.setAttribute("hm.state", value ? "1" : "0");
}

function HMSearchCheck(obj) 
{
  var foundHilite = window.location.search.lastIndexOf("zoom_highlight") > 0;
  if (!foundHilite) {
    var fontTags = obj.getElementsByTagName("FONT");
    if (fontTags.length > 0) {
      var hStyle = "";
      for (var cCheck = 0; cCheck < fontTags.length; cCheck++) {
        hStyle = fontTags[cCheck].style.cssText;
        if (hStyle.indexOf("BACKGROUND-COLOR") == 0) {
	  foundHilite = true;
          break; 
        }
      }
    }
  }
  return foundHilite;     
}

function HMInitToggle()
{
    if (document.getElementById) {
	var node = document.getElementById(HMInitToggle.arguments[0]);
	for (i=1; i<HMInitToggle.arguments.length-1; i=i+2) { 
		if (HMInitToggle.arguments[i] == "onclick") {
		  node.onclick = Function(HMInitToggle.arguments[i+1]); 
		}
		else { 
		  node.setAttribute(HMInitToggle.arguments[i], decodeURI(HMInitToggle.arguments[i+1])); 
		}
		if (HMInitToggle.arguments[i].substring(0,6) == "hm.src") {
			var img = new Image();
			img.src = HMInitToggle.arguments[i+1];
		}
	}
	mustExpand = HMSearchCheck(node); 
	if (node.nodeName.toLowerCase() == "img") {
	   var aLink = node.parentNode;
	   if (aLink.nodeName.toLowerCase() == "a") { 
		aLink.href = "javascript:HMToggle('toggle','" + HMInitToggle.arguments[0] +"')";
		mustExpand = false; 
	   }
	}
	HMToggles[HMToggles.length] = node;
        if (mustExpand) { 
          node.setAttribute("hm.state", "1"); 
          var nodeImg = document.getElementById('$'+node.getAttribute("id")+'_ICON');
          if (nodeImg) { HMToggleExpand(nodeImg, true); }
        }
	HMToggleExpand(node, ((node.getAttribute("hm.state") == "1") || mustExpand));
    }
}

function HMTrackTopiclink(obj)
{
    if (parent.frames.length>0) {
      if (parent.gaaccount) { parent.track("exit", obj.href); }
    }
}