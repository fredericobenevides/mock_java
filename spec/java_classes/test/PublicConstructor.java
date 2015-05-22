package test;

import java.util.Arrays;

public class PublicConstructor {

	private String message;

	public PublicConstructor() {
		message = "Default Constructor";
	}

	public PublicConstructor(String msg1) {
		message = "Constructor 1: " + msg1;
	}

	public PublicConstructor(String msg1, String msg2) {
		message = "Constructor 2: " + msg1 + " " + msg2;
	}

	public PublicConstructor(String... msgs) {
		message = "Constructor Varargs1: " + Arrays.toString(msgs);
	}

	public String getMessage() {
		return message;
	}
}
