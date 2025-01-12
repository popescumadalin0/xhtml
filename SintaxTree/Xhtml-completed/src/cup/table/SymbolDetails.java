package cup.table;

import java.util.ArrayList;

enum SymbolType { OpenTag, CloseTag, Value };

public class SymbolDetails {
	public String symbolName; // inner_text
	public ArrayList<AttributeDetails> atr; 
	public SymbolType symbolType;
}
