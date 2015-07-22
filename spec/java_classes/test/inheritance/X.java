package test.inheritance;

public class X {

	private String foo;
	private String bar;

	public X(String foo, String bar) {
		this.foo = foo;
		this.bar = bar;
	}

	public String output() {
		return foo + " " + bar;
	}
}
