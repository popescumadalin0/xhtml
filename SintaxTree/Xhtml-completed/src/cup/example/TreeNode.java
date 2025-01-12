package cup.example;
import java.util.ArrayList;
import java.util.List;

public class TreeNode {
	private String data;
	private List<TreeNode> children;
	private List<TreeNode> brotherNodes;
	private int childrenCount = 0; 
	private boolean shouldBeDisplayed = true;

	public TreeNode(String data) {
        this.data = data;
        this.children = new ArrayList<>();
        this.brotherNodes = new ArrayList<>(); 
    }
	
	public int getChildrenCount()
	{		
		return childrenCount;
	}
	
	public TreeNode addChild(String childData)
	{
		TreeNode addedNode = new TreeNode(childData);
		children.add(addedNode);
		return addedNode;
	}
	
	public void addChild(TreeNode child) {
		if (child != null) {
			children.add(child);
			childrenCount += child.childrenCount + 1;
		}
	}
	
	public void addBrother(TreeNode child) {
		if (child != null) {
			brotherNodes.add(child);
		}
	}
	
	public String getData() {
		return data;
	}
	
	public void setData(String data) {
		this.data = data;
	}
	
	public TreeNode[] getChildren() {
		TreeNode[] childrenArray = new TreeNode[children.size()];		
		return children.toArray(childrenArray);
	}
	
	public TreeNode[] getBrotherNodes() {
		TreeNode[] brothersArray = new TreeNode[brotherNodes.size()];		
		return brotherNodes.toArray(brothersArray);
	}
	
	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}
	
	public boolean shouldBeDisplayed() {
		return shouldBeDisplayed;
	}
	
	public void setShouldBeDisplayed(boolean displayNode) {
		this.shouldBeDisplayed = displayNode;
	}
	
	public static TreeNode createNode(String nodeName, TreeNode... children) {
	    TreeNode node = new TreeNode(nodeName);

	    for (TreeNode child : children) {
	        if (child != null) {
	            node.addChild(child);
	        }
	    }

	    return node;
	}
	
	public void printNode(int level)
	{
		for (int i = 0; i < level; i++)
		{
			System.out.print(" ");
		}
		System.out.print(data);
//		if (extraData != null && extraData.length() > 0)
//		{
//			System.out.print(" - " + extraData + " - ");
//		}
//		System.out.println("");
		
		for (TreeNode multiTreeNode : children) {
			multiTreeNode.printNode(level + 1);
		}
	}
}
