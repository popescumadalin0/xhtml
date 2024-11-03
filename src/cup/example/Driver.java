package cup.example;

import java.util.List;

class Driver {

	public static void main(String[] args) throws Exception {
		Parser parser = new Parser(); 
		parser.parse();
		
		var root = parser.getRootElement();
		
		printOutput(root, 0);
		 
		/*ComplexSymbolFactory symbolFactory = new ComplexSymbolFactory();
		  File file = new File("input.txt");
		  FileInputStream fis = null;
		  try {
		    fis = new FileInputStream(file);
		  } catch (IOException e) {
		    e.printStackTrace();
		  } 
		  Lexer lexer = new Lexer(symbolFactory,fis);
		  
		  Symbol s = null;
		  do {
			  s = lexer.next_token();
			  System.out.println(s.toString());
		  } while (s.sym != sym.EOF);*/
	}
	
	public static void printOutput(Element element, int depth) {
        if (element == null) {
            return;
        }

        if (element.getDisplayable() && element.getData() != null && !element.getData().equals("tel")) {
        	for (int i = 0; i < depth; i++) {
        		System.out.print("  ");
        	}
        	System.out.println(element.getData());
        }

        var descendings = element.getDescendings();
        var collaterals = element.getCollateralElements();
        
        if (element.getData() == null) {
        	descendings.forEach(descending -> printOutput(descending, depth));
        } else {
        	descendings.forEach(descending -> printOutput(descending, depth + 1));
        }
        collaterals.forEach(collateral -> printOutput(collateral, depth));
    }
	
}
