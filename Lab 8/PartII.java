/*
	Lab08 Part II
*/

import java.io.*;
import java.util.*;
import java.sql.*;

public class PartII {
	public static void main (String[] args) {
		new PartII().go();
	}

	/**
	 * Read login details, connect to Oracle, and run SQL statements
	 * @author Paul Werstein
	 * @author Naveen Mathew
	 */
	private void go() {
		// Read pass.dat
		UserPass login = new UserPass();
		String user = login.getUserName();
		String pass = login.getPassWord();
		String host = "silver.otago.ac.nz";

		Connection con = null;
		try {
			// Register driver and connect to Oracle
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
			System.out.println("Connection URL: " + url);
			con = DriverManager.getConnection(url, user, pass);
			System.out.println("Connected to Oracle");
			sql(con);
		} catch (SQLException e) {
			quit(e.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					quit(e.getMessage());
				}
			}
		}
	}

	// Runs the SQL command
	private void sql(Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet resultSet = stmt.executeQuery("SELECT * FROM department WHERE mgrssn='333445555'");
			ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
			int columns = resultSetMetaData.getColumnCount();
			System.out.println("\nDNAME          DNUMBER        MGRSSN         MGRSTARTDATE");
			System.out.println("----------------------------------------------------------------");
			while (resultSet.next()) {
				for (int i = 1; i <= columns; i++) {
					System.out.print(resultSet.getString(i) + spaces(15 - resultSet.getString(i).length()) );
				}
				System.out.println();
			}
		} catch (SQLException e) {
			quit(e.getMessage());
		}
	}

	// Puts 'number' of spaces into a buffer and returns it
	private String spaces (int number) {
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < number; i++) {
			buf.append(' ');
		}

		return buf.toString();
	}

	// Used to output an error message and exit
	private void quit (String message) {
		System.err.println(message);
		System.exit(1);
	}
}
