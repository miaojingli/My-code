package 第十章.作业;

import java.io.*;
import java.util.*;

public class ObjectStream {

	List<String> list = new ArrayList<>();
	String s = null;

	public static void main(String[] args) throws IOException {
		CreatFile creatFile1=new CreatFile("D:\\file1.txt");
		CreatFile creatFile2=new CreatFile("D:\\\\file2.txt");
		creatFile1.write("今天");
		creatFile2.write("JAVA考试");
		ObjectStream fileStream = new ObjectStream();
		fileStream.readFileContent();
		fileStream.write2File();
	}

	private void readFileContent() throws IOException {

		FileReader fr = new FileReader("D:\\file2.txt");
		BufferedReader bf = new BufferedReader(fr);
		while ((s = bf.readLine()) != null) {
			list.add(s);
		}
		System.out.println(list);
		bf.close();
		fr.close();
	}

	private void write2File() throws IOException {

		FileWriter fout = new FileWriter("D:\\file1.txt", true);

		BufferedWriter bout = new BufferedWriter(fout);
		for (int i = 0; i < list.size(); i++) {
			bout.write(list.get(i));
		}

		bout.close();
		fout.close();

	}
}
