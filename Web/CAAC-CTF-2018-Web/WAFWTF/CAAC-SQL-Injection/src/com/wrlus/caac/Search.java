package com.wrlus.caac;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Scanner;

public class Search {
	
	public static String doSearch(String air) throws SecurityException {
		if(null==air || air.equals("")) {
			return "";
		}
		if(doWaf(air)==false) {
			throw new SecurityException("∫‹±ß«∏£¨ƒ˙Ã·Ωªµƒ≤Œ ˝ø…ƒ‹æﬂ”–π•ª˜––Œ™£¨“—±ªœµÕ≥π‹¿Ì‘±…Ë÷√¿πΩÿ°£");
		}
		Properties dbproperties = new Properties();
		InputStream dbconfig = Search.class.getResourceAsStream("/config/config.properties");
		try {
			dbproperties.load(dbconfig);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/caac", dbproperties);
			String sql = "select name,details from air where id = ?";
			System.out.println(sql);
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, air);
			ResultSet resultSet = ps.executeQuery();
			String result = "";
			while(resultSet.next()==true) {
				result += resultSet.getString(1)+" ";
				result += resultSet.getString(2)+" ";
				result += "<br>";
			}
			return result;
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
	}
	
	public static boolean doWaf(String air) {
		Scanner waffile = new Scanner(Search.class.getResourceAsStream("/config/waf.txt"));
		while(waffile.hasNextLine()==true) {
			String wafkeyword = waffile.nextLine();
			if (air.contains(wafkeyword)) {
				waffile.close();
				return false;
			}
		}
		waffile.close();
		return true;
	}
	
}
