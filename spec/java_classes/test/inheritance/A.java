package test.inheritance;

public class A {

	private StringBuilder output = new StringBuilder();

	public void methodA() {
		addToOutput("Method A");
	}

	public void runMethod() {
		hashCode();
		methodA();
	}

	protected void addToOutput(String description) {
		output.append(description).append(" ");
	}

	public String output() {
		return output.toString();
	}
}
