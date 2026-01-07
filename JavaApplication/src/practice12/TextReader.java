package practice12;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Logger;

public class TextReader {
	private String path;

	private static Logger logger = Logger.getLogger(TextReader.class.getName());

	public enum Status {
		START, END
	};

	private TextReader(String path) {
		this.path = path;
	}

	private void execute() {
		//        List<Integer> valueList = new ArrayList<>();
		ObjectList<Integer> valueList = new ObjectList<>();

		try (BufferedReader br = new BufferedReader(new FileReader(path))) {
			String line;
			while ((line = br.readLine()) != null) {
				valueList.add(Integer.parseInt(line));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		for (Integer value : valueList.getList()) {
			System.out.println(value);
		}
	}

	public static void main(String... args) {
		logger.info(Status.START.name());
		new TextReader(args[0]).execute();
		logger.info(Status.END.name());
	}

}