package 第十章.例7;

import java.util.Scanner;

public class practice {

	public static void main(String[] args) {
		int a = 249;
		byte d=(byte) 130;
		byte e=2,r=3,t;
		t=(byte) (e+r);
		byte b=7;
		byte  c=(byte) (a+b);
		System.out.println(d);
		System.out.println(c);
		System.out.println(t);

		Scanner sc = new Scanner(System.in);
		
		System.out.print("请输入一个string：");
		String string=sc.nextLine();
		
		System.out.print("请输入一个数据：");
		int x=sc.nextInt();
		
		System.out.print("请输入一个数据：");
		int y=sc.nextInt();
		
		System.out.print("请输入一个数据：");
		int z=sc.nextInt();
		
		int max=(z>(x>y? x: y)? z:(x>y? x: y));
        boolean bool=(x==y);
		System.out.println("最大值是："+max);
		System.out.println(bool);
		System.out.println(string);
		
	}
	

}
