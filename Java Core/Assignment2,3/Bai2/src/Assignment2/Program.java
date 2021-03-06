package Assignment2;

import java.time.LocalDate;
import java.util.Date;
import java.util.Scanner;

import javax.print.attribute.SetOfIntegerSyntax;

public class Program {

	public static void main(String[] args) {
		// Create Department
		Group group1 = new Group();
		group1.id = 1;
		group1.name = "Java Fresher";
		group1.createDate = new Date(2020, 04, 21);

		Group group2 = new Group();
		group2.id = 2;
		group2.name = "DB Fresher";
		group2.createDate = new Date(2020, 04, 21);

		Group group3 = new Group();
		group3.id = 3;
		group3.name = "C++ Fresher";
		group3.createDate = new Date(2020, 04, 16);

		// Create Deparment
		Department department1 = new Department();
		department1.id = 1;
		department1.name = "Sale";

		Department department2 = new Department();
		department2.id = 2;
		department2.name = "Marketting";

		Department department3 = new Department();
		department3.id = 3;
		department3.name = "HR";

		// Create Position
		Position position1 = new Position();
		position1.id = 1;
		position1.name = PositionName.DEV;

		Position position2 = new Position();
		position2.id = 2;
		position2.name = PositionName.PM;

		Position position3 = new Position();
		position3.id = 3;
		position3.name = PositionName.SCRUM_MASTER;
		
		Position position4 = new Position();
		position4.id = 4;
		position4.name = PositionName.TEST;

		// Create account
		Account account1 = new Account();
		account1.id = 1;
		account1.createDate = new Date(2020, 03, 17);
		account1.department = department1;
		account1.email = "An@gmail.com";
		account1.fullname = "Nguyen Van An";
		account1.position = position1;
		account1.username = "an.nguyenvan";
		 

		Account account2 = new Account();
		account2.id = 2;
		account2.createDate = new Date(2020, 01, 9);
		account2.department = department1;
		account2.email = "Linh@gmail.com";
		account2.fullname = "Nguyen Hoai Linh";
		account2.position = position3;
		account2.username = "Linh.nguyenhoai";

		Account account3 = new Account();
		account3.id = 3;
		account3.createDate = new Date(2020, 03, 19);
		account3.department = department2;
		account3.email = "ha@gmail.com";
		account3.fullname = "Pham Hai Ha";
		account3.position = position1;
		account3.username = "Ha.phamhai";

		// add group to account
		Group[] groupOfAccount1 = { group1 };
		account1.groups = groupOfAccount1;

		Group[] groupOfAccount2 = { group3 };
		account2.groups = groupOfAccount2;

		Group[] groupOfAccount3 = { group1 };
		account3.groups = groupOfAccount3;

		// add account to group
		Account[] accountOfGroups1 = { account1, account2, account3 };
		group1.accounts = accountOfGroups1;
		
		
		//01
				if (account1.department == null) {
					System.out.println("Nh??n vi??n n??y ch??a c?? ph??ng ban");
				} else {
					System.out.println("Nh??n vi??n n??y c?? ph??ng ban" + account1.department.name);
				}
	 // 02
				if (account1.groups == null) {
					System.out.println("Nh??n vi??n na??y ch??a co?? group");
				}else if( account1.groups.length == 1 || account1.groups.length == 2) {
					System.out.println("Group cu??a nh??n vi??n na??y la??:");
					for(Group group:groupOfAccount2) {
					System.out.println(group.name);
					}
				}
	//03
				System.out.println(account2.department == null ? "Nh??n vi??n na??y ch??a co?? pho??ng ban" : "Pho??ng ban cu??a nh??n vi??n na??y la??" + account2.department.name);
				
	// 04
				System.out.println(account1.position.name == PositionName.DEV  ? "????y la?? Developer"  : "Ng??????i na??y kh??ng pha??i la Developer") ; 
	// 05
				
				switch (accountOfGroups1.length) {
				case 1:
					System.out.println("Nho??m co?? 1 tha??nh vi??n");
					break;
				case 2:
					System.out.println("Nho??m co?? 2 tha??nh vi??n");
					break;
				case 3:
					System.out.println("Nho??m co?? 3 tha??nh vi??n");
					break;
				default:
					System.out.println("Nho??m co?? nhi????u tha??nh vi??n");
					break;
				}	
		// 06
				switch (account2.groups.length) {
				case 0:
					System.out.println("Nh??n vi??n na??y ch??a co?? group");
					break;
				case 1:
					System.out.println("Group cu??a nh??n vi??n na??y la?? Java Fresher, C# Fresher");
				case 2:
					System.out.println("Group cu??a nh??n vi??n na??y la?? Java Fresher, C# Fresher");
					break;
				case 3:
					System.out.println("Nh??n vi??n na??y la?? ng??????i quan tro??ng. tham gia nhi????u group");
					break;
				default:
					System.out.println("Nh??n vi??n na??y la?? ng??????i ho??ng chuy????n, tham gia t????t ca?? ca??c group");
				}
 	// 07
		int checkAccount = (account1.position.name == PositionName.DEV ? 1:2);
		switch (checkAccount) {
		case 1:
			System.out.println("????y la?? Develop");
			break;
		case 2:
			System.out.println("Ng??????i na??y kh??ng pha??i la?? Develop");
			break;
		}
	
		//08
		Account[] acco = {account1, account2, account3};
		for (Account element : acco) {
			System.out.println(element.email);
			System.out.println(element.fullname);
			System.out.println(element.department.name);
		}
		
		// Assignment 3 - Exercise1-  Question 3: 
		//Khai b??o 2 s??? l????ng c?? ki???u d??? li???u l?? float.
		//Kh???i t???o L????ng c???a Account 1 l?? 5240.5 $
		//Kh???i t???o L????ng c???a Account 2 l?? 10970.055$
		//Khai b??o 1 s??? int ????? l??m tr??n L????ng c???a Account 1 v?? in s??? int ???? ra
		//Khai b??o 1 s??? int ????? l??m tr??n L????ng c???a Account 2 v?? in s??? int ???? ra
			float Luong1;
			float Luong2;
			Luong1 = (float) 5240.5;
			Luong2 = (float) 10970.055;
			System.out.println ("Luong1:"+Luong1+" || Luong2:"+Luong2);
			
			int roundLuong1 = (int)Luong1;
			int roundLuong2 = (int)Luong2;
			System.out.println("roundLuong1:"+roundLuong1+" || roundLuong2:"+roundLuong2);
		
//			Question 4: Vi???t 1 method nh???p v??o 2 s??? nguy??n a v?? b v?? tr??? v??? th????ng c???a ch??ng
			
			int a,b;
			Scanner scanner = new Scanner (System.in);
			System.out.println("Nh????p a = ");
			a = scanner.nextInt();
			do {
				System.out.println("Nh????p b =");
				b = scanner.nextInt();
				if (b == 0) {
					System.out.println("Vui lo??ng nh????p b kha??c 0 !");
				}
			}while (b==0);
			scanner.close();
			System.out.println("Th????ng:"+(float)a / (float)b);
			
		// Exercise 2:Kh??ng s??? d???ng data ???? insert t??? b??i tr?????c, t???o 1 array Account v?? kh???i 
//			t???o 5 ph???n t??? theo c?? ph??p (s??? d???ng v??ng for ????? kh???i t???o):
//				??? Email: "Email 1"
//				??? Username: "User name 1"
//				??? FullName: "Full name 1"
//				??? CreateDate: now
			
			Account[] accounts = new Account[5];
			for (int i=0; i<5; i++) {
				Account account = new Account();
				account.email = "Email " + (i + 1);
				account.username = "Username " + (i + 1);
				account.fullname = "Full name " + (i + 1);
				account.createDate = LocalDate.now();
				accounts[i] = account;
			}
				for (Account account : accounts) {
					System.out.println(account.email);
					System.out.println(account.username);
					System.out.println(account.fullname);
					System.out.println(account.createDate);
					System.out.println("\n");
			}
//			//public class BoxingAndUnboxing {

			
					

				//Exercise3- Question 1:
				// Kh???i t???o l????ng c?? datatype l?? Integer c?? gi?? tr??? b???ng 5000.
				// Sau ???? convert l????ng ra float v?? hi???n th??? l????ng l??n m??n h??nh (v???i s???
				// float c?? 2 s??? sau d???u th???p ph??n)
				public static void question1() {
					Integer salary = 5000;
					System.out.printf("%2.2f", (float) salary);
				}

				// Question 2:
				// Khai b??o 1 String c?? value = "1234567"
				// H??y convert String ???? ra s??? int
				public static void question2() {
					String s1 = "1234567";
					Integer a = Integer.parseInt(s1);
					System.out.println(a);
				}

				// Question 3:
				// Kh???i t???o 1 s??? Integer c?? value l?? ch??? "1234567"
				// Sau ???? convert s??? tr??n th??nh datatype int
				public static void question3() {
					Integer a = 1234567;
					int b = a.intValue();
					System.out.println(b);
				}
			}

			
	}
		
}










