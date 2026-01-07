package practice12;

public abstract class AbstractPerson {

	public abstract Gender getGender();

	public void speak() {
		if (getGender() == Gender.MAN) {
			System.out.println("I'm a man");

		} else if (getGender() == Gender.WOMAN) {
			System.out.println("I'm a woman");
		}

	}

}
