package com.shopmilk;

import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

	public static long[] getPrice(String priceRange) { // Range format :
														// "from-to"
		long[] price = new long[2];
		String price1 = "", price2 = "";
		int index = priceRange.indexOf("-");
		for (int i = 0; i < index; i++) {
			price1 += priceRange.charAt(i);
		}
		for (int i = index + 1; i < priceRange.length(); i++) {
			price2 += priceRange.charAt(i);
		}

		price[0] = Integer.parseInt(price1);
		price[1] = Integer.parseInt(price2);
		return price;
	}

	public static void main(String[] args) {
		long[] price = getPrice("1000000-2000000");
		for (int i = 0; i < price.length; i++) {
			System.out.print(price[i] + " ");
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		System.out.println(dateFormat.format(date));
	}
}
