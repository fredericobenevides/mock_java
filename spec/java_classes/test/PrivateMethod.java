package test;

public class PrivateMethod {

	private String className = "PrivateMethod";

	public PrivateMethod() {
	}

	private String getPrivateMethod() {
		return this.className;
	}

	private String getPrivateMethodArg1(String arg1) {
		return arg1;
	}

	private String getPrivateMethodArg2(String arg1, String arg2) {
		return arg1 + " " + arg2;
	}

	private String[] getPrivateMethodVarargs(String... args) {
		return args;
	}
}
