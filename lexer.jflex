package cup.example;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;
import java_cup.runtime.Symbol;
import java.lang.*;
import java.io.InputStreamReader;

%%

%class Lexer
%implements sym
%public
%unicode
%ignorecase
%line
%column
%cup
%char
%{
	

    public Lexer(ComplexSymbolFactory sf, java.io.InputStream is){
		this(is);
        symbolFactory = sf;
    }
	public Lexer(ComplexSymbolFactory sf, java.io.Reader reader){
		this(reader);
        symbolFactory = sf;
    }
    
    private StringBuffer sb;
    private ComplexSymbolFactory symbolFactory;
    private int csline,cscolumn;

    public Symbol symbol(String name, int code){
		return symbolFactory.newSymbol(name, code,
						new Location(yyline+1,yycolumn+1, yychar), // -yylength()
						new Location(yyline+1,yycolumn+yylength(), yychar+yylength())
				);
    }
    public Symbol symbol(String name, int code, String lexem){
	return symbolFactory.newSymbol(name, code, 
						new Location(yyline+1, yycolumn +1, yychar), 
						new Location(yyline+1,yycolumn+yylength(), yychar+yylength()), lexem);
    }
    
    protected void emit_warning(String message){
    	System.out.println("scanner warning: " + message + " at : 2 "+ 
    			(yyline+1) + " " + (yycolumn+1) + " " + yychar);
    }
    
    protected void emit_error(String message){
    	System.out.println("scanner error: " + message + " at : 2" + 
    			(yyline+1) + " " + (yycolumn+1) + " " + yychar);
    }
%}

Newline    = \r | \n | \r\n
Whitespace = [ \t\f] | {Newline}
Number     = [0-9]+
String     = [A-Za-z0-9./:!]*

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment}
TraditionalComment = "/" {CommentContent} \+ "/"
EndOfLineComment = "//" [^\r\n]* {Newline}
CommentContent = ( [^] | \+[^/] )

ident = ([:jletter:] | "" ) ([:jletterdigit:] | [:jletter:] | "" )*


%eofval{
    return symbolFactory.newSymbol("EOF",sym.EOF);
%eofval}

%state CODESEG

%%  

<YYINITIAL> {
  {Whitespace} {                              }
  "+"          { return symbolFactory.newSymbol("PLUS", PLUS); }
  "-"          { return symbolFactory.newSymbol("MINUS", MINUS); }
  "*"          { return symbolFactory.newSymbol("TIMES", TIMES); }
  "n"          { return symbolFactory.newSymbol("UMINUS", UMINUS); }
  "("          { return symbolFactory.newSymbol("LPAREN", LPAREN); }
  ")"          { return symbolFactory.newSymbol("RPAREN", RPAREN); }
  {Number}     { return symbolFactory.newSymbol("NUMBER", NUMBER, Integer.parseInt(yytext())); }
  		"!DOCTYPE" { return symbolFactory.newSymbol("DOCTYPE", DOCTYPE);}
	"a" { return symbolFactory.newSymbol("A", A);}
	"abbr" { return symbolFactory.newSymbol("ABBR", ABBR);}
	"above" { return symbolFactory.newSymbol("ABOVE", ABOVE); }
	"accept-charset" { return symbolFactory.newSymbol("ACCEPT-CHARSET", ACCEPT_CHARSET); }
	"accept" { return symbolFactory.newSymbol("ACCEPT", ACCEPT); }
	"accesskey" { return symbolFactory.newSymbol("ACCESSKEY", ACCESSKEY);}
	"acronym" { return symbolFactory.newSymbol("ACRONYM", ACRONYM);}
	"action" { return symbolFactory.newSymbol("ACTION", ACTION);}
	"address" { return symbolFactory.newSymbol("ADDRESS", ADDRESS);}
	"align" { return symbolFactory.newSymbol("ALIGN", ALIGN); }
	"all" { return symbolFactory.newSymbol("ALL", ALL); }
	"alt" { return symbolFactory.newSymbol("ALT", ALT);}
	"archive" { return symbolFactory.newSymbol("ARCHIVE", ARCHIVE);}
	"area" { return symbolFactory.newSymbol("AREA", AREA);}
	"axis" { return symbolFactory.newSymbol("AXIS", AXIS); }
	"b" { return symbolFactory.newSymbol("B", B);}
	"base" { return symbolFactory.newSymbol("BASE", BASE);}
	"baseline" { return symbolFactory.newSymbol("BASELINE", BASELINE); }
	"bdo" { return symbolFactory.newSymbol("BDO", BDO);}
	"below" { return symbolFactory.newSymbol("BELOW", BELOW); }
	"big" { return symbolFactory.newSymbol("BIG", BIG);}
	"blockquote" { return symbolFactory.newSymbol("BLOCKQUOTE", BLOCKQUOTE);}
	"body" { return symbolFactory.newSymbol("BODY", BODY);}
	"border" { return symbolFactory.newSymbol("BORDER", BORDER); }
	"bottom" { return symbolFactory.newSymbol("BOTTOM", BOTTOM); }
	"box" { return symbolFactory.newSymbol("BOX", BOX); }
	"br" { return symbolFactory.newSymbol("BR", BR);}
	"button" { return symbolFactory.newSymbol("BUTTON", BUTTON);}
	"caption" { return symbolFactory.newSymbol("CAPTION", CAPTION); }
	"cellpadding" { return symbolFactory.newSymbol("CELLPADDING", CELLPADDING); }
	"cellspacing" { return symbolFactory.newSymbol("CELLSPACING", CELLSPACING); }
	"center" { return symbolFactory.newSymbol("CENTER", CENTER); }
	"char" { return symbolFactory.newSymbol("CHAR", CHAR); }
	"charoff" { return symbolFactory.newSymbol("CHAROFF", CHAROFF); }
	"charset" { return symbolFactory.newSymbol("CHARSET", CHARSET);}
	"checked" { return symbolFactory.newSymbol("CHECKED", CHECKED); }
	"chekbox" { return symbolFactory.newSymbol("CHECKBOX", CHECKBOX); }
	"circle" { return symbolFactory.newSymbol("CIRCLE", CIRCLE);}
	"cite" { return symbolFactory.newSymbol("CITE", CITE);}
	"class" { return symbolFactory.newSymbol("CLASS", CLASS);}
	"classid" { return symbolFactory.newSymbol("CLASSID", CLASSID);}
	"code" { return symbolFactory.newSymbol("CODE", CODE);}
	"codebase" { return symbolFactory.newSymbol("CODEBASE", CODEBASE);}
	"codetype" { return symbolFactory.newSymbol("CODETYPE", CODETYPE);}
	"col" { return symbolFactory.newSymbol("COL", COL); }
	"colgroup" { return symbolFactory.newSymbol("COLGROUP", COLGROUP); }
	"cols" { return symbolFactory.newSymbol("COLS", COLS); }
	"colspan" { return symbolFactory.newSymbol("COLSPAN", COLSPAN); }
	"content" { return symbolFactory.newSymbol("CONTENT", SCHEME);}
	"coords" { return symbolFactory.newSymbol("COORDS", COORDS);}
	"data" { return symbolFactory.newSymbol("DATA", DATA);}
	"datetime" { return symbolFactory.newSymbol("DATETIME", DATETIME);}
	"dd" { return symbolFactory.newSymbol("DD", DD);}
	"declare" { return symbolFactory.newSymbol("DECLARE", DECLARE);}
	"default" { return symbolFactory.newSymbol("DEFAULT", DEFAULT);}
	"del" { return symbolFactory.newSymbol("DEL", DEL);}
	"dfn" { return symbolFactory.newSymbol("DFN", DFN);}
	"dir" { return symbolFactory.newSymbol("DIR", DIR);}
	"disabled" { return symbolFactory.newSymbol("DISABLED", DISABLED); }
	"div" { return symbolFactory.newSymbol("DIV", DIV);}
	"dl" { return symbolFactory.newSymbol("DL", DL);}
	"dt" { return symbolFactory.newSymbol("DT", DT);}
	"em" { return symbolFactory.newSymbol("EM", EM);}
	"enctype" { return symbolFactory.newSymbol("ENCTYPE", ENCTYPE); }
	"fieldset" { return symbolFactory.newSymbol("FIELDSET", FIELDSET);}
	"file" { return symbolFactory.newSymbol("FILE", FILE); }
	"for" { return symbolFactory.newSymbol("FOR", FOR); }
	"form" { return symbolFactory.newSymbol("FORM", FORM);}
	"frame" { return symbolFactory.newSymbol("FRAME", FRAME); }
	"groups" { return symbolFactory.newSymbol("GROUPS", GROUPS); }
	"h1" { return symbolFactory.newSymbol("H1", H1);}
	"h2" { return symbolFactory.newSymbol("H2", H2);}
	"h3" { return symbolFactory.newSymbol("H3", H3);}
	"h4" { return symbolFactory.newSymbol("H4", H4);}
	"h5" { return symbolFactory.newSymbol("H5", H5);}
	"h6" { return symbolFactory.newSymbol("H6", H6);}
	"head" { return symbolFactory.newSymbol("HEAD", HEAD);}
	"headers" { return symbolFactory.newSymbol("HEADERS", HEADERS); }
	"height" { return symbolFactory.newSymbol("HEIGHT", HEIGHT);}
	"hidden" { return symbolFactory.newSymbol("HIDDEN", HIDDEN); }
	"hr" { return symbolFactory.newSymbol("HR", HR);}
	"href" { return symbolFactory.newSymbol("HREF", HREF);}
	"hreflang" { return symbolFactory.newSymbol("HREFLANG", HREFLANG);}
	"hsides" { return symbolFactory.newSymbol("HSIDES", HSIDES); }
	"html" { return symbolFactory.newSymbol("HTML", HTML);}
	"http-equiv" { return symbolFactory.newSymbol("HTTPEQUIV", HTTPEQUIV);}
	"i" { return symbolFactory.newSymbol("I", I);}
	"id" { return symbolFactory.newSymbol("ID", ID);}
	"img" { return symbolFactory.newSymbol("IMG", IMG);}
	"input" { return symbolFactory.newSymbol("INPUT", INPUT);}
	"ins" { return symbolFactory.newSymbol("INS", INS);}
	"ismap" { return symbolFactory.newSymbol("ISMAP", ISMAP);}
	"justify" { return symbolFactory.newSymbol("JUSTIFY", JUSTIFY); }
	"kbd" { return symbolFactory.newSymbol("KBD", KBD);}
	"label" { return symbolFactory.newSymbol("LABEL", LABEL);}
	"lang" { return symbolFactory.newSymbol("LANG", LANG);}
	"left" { return symbolFactory.newSymbol("LEFT", LEFT); }
	"legend" { return symbolFactory.newSymbol("LEGEND", LEGEND); }
	"lhs" { return symbolFactory.newSymbol("LHS", LHS); }
	"li" { return symbolFactory.newSymbol("LI", LI);}
	"link" { return symbolFactory.newSymbol("LINK", LINK);}
	"longdesc" { return symbolFactory.newSymbol("LONGDESC", LONGDESC);}
	"map" { return symbolFactory.newSymbol("MAP", MAP);}
	"maxlength" { return symbolFactory.newSymbol("MAXLENGTH", MAXLENGTH); }
	"media" { return symbolFactory.newSymbol("MEDIA", MEDIA);}
	"meta" { return symbolFactory.newSymbol("META", META);}
	"method" { return symbolFactory.newSymbol("METHOD", METHOD);}
	"middle" { return symbolFactory.newSymbol("MIDDLE", MIDDLE); }
	"multiple" { return symbolFactory.newSymbol("MULTIPLE", MULTIPLE); }
	"name" { return symbolFactory.newSymbol("NAME", NAME);}
	"nohref" { return symbolFactory.newSymbol("NOHREF", NOHREF);}
	"none" { return symbolFactory.newSymbol("NONE", NONE); }
	"noscript" { return symbolFactory.newSymbol("NOSCRIPT", NOSCRIPT);}
	"object" { return symbolFactory.newSymbol("OBJECT", OBJECT);}
	"ol" { return symbolFactory.newSymbol("OL", OL);}
	"onblur" { return symbolFactory.newSymbol("ONBLUR", ONBLUR);}
	"onchange" { return symbolFactory.newSymbol("ONCHANGE", ONCHANGE); }
	"onclick" { return symbolFactory.newSymbol("ONCLICK", ONCLICK);}
	"ondblclick" { return symbolFactory.newSymbol("ONDBLCLICK", ONDBLCLICK);}
	"onfocus" { return symbolFactory.newSymbol("ONFOCUS", ONFOCUS);}
	"onkeydown" { return symbolFactory.newSymbol("ONKEYDOWN", ONKEYDOWN);}
	"onkeypress" { return symbolFactory.newSymbol("ONKEYPRESS", ONKEYPRESS);}
	"onkeyup" { return symbolFactory.newSymbol("ONKEYUP", ONKEYUP);}
	"onmousedown" { return symbolFactory.newSymbol("ONMOUSEDOWN", ONMOUSEDOWN);}
	"onmousemove" { return symbolFactory.newSymbol("ONMOUSEMOVE", ONMOUSEMOVE);}
	"onmouseout" { return symbolFactory.newSymbol("ONMOUSEOUT", ONMOUSEOUT);}
	"onmouseup" { return symbolFactory.newSymbol("ONMOUSEUP", ONMOUSEUP);}
	"onreset" { return symbolFactory.newSymbol("ONRESET", ONRESET); }
	"onselect" { return symbolFactory.newSymbol("ONSELECT", ONSELECT); }
	"onsubmit" { return symbolFactory.newSymbol("ONSUBMIT", ONSUBMIT); }
	"optgroup" { return symbolFactory.newSymbol("OPTGROUP", OPTGROUP); }
	"option" { return symbolFactory.newSymbol("OPTION", OPTION); }
	"p" { return symbolFactory.newSymbol("P", P);}
	"param" { return symbolFactory.newSymbol("PARAM", PARAM);}
	"password" { return symbolFactory.newSymbol("PASSWORD", PASSWORD); }
	"poly" { return symbolFactory.newSymbol("POLY", POLY);}
	"pre" { return symbolFactory.newSymbol("PRE", PRE);}
	"profile" { return symbolFactory.newSymbol("PROFILE", PROFILE);}
	"PUBLIC" { return symbolFactory.newSymbol("PUBLIC", PUBLIC);} 
	"q" { return symbolFactory.newSymbol("Q", Q);}
	"radio" { return symbolFactory.newSymbol("RADIO", RADIO); }
	"readonly" { return symbolFactory.newSymbol("READONLY", READONLY); }
	"rect" { return symbolFactory.newSymbol("RECT", RECT);}
	"rel" { return symbolFactory.newSymbol("REL", REL);}
	"reset" { return symbolFactory.newSymbol("RESET", RESET); }
	"rev" { return symbolFactory.newSymbol("REV", REV);}
	"rhs" { return symbolFactory.newSymbol("RHS", RHS); }
	"right" { return symbolFactory.newSymbol("RIGHT", RIGHT); }
	"row" { return symbolFactory.newSymbol("ROW", ROW); }
	"rowgroup" { return symbolFactory.newSymbol("ROWGROUP", ROWGROUP); }
	"rows" { return symbolFactory.newSymbol("ROWS", ROWS); }
	"rowspan" { return symbolFactory.newSymbol("ROWSPAN", ROWSPAN); }
	"rules" { return symbolFactory.newSymbol("RULES", RULES); }
	"samp" { return symbolFactory.newSymbol("SAMP", SAMP);}
	"scheme" { return symbolFactory.newSymbol("SCHEME", SCHEME);}
	"scope" { return symbolFactory.newSymbol("SCOPE", SCOPE); }
	"script" { return symbolFactory.newSymbol("SCRIPT", SCRIPT);}
	"select" { return symbolFactory.newSymbol("SELECT", SELECT);}
	"shape" { return symbolFactory.newSymbol("SHAPE", SHAPE);}
	"size" { return symbolFactory.newSymbol("SIZE", SIZE); }
	"small" { return symbolFactory.newSymbol("SMALL", SMALL);}
	"span" { return symbolFactory.newSymbol("SPAN", SPAN); }
	"src" { return symbolFactory.newSymbol("SRC", SRC);}
	"standby" { return symbolFactory.newSymbol("STANDBY", STANDBY);}
	"strong" { return symbolFactory.newSymbol("STRONG", STRONG);}
	"style" { return symbolFactory.newSymbol("STYLE", STYLE);}
	"sub" { return symbolFactory.newSymbol("SUB", SUB);}
	"submit" { return symbolFactory.newSymbol("SUBMIT", SUBMIT); }
	"summary" { return symbolFactory.newSymbol("SUMMARY", SUMMARY); }
	"sup" { return symbolFactory.newSymbol("SUP", SUP);}
	"tabindex" { return symbolFactory.newSymbol("TABINDEX", TABINDEX);}
	"table" { return symbolFactory.newSymbol("TABLE", TABLE);}
	"tbody" { return symbolFactory.newSymbol("TBODY", TBODY); }
	"td" { return symbolFactory.newSymbol("TD", TD); }
	"text" { return symbolFactory.newSymbol("TEXT", TEXT); }
	"textarea" { return symbolFactory.newSymbol("TEXTAREA", TEXTAREA);}
	"tfoot" { return symbolFactory.newSymbol("TFOOT", TFOOT); }
	"th" { return symbolFactory.newSymbol("TH", TH); }
	"thead" { return symbolFactory.newSymbol("THEAD", THEAD); }
	"title" { return symbolFactory.newSymbol("TITLE", TITLE);}
	"top" { return symbolFactory.newSymbol("TOP", TOP); }
	"tr" { return symbolFactory.newSymbol("TR", TR); }
	"tt" { return symbolFactory.newSymbol("TT", TT);}
	"type" { return symbolFactory.newSymbol("TYPE", TYPE);}
	"ul" { return symbolFactory.newSymbol("UL", UL);}
	"usemap" { return symbolFactory.newSymbol("USEMAP", USEMAP);}
	"valign" { return symbolFactory.newSymbol("VALIGN", VALIGN); }
	"value" { return symbolFactory.newSymbol("VALUE", VALUE);}
	"valuetype" { return symbolFactory.newSymbol("VALUETYPE", VALUETYPE);}
	"var" { return symbolFactory.newSymbol("VAR", VAR);}
	"void" { return symbolFactory.newSymbol("VOID", VOID); }
	"vsides" { return symbolFactory.newSymbol("VSIDES", VSIDES); }
	"width" { return symbolFactory.newSymbol("WIDTH", WIDTH);}
	"xml:lang" { return symbolFactory.newSymbol("XML_LANG", XML_LANG);}
	"xml:space" { return symbolFactory.newSymbol("XML_SPACE", XML_SPACE);}
	"xmlns" { return symbolFactory.newSymbol("XMLNS", XMLNS);}
  	";"          	{ return symbolFactory.newSymbol("SEMI", SEMI);}
  	"\""			{ return symbolFactory.newSymbol("QUATATION_MARKS", QUATATION_MARKS);}
  	"&"			{ return symbolFactory.newSymbol("OPEN_SYMBOL", OPEN_SYMBOL);}
  	"</"			{ return symbolFactory.newSymbol("OPEN_CLOSING_TAG", OPEN_CLOSING_TAG);}
  	"="			{ return symbolFactory.newSymbol("ATTR_ASSIGN", ATTR_ASSIGN);}
  	">"			{ return symbolFactory.newSymbol("CLOSE_TAG", CLOSE_TAG);}
"<"			{ return symbolFactory.newSymbol("OPEN_TAG", OPEN_TAG);}
	{String}		{ return symbolFactory.newSymbol("STRING", STRING, yytext()); }
}



// error fallback
.|\n          { emit_warning("Unrecognized character '" +yytext()+"' -- ignored"); }