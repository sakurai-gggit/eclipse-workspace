package practice12;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.stream.IntStream;

public class Lambda {
	public static void main(String[] args) {
		LocalDateTime now = LocalDateTime.now();

		DateTimeFormatter fm = DateTimeFormatter.ofPattern("HH:mm:ss.SSS");

//		System.out.println(now.format(fm));

		IntStream.range(1, 10000).forEach(i -> System.out.println(now.format(fm) + " " + i));

	}
}
