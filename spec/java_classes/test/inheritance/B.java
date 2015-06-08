package test.inheritance;

public class B extends A {

	public void methodB() {
		addToOutput("Method B");
	}

	public void runMethod() {
		methodA();
		methodB();
	}
}
