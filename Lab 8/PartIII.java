/*
	Lab08 Part II
*/

import java.io.*;
import java.util.*;
import java.sql.*;

public class PartIII {
	public static final String ANSI_RESET = "\u001B[0m";
	public static final String ANSI_BLUE = "\u001B[34m";
	public static final String ANSI_GREEN = "\u001B[32m";
	public static final String ANSI_RED = "\u001B[31m";

	public static void main (String[] args) {
		new PartIII().go();
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
			System.out.println(ANSI_BLUE + "Connection URL: " + url + ANSI_RESET);
			con = DriverManager.getConnection(url, user, pass);
			System.out.println(ANSI_BLUE + "Connected to Oracle" + ANSI_RESET);
			System.out.println("\nInitial salaries of employees");
			getEmployees(con);
			System.out.println("\nGiving everybody a 10% pay rise ...");
			System.out.println(ANSI_GREEN + updateEmployeeSalaries(con) + " rows updated!" + ANSI_RESET);
			getEmployees(con);
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

	// Get all employees
	private void getEmployees(Connection con) {
		try {
			Statement stmt = con.createStatement();
			ResultSet resultSet = stmt.executeQuery("SELECT fname, lname, ssn, salary FROM employee");
			ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
			int columns = resultSetMetaData.getColumnCount();
			System.out.println("FNAME          LNAME          SSN            SALARY");
			System.out.println("---------------------------------------------------");
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

	// Update employee salaries
	private int updateEmployeeSalaries(Connection con) {
		int rows = -1;
		try {
			Statement stmt = con.createStatement();
			rows = stmt.executeUpdate("UPDATE employee SET salary = 1.1 * salary");
		} catch (SQLException e) {
			quit(e.getMessage());
		}

		return rows;
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
		System.err.println(ANSI_RED + message + ANSI_RESET);
		System.exit(1);
	}
}
