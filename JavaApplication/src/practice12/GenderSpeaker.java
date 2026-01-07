package practice12;

public class GenderSpeaker {
	public static void main(String[] args) {
		Man man = new Man();
		Woman woman = new Woman();

		doSpeak(man);
		doSpeak(woman);

	}

	public static void doSpeak(AbstractPerson person) {
		person.speak();

	}
}
