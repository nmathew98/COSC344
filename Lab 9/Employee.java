/*
 * Store employee details
 */

public class Employee {
	private String fname;
	private String lname;
	private int salary;

	public Employee(String fname, String lname, int salary) {
		this.fname = fname;
		this.lname = lname;
		this.salary = salary;
	}

	@Override
	public String toString() {
		return( (fname + spaces(15 - fname.length())) +
			(lname + spaces(15 - lname.length())) +
			(salary + spaces(15 - Integer.toString(salary).length())) );
	}

	public int compare(int salary) {
		return this.salary < salary ? -1 : this.salary == salary ? 0 : 1;
	}

	public String getFname() {
		return fname;
	}

	public String getLname() {
		return lname;
	}

	public int getSalary() {
		return salary;
	}

	private String spaces (int number) {
		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < number; i++) {
			buf.append(' ');
		}

		return buf.toString();
	}
}
