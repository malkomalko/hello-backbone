window.JST = window.JST || {}; window.JST["list_view"] = new Hogan.Template(function(c,p,i){i = i || "";var b = i + "";var _ = this;b += _.rp("sub_message",c,p,"");b += "<a class=\"btn btn-large btn-primary\" id=\"add\">Add List Item</a>";b += "\n" + i;b += "<ul></ul>";b += "\n";return b;;});