package cup.example;
import java.util.ArrayList;
import java.util.List;

public class Element {
	private String data;
	private List<Element> descendingren;
	private List<Element> collateralElements;
	private boolean displayable = true;

	public Element(String data) {
        this.data = data;
        this.descendingren = new ArrayList<>();
        this.collateralElements = new ArrayList<>(); 
    }
	
	public void addDescending(Element descending) {
		if (descending != null) {
			descendingren.add(descending);
		}
	}
	
	public void addCollateral(Element descending) {
		if (descending != null) {
			collateralElements.add(descending);
		}
	}
	
	public String getData() {
		return data;
	}
	
	public void setData(String data) {
		this.data = data;
	}
	
	public List<Element> getDescendings() {
		return descendingren;
	}
	
	public List<Element> getCollateralElements() {
		return collateralElements;
	}
	
	public void setDescendings(List<Element> descendingren) {
		this.descendingren = descendingren;
	}
	
	public boolean getDisplayable() {
		return displayable;
	}
	
	public void setDisplayable(boolean displayElement) {
		this.displayable = displayElement;
	}
	
	public static Element createElement(String elementName, Element... descendingren) {
	    Element element = new Element(elementName);

	    for (Element descending : descendingren) {
	        if (descending != null) {
	            element.addDescending(descending);
	        }
	    }

	    return element;
	}
}
