package cup.example;

import java.util.List;

public class MultiPathTree {
	private TreeNode root;
	
	public void printTree() {
		if (root == null)
		{
			System.out.println("The tree was not created yet.");
			return;
		}
		
		root.printNode(0);
		System.out.println("Total elements: " + nodesCount);
	}

//	public void printNode(TreeNode node, int depth) {
//        if (node == null) {
//            return;
//        }
//
//        if (node.shouldBeDisplayed() && node.getData() != null && !node.getData().equals("tel")) {
//        	for (int i = 0; i < depth; i++) {
//        		System.out.print("  ");
//        	}
//        	System.out.println(node.getData());
//        }
//
//        List<TreeNode> children = node.getChildren();
//        List<TreeNode> brothers = node.getBrotherNodes();
//        if (node.getData() == null) {
//        	children.forEach(child -> printNode(child, depth));
//        } else {
//        	children.forEach(child -> printNode(child, depth + 1));
//        }
//        brothers.forEach(brother -> printNode(brother, depth));
//    }
	
	private int nodesCount = 0;
	
	public TreeNode getRoot()
	{
		return root;
	}
	
	public TreeNode create(String rootData) throws Exception
	{
		if (root != null)
		{
			throw new Exception("The three has already been created");			
		}
		
		root = new TreeNode(rootData);
		nodesCount = 1;
		return root;
	}
	
	public TreeNode create(String rootData, TreeNode child) throws Exception
	{
		TreeNode createdNode = create(rootData);
		root.addChild(child);
		nodesCount = root.getChildrenCount();
		return createdNode;
	}
	
	
	public TreeNode addChildNode(String childData)
	{		
		TreeNode newNode =  root.addChild(childData);
		nodesCount = getNodesCount() + 1;
		return newNode;
	}
	
	public TreeNode addChildNode(TreeNode child)
	{		
		root.addChild(child);
		nodesCount = getNodesCount() + child.getChildrenCount();
		return child;
	}


	public int getNodesCount() {
		return nodesCount;
	}
}
