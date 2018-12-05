package 第十章.作业;

import java.io.*;

public class CreatFile {
    private String fileName;
    
	public CreatFile(String fileName) {
		
		this.fileName = fileName;
	}
	
	public void write(String s)throws IOException{
		FileWriter fout=new FileWriter(this.fileName);
		BufferedWriter buf=new BufferedWriter(fout);
		buf.append(s);
		buf.close();
	}
}
