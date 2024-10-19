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
  	"<"			{ return symbolFactory.newSymbol("OPEN_TAG", OPEN_TAG);}
  	"</"			{ return symbolFactory.newSymbol("OPEN_CLOSING_TAG", OPEN_CLOSING_TAG);}
  	">"			{ return symbolFactory.newSymbol("CLOSE_TAG", CLOSE_TAG);}
  	"="			{ return symbolFactory.newSymbol("ATTR_ASSIGN", ATTR_ASSIGN);}
  	"\""			{ return symbolFactory.newSymbol("QUATATION_MARKS", QUATATION_MARKS);}
  	"&"			{ return symbolFactory.newSymbol("OPEN_SYMBOL", OPEN_SYMBOL);}
  	";"          	{ return symbolFactory.newSymbol("SEMI", SEMI);}
	"!DOCTYPE" { return symbolFactory.newSymbol("DOCTYPE", DOCTYPE);}
	"PUBLIC" { return symbolFactory.newSymbol("PUBLIC", PUBLIC);} 
	"rect" { return symbolFactory.newSymbol("RECT", RECT);}
	"circle" { return symbolFactory.newSymbol("CIRCLE", CIRCLE);}
	"poly" { return symbolFactory.newSymbol("POLY", POLY);}
	"default" { return symbolFactory.newSymbol("DEFAULT", DEFAULT);}
	"id" { return symbolFactory.newSymbol("ID", ID);}
	"class" { return symbolFactory.newSymbol("CLASS", CLASS);}
	"style" { return symbolFactory.newSymbol("STYLE", STYLE);}
	"title" { return symbolFactory.newSymbol("TITLE", TITLE);}
	"lang" { return symbolFactory.newSymbol("LANG", LANG);}
	"xml:lang" { return symbolFactory.newSymbol("XML_LANG", XML_LANG);}
	"dir" { return symbolFactory.newSymbol("DIR", DIR);}
	"onclick" { return symbolFactory.newSymbol("ONCLICK", ONCLICK);}
	"ondblclick" { return symbolFactory.newSymbol("ONDBLCLICK", ONDBLCLICK);}
	"onmousedown" { return symbolFactory.newSymbol("ONMOUSEDOWN", ONMOUSEDOWN);}
	"onmouseup" { return symbolFactory.newSymbol("ONMOUSEUP", ONMOUSEUP);}
	"onmousemove" { return symbolFactory.newSymbol("ONMOUSEMOVE", ONMOUSEMOVE);}
	"onmouseout" { return symbolFactory.newSymbol("ONMOUSEOUT", ONMOUSEOUT);}
	"onkeypress" { return symbolFactory.newSymbol("ONKEYPRESS", ONKEYPRESS);}
	"onkeydown" { return symbolFactory.newSymbol("ONKEYDOWN", ONKEYDOWN);}
	"onkeyup" { return symbolFactory.newSymbol("ONKEYUP", ONKEYUP);}
	"accesskey" { return symbolFactory.newSymbol("ACCESSKEY", ACCESSKEY);}
	"tabindex" { return symbolFactory.newSymbol("TABINDEX", TABINDEX);}
	"onfocus" { return symbolFactory.newSymbol("ONFOCUS", ONFOCUS);}
	"onblur" { return symbolFactory.newSymbol("ONBLUR", ONBLUR);}
	"br" { return symbolFactory.newSymbol("BR", BR);}
	"bdo" { return symbolFactory.newSymbol("BDO", BDO);}
	"map" { return symbolFactory.newSymbol("MAP", MAP);}
	"object" { return symbolFactory.newSymbol("OBJECT", OBJECT);}
	"img" { return symbolFactory.newSymbol("IMG", IMG);}
	"tt" { return symbolFactory.newSymbol("TT", TT);}
	"i" { return symbolFactory.newSymbol("I", I);}
	"b" { return symbolFactory.newSymbol("B", B);}
	"big" { return symbolFactory.newSymbol("BIG", BIG);}
	"small" { return symbolFactory.newSymbol("SMALL", SMALL);}
	"em" { return symbolFactory.newSymbol("EM", EM);}
	"strong" { return symbolFactory.newSymbol("STRONG", STRONG);}
	"dfn" { return symbolFactory.newSymbol("DFN", DFN);}
	"code" { return symbolFactory.newSymbol("CODE", CODE);}
	"q" { return symbolFactory.newSymbol("Q", Q);}
	"samp" { return symbolFactory.newSymbol("SAMP", SAMP);}
	"kbd" { return symbolFactory.newSymbol("KBD", KBD);}
	"var" { return symbolFactory.newSymbol("VAR", VAR);}
	"cite" { return symbolFactory.newSymbol("CITE", CITE);}
	"abbr" { return symbolFactory.newSymbol("ABBR", ABBR);}
	"acronym" { return symbolFactory.newSymbol("ACRONYM", ACRONYM);}
	"sub" { return symbolFactory.newSymbol("SUB", SUB);}
	"sup" { return symbolFactory.newSymbol("SUP", SUP);}
	"input" { return symbolFactory.newSymbol("INPUT", INPUT);}
	"select" { return symbolFactory.newSymbol("SELECT", SELECT);}
	"textarea" { return symbolFactory.newSymbol("TEXTAREA", TEXTAREA);}
	"label" { return symbolFactory.newSymbol("LABEL", LABEL);}
	"button" { return symbolFactory.newSymbol("BUTTON", BUTTON);}
	"ins" { return symbolFactory.newSymbol("INS", INS);}
	"del" { return symbolFactory.newSymbol("DEL", DEL);}
	"script" { return symbolFactory.newSymbol("SCRIPT", SCRIPT);}
	"noscript" { return symbolFactory.newSymbol("NOSCRIPT", NOSCRIPT);}
	"a" { return symbolFactory.newSymbol("A", A);}
	"h1" { return symbolFactory.newSymbol("H1", H1);}
	"h2" { return symbolFactory.newSymbol("H2", H2);}
	"h3" { return symbolFactory.newSymbol("H3", H3);}
	"h4" { return symbolFactory.newSymbol("H4", H4);}
	"h5" { return symbolFactory.newSymbol("H5", H5);}
	"h6" { return symbolFactory.newSymbol("H6", H6);}
	"ul" { return symbolFactory.newSymbol("UL", UL);}
	"ol" { return symbolFactory.newSymbol("OL", OL);}
	"li" { return symbolFactory.newSymbol("LI", LI);}
	"dl" { return symbolFactory.newSymbol("DL", DL);}
	"dt" { return symbolFactory.newSymbol("DT", DT);}
	"dd" { return symbolFactory.newSymbol("DD", DD);}
	"pre" { return symbolFactory.newSymbol("PRE", PRE);}
	"hr" { return symbolFactory.newSymbol("HR", HR);}
	"blockquote" { return symbolFactory.newSymbol("BLOCKQUOTE", BLOCKQUOTE);}
	"p" { return symbolFactory.newSymbol("P", P);}
	"div" { return symbolFactory.newSymbol("DIV", DIV);}
	"fieldset" { return symbolFactory.newSymbol("FIELDSET", FIELDSET);}
	"table" { return symbolFactory.newSymbol("TABLE", TABLE);}
	"form" { return symbolFactory.newSymbol("FORM", FORM);}
	"html" { return symbolFactory.newSymbol("HTML", HTML);}
	"head" { return symbolFactory.newSymbol("HEAD", HEAD);}
	"body" { return symbolFactory.newSymbol("BODY", BODY);}
	"xmlns" { return symbolFactory.newSymbol("XMLNS", XMLNS);}
	"meta" { return symbolFactory.newSymbol("META", META);}
	"link" { return symbolFactory.newSymbol("LINK", LINK);}
	"base" { return symbolFactory.newSymbol("BASE", BASE);}
	"profile" { return symbolFactory.newSymbol("PROFILE", PROFILE);}
	"href" { return symbolFactory.newSymbol("HREF", HREF);}
	"http-equiv" { return symbolFactory.newSymbol("HTTPEQUIV", HTTPEQUIV);}
	"name" { return symbolFactory.newSymbol("NAME", NAME);}
	"content" { return symbolFactory.newSymbol("CONTENT", SCHEME);}
	"scheme" { return symbolFactory.newSymbol("SCHEME", SCHEME);}
	"charset" { return symbolFactory.newSymbol("CHARSET", CHARSET);}
	"hreflang" { return symbolFactory.newSymbol("HREFLANG", HREFLANG);}
	"type" { return symbolFactory.newSymbol("TYPE", TYPE);}
	"rel" { return symbolFactory.newSymbol("REL", REL);}
	"rev" { return symbolFactory.newSymbol("REV", REV);}
	"media" { return symbolFactory.newSymbol("MEDIA", MEDIA);}
	"xml:space" { return symbolFactory.newSymbol("XML_SPACE", XML_SPACE);}
	"address" { return symbolFactory.newSymbol("ADDRESS", ADDRESS);}
	"datetime" { return symbolFactory.newSymbol("DATETIME", DATETIME);}
	"shape" { return symbolFactory.newSymbol("SHAPE", SHAPE);}
	"coords" { return symbolFactory.newSymbol("COORDS", COORDS);}
	"param" { return symbolFactory.newSymbol("PARAM", PARAM);}
	"declare" { return symbolFactory.newSymbol("DECLARE", DECLARE);}
	"classid" { return symbolFactory.newSymbol("CLASSID", CLASSID);}
	"codebase" { return symbolFactory.newSymbol("CODEBASE", CODEBASE);}
	"data" { return symbolFactory.newSymbol("DATA", DATA);}
	"codetype" { return symbolFactory.newSymbol("CODETYPE", CODETYPE);}
	"archive" { return symbolFactory.newSymbol("ARCHIVE", ARCHIVE);}
	"standby" { return symbolFactory.newSymbol("STANDBY", STANDBY);}
	"height" { return symbolFactory.newSymbol("HEIGHT", HEIGHT);}
	"width" { return symbolFactory.newSymbol("WIDTH", WIDTH);}
	"usemap" { return symbolFactory.newSymbol("USEMAP", USEMAP);}
	"value" { return symbolFactory.newSymbol("VALUE", VALUE);}
	"valuetype" { return symbolFactory.newSymbol("VALUETYPE", VALUETYPE);}
	"src" { return symbolFactory.newSymbol("SRC", SRC);}
	"alt" { return symbolFactory.newSymbol("ALT", ALT);}
	"longdesc" { return symbolFactory.newSymbol("LONGDESC", LONGDESC);}
	"ismap" { return symbolFactory.newSymbol("ISMAP", ISMAP);}
	"area" { return symbolFactory.newSymbol("AREA", AREA);}
	"nohref" { return symbolFactory.newSymbol("NOHREF", NOHREF);}
	"action" { return symbolFactory.newSymbol("ACTION", ACTION);}
	"method" { return symbolFactory.newSymbol("METHOD", METHOD);}
	"enctype" { return symbolFactory.newSymbol("ENCTYPE", ENCTYPE); }
	"onsubmit" { return symbolFactory.newSymbol("ONSUBMIT", ONSUBMIT); }
	"onreset" { return symbolFactory.newSymbol("ONRESET", ONRESET); }
	"accept" { return symbolFactory.newSymbol("ACCEPT", ACCEPT); }
	"accept-charset" { return symbolFactory.newSymbol("ACCEPT-CHARSET", ACCEPT_CHARSET); }
	"for" { return symbolFactory.newSymbol("FOR", FOR); }
	"text" { return symbolFactory.newSymbol("TEXT", TEXT); }
	"password" { return symbolFactory.newSymbol("PASSWORD", PASSWORD); }
	"chekbox" { return symbolFactory.newSymbol("CHECKBOX", CHECKBOX); }
	"radio" { return symbolFactory.newSymbol("RADIO", RADIO); }
	"submit" { return symbolFactory.newSymbol("SUBMIT", SUBMIT); }
	"reset" { return symbolFactory.newSymbol("RESET", RESET); }
	"file" { return symbolFactory.newSymbol("FILE", FILE); }
	"hidden" { return symbolFactory.newSymbol("HIDDEN", HIDDEN); }
	"checked" { return symbolFactory.newSymbol("CHECKED", CHECKED); }
	"disabled" { return symbolFactory.newSymbol("DISABLED", DISABLED); }
	"readonly" { return symbolFactory.newSymbol("READONLY", READONLY); }
	"size" { return symbolFactory.newSymbol("SIZE", SIZE); }
	"maxlength" { return symbolFactory.newSymbol("MAXLENGTH", MAXLENGTH); }
	"onselect" { return symbolFactory.newSymbol("ONSELECT", ONSELECT); }
	"onchange" { return symbolFactory.newSymbol("ONCHANGE", ONCHANGE); }
	"multiple" { return symbolFactory.newSymbol("MULTIPLE", MULTIPLE); }
	"optgroup" { return symbolFactory.newSymbol("OPTGROUP", OPTGROUP); }
	"option" { return symbolFactory.newSymbol("OPTION", OPTION); }
	"rows" { return symbolFactory.newSymbol("ROWS", ROWS); }
	"cols" { return symbolFactory.newSymbol("COLS", COLS); }
	"legend" { return symbolFactory.newSymbol("LEGEND", LEGEND); }
	"void" { return symbolFactory.newSymbol("VOID", VOID); }
	"above" { return symbolFactory.newSymbol("ABOVE", ABOVE); }
	"below" { return symbolFactory.newSymbol("BELOW", BELOW); }
	"hsides" { return symbolFactory.newSymbol("HSIDES", HSIDES); }
	"lhs" { return symbolFactory.newSymbol("LHS", LHS); }
	"rhs" { return symbolFactory.newSymbol("RHS", RHS); }
	"vsides" { return symbolFactory.newSymbol("VSIDES", VSIDES); }
	"box" { return symbolFactory.newSymbol("BOX", BOX); }
	"border" { return symbolFactory.newSymbol("BORDER", BORDER); }
	"none" { return symbolFactory.newSymbol("NONE", NONE); }
	"groups" { return symbolFactory.newSymbol("GROUPS", GROUPS); }
	"all" { return symbolFactory.newSymbol("ALL", ALL); }
	"char" { return symbolFactory.newSymbol("CHAR", CHAR); }
	"charoff" { return symbolFactory.newSymbol("CHAROFF", CHAROFF); }
	"align" { return symbolFactory.newSymbol("ALIGN", ALIGN); }
	"left" { return symbolFactory.newSymbol("LEFT", LEFT); }
	"center" { return symbolFactory.newSymbol("CENTER", CENTER); }
	"right" { return symbolFactory.newSymbol("RIGHT", RIGHT); }
	"justify" { return symbolFactory.newSymbol("JUSTIFY", JUSTIFY); }
	"valign" { return symbolFactory.newSymbol("VALIGN", VALIGN); }
	"top" { return symbolFactory.newSymbol("TOP", TOP); }
	"middle" { return symbolFactory.newSymbol("MIDDLE", MIDDLE); }
	"bottom" { return symbolFactory.newSymbol("BOTTOM", BOTTOM); }
	"baseline" { return symbolFactory.newSymbol("BASELINE", BASELINE); }
	"caption" { return symbolFactory.newSymbol("CAPTION", CAPTION); }
	"thead" { return symbolFactory.newSymbol("THEAD", THEAD); }
	"tfoot" { return symbolFactory.newSymbol("TFOOT", TFOOT); }
	"tbody" { return symbolFactory.newSymbol("TBODY", TBODY); }
	"colgroup" { return symbolFactory.newSymbol("COLGROUP", COLGROUP); }
	"col" { return symbolFactory.newSymbol("COL", COL); }
	"tr" { return symbolFactory.newSymbol("TR", TR); }
	"th" { return symbolFactory.newSymbol("TH", TH); }
	"td" { return symbolFactory.newSymbol("TD", TD); }
	"summary" { return symbolFactory.newSymbol("SUMMARY", SUMMARY); }
	"frame" { return symbolFactory.newSymbol("FRAME", FRAME); }
	"rules" { return symbolFactory.newSymbol("RULES", RULES); }
	"cellspacing" { return symbolFactory.newSymbol("CELLSPACING", CELLSPACING); }
	"cellpadding" { return symbolFactory.newSymbol("CELLPADDING", CELLPADDING); }
	"span" { return symbolFactory.newSymbol("SPAN", SPAN); }
	"row" { return symbolFactory.newSymbol("ROW", ROW); }
	"rowgroup" { return symbolFactory.newSymbol("ROWGROUP", ROWGROUP); }
	"axis" { return symbolFactory.newSymbol("AXIS", AXIS); }
	"headers" { return symbolFactory.newSymbol("HEADERS", HEADERS); }
	"scope" { return symbolFactory.newSymbol("SCOPE", SCOPE); }
	"rowspan" { return symbolFactory.newSymbol("ROWSPAN", ROWSPAN); }
	"colspan" { return symbolFactory.newSymbol("COLSPAN", COLSPAN); }
	{String}		{ return symbolFactory.newSymbol("STRING", STRING, yytext()); }
}



// error fallback
.|\n          { emit_warning("Unrecognized character '" +yytext()+"' -- ignored"); }