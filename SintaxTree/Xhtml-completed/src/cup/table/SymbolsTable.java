//package cup.table;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import cup.example.Element;
//import cup.example.MultiPathTree;
//import cup.example.MultiTree;
//import cup.example.Tree;
//import cup.example.TreeNode;
//
//public class SymbolsTable {
//
//	private MultiPathTree syntaxTree;
//	private HashMap<String, SymbolDetails> table = new HashMap<String, SymbolDetails>();
//
//	private void extractSymbolsFromNode(TreeNode node, String currentContext) {
//		String context = currentContext;
//
//		SymbolDetails details = new SymbolDetails();
//		details.context = currentContext;
//		details.symbolName = node.getData();
//		
//		
//		//details.symbolType = 
//				
//		table.put(details.symbolName, details);
//
//		for (int i = 0; i < node.getChildren().length; i++) {
//			extractSymbolsFromNode(node.getChildren()[i], details.symbolName);
//		}
//	}
//
//	public SymbolsTable(MultiPathTree syntaxTree) {
//		this.syntaxTree = syntaxTree;
//	}
//
//	public void createTable() {
//		extractSymbolsFromNode(syntaxTree.getRoot());
//	}
//
//	public SymbolDetails getSymbol(String symbol) {
//		if (table.containsKey(symbol)) {
//			return table.get(symbol);
//		}
//		return null;
//	}
//
//	public void printTable() {
//		for (Map.Entry<String, SymbolDetails> mapEntry : table.entrySet()) {
//			String symbol = mapEntry.getKey();
//			SymbolDetails details = mapEntry.getValue();
//			System.out.println("------------ SYMBOL: " + symbol + " -----------------");
//			System.out.println("Data Type: " + details.dataType);
//			System.out.println("Context: " + details.contextName);
//			System.out.println("Symbol Type: " + details.symbolType);
//			System.out.println("Symbol Scope: " + details.symbolScope);
//		}
//	}
//
//}
