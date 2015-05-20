package test;

public class PublicMethod {

    private String className = "PublicMethod";

    public PublicMethod() {
    }

    public String getPublicMethod() {
        return this.className;
    }

    public String getPublicMethodArg1(String arg1) {
        return arg1;
    }

    public String getPublicMethodArg2(String arg1, String arg2) {
        return arg1 + " " + arg2;
    }

    public String[] getPublicMethodVarargs(String... args) {
        return args;
    }
}
