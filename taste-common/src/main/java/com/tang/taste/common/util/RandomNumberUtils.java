package com.tang.taste.common.util;

import java.util.Random;
/**
 * Java实用工具类库中的类java.util.Random提供了产生各种类型随机数的方法。
 * 它可以产生int、long、float、double以及Goussian等类型的随机数。
 * java.lang.Math中的方法random()只产生double型的随机数。
 */
public class RandomNumberUtils {

	static Random re = new Random();



	/**
	 * 获取len位数的手机验证码
	 * @param len 获取随机码的长度
	 * @return
	 */
	public static int getRandomCode(int len){

		// 因为nextInt(int n)方法的范围是从0开始的，
		//Random的nextInt(int n)方法返回一个[0, n)范围内的随机数
		// 所以需要把区间[100000,999999)转换成100000 + [0, 999999)。
		int lenNum = 1;
		for (int i=1 ; i<len;i++){
			lenNum = 10*lenNum;
		}
		int num = (int) ((Math.random()*9+1)*lenNum);
		return num;
	}


	public static void main(String[] args) {
		System.out.println(getRandomCode(5));
		// 使用java.lang.Math的random方法生成随机数
		System.out.println("Math.random(): " + Math.random());

		// 使用不带参数的构造方法构造java.util.Random对象
		System.out.println("使用不带参数的构造方法构造的Random对象:");
		// 产生各种类型的随机数
		// 按均匀分布产生整数
		System.out.println("int: " + re.nextInt());
		// 按均匀分布产生长整数
		System.out.println("long: " + re.nextLong());
		// 按均匀分布产生大于等于0，小于1的float数[0, 1)
		System.out.println("float: " + re.nextFloat());
		// 按均匀分布产生[0, 1)范围的double数
		System.out.println("double: " + re.nextDouble());
		// 按正态分布产生随机数
		System.out.println("Gaussian: " + re.nextGaussian());

		// 生成一系列随机数
		System.out.print("随机整数序列:");
		for (int i = 0; i < 5; i++) {
			System.out.print(re.nextInt() + "  ");
		}
		System.out.println();

		// 指定随机数产生的范围
		System.out.print("[0,10)范围内随机整数序列: ");
		for (int i = 0; i < 10; i++) {
			// Random的nextInt(int n)方法返回一个[0, n)范围内的随机数
			System.out.print(re.nextInt(10) + "  ");
		}
		System.out.println();
		System.out.print("[5,23)范围内随机整数序列: ");
		for (int i = 0; i < 10; i++) {
			// 因为nextInt(int n)方法的范围是从0开始的，
			// 所以需要把区间[5,28)转换成5 + [0, 23)。
			System.out.print(5 + re.nextInt(23) + "  ");
		}
		System.out.println();
		System.out.print("利用nextFloat()生成[0,99)范围内的随机整数序列: ");
		for (int i = 0; i < 10; i++) {
			System.out.print((int) (re.nextFloat() * 100) + "  ");
		}
		System.out.println();
		System.out.println();

		// 使用带参数的构造方法构造Random对象
		// 构造函数的参数是long类型，是生成随机数的种子。
		System.out.println("使用带参数的构造方法构造的Random对象:");
		Random ran2 = new Random(10);
		// 对于种子相同的Random对象，生成的随机数序列是一样的。
		System.out.println("使用种子为10的Random对象生成[0,10)内随机整数序列: ");
		for (int i = 0; i < 10; i++) {
			System.out.print(ran2.nextInt(10) + "  ");
		}
		System.out.println();
		Random ran3 = new Random(10);
		System.out.println("使用另一个种子为10的Random对象生成[0,10)内随机整数序列: ");
		for (int i = 0; i < 10; i++) {
			System.out.print(ran3.nextInt(10) + "  ");
		}
		System.out.println();
		// ran2和ran3生成的随机数序列是一样的，如果使用两个没带参数构造函数生成的Random对象，
		// 则不会出现这种情况，这是因为在没带参数构造函数生成的Random对象的种子缺省是当前系统时间的毫秒数。

		// 另外，直接使用Random无法避免生成重复的数字，如果需要生成不重复的随机数序列，需要借助数组和集合类
	}
}
