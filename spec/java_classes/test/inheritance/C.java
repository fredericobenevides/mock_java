package test.inheritance;

public class C extends B {

  public void methodC() {
		addToOutput("Method C");
  }

  public void runMethod() {
	  methodA();
	  methodB();
	  methodC();
  }
}
