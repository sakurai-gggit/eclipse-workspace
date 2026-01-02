package practice11;

import java.util.logging.Logger;

public class TryCatchFinallySample {

	public static void main(String args[]) {
		Logger logger = Logger.getLogger(TryCatchFinallySample.class.getName());//?
		//ConsoleHandler consoleHandler=new ConsoleHandler();
		//consoleHandler.setLevel(Level.INFO);
		//logger.addHandler(consoleHandler);

		try {
			logger.warning("try");
			//			System.out.println("try");
			if (args.length > 0 && args[0].equals("test")) {
				throw new IllegalArgumentException();
			}

		} catch (IllegalArgumentException e) {
			logger.severe("catch");
			//			System.out.println("catch");

		} finally {
			logger.info("finally");
			//			System.out.println("finally");
		}

	}

}
