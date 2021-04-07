package Department1;

import java.time.LocalDate;
import java.util.Date;

public class Program {

	public static void main(String[] args) {
		// Create Department
		Department1 department1 = new Department1(1, "Sale");
		department1.id = 1;
		department1.name = "Sale";
	
		Department2 department2 = new Department2(2, "Marketting");
		department2.id = 2;
		department2.name = "Marketting";
		
		// Create Position
		Position position1 = new Position();
		position1.id = 1;
		position1.name = "Sale";
		
		Position position2 = new Position();
		position1.id = 2;
		position1.name = "Marketing";
	
		// Create Account
		Account ac = new Account();
		ac.id = 1;
		ac.email = "nguyentungduong9911@gmail.com";
		ac.userName = "duong";
		ac.fullName = "nguyentungduong";
		ac.department = department1;
		ac.position = position1;
		ac.createDate = LocalDate.now();
		
		// Create Group
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "JavaFesher";
		Group group2 = new Group();
		group2.id = 2;
		group2.name = "C#Fresher";
		
		//Printf department
		System.out.println("Department 1 information: ");

		System.out.println("name: " + department1.name);
		System.out.println("id: " + department1.id);
		System.out.println("\n");

		System.out.println("Department 2 information: ");

		System.out.println("name: " + department2.name);
		System.out.println("id: " + department2.id);
		System.out.println("\n");
		
		//Printf account
		System.out.println("Account 1 information: ");
		System.out.println("id: " + ac.id);
		System.out.println("Email: " + ac.email);
		System.out.println("Department Name: " + ac.department.name);
		System.out.println("Create Date: " + ac.createDate);

	}
	
	
}
