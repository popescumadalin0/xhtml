package cup.example;

public class ParserWithTree extends Parser{

	public ParserWithTree() 
	{
		super();
	}
	protected MultiPathTree createDeclarationNode(MultiPathTree declaration) 
	{ 
		MultiPathTree newNode = new MultiPathTree("Declaration");
		newNode.addChild(declaration);
		return newNode;
	}
 	protected MultiPathTree createFunctionDeclarationNode(MultiPathTree typeSpecifier, String identifierName, MultiPathTree paramsList, MultiPathTree compoundStatement) 	
 	{ 
 		MultiPathTree newNode = new MultiPathTree("FunctionDeclaration", identifierName);
 		newNode.addChild(typeSpecifier);
 		if (paramsList != null)
 			newNode.addChild(paramsList);
 		newNode.addChild(compoundStatement);
 		return newNode; 
 	}
 	
  	protected MultiPathTree createTypeSpecifier(String typeName)
  	{ 
  		MultiPathTree newNode = new MultiPathTree("TypeSpecifier", typeName);
  		return newNode;
  	}
	protected MultiPathTree createListNode(String listName, MultiPathTree firstChild)
	{
		MultiPathTree newNode = new MultiPathTree(listName);
		newNode.addChild(firstChild);
		return newNode;
	}
	protected MultiPathTree createVarDeclaration(MultiPathTree typeSpecifier, String identifierName, Integer value )
	{
		MultiPathTree newNode = new MultiPathTree("VarDeclaration", identifierName);
		newNode.addChild(typeSpecifier);		
		newNode.addChild(new MultiPathTree("IntValue", "" + value));
		return newNode;
	}
	protected MultiPathTree createCompoundStatement(MultiPathTree declarations, MultiPathTree instructions)
	{
		MultiPathTree newNode = new MultiPathTree("CompoundStatement");
		if (declarations != null)
			newNode.addChild(declarations);
		if (instructions != null)
			newNode.addChild(instructions);
		return newNode;
	}
	
	protected MultiPathTree createIfStatement(String identifier, MultiPathTree ifInstructions, MultiPathTree elseInstructions)
	{
		MultiPathTree newNode = new MultiPathTree("IfStatement", identifier);
		newNode.addChild(ifInstructions);
		if (elseInstructions != null)
			newNode.addChild(elseInstructions);
		return newNode;
	}
}
