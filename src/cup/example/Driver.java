package cup.example;

import java.util.List;

class Driver {

	public static void main(String[] args) throws Exception {
		Parser parser = new Parser(); 
		parser.parse();
		 
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
}
