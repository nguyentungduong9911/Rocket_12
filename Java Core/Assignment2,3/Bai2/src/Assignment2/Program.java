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
					System.out.println("Nhân viên này chưa có phòng ban");
				} else {
					System.out.println("Nhân viên này có phòng ban" + account1.department.name);
				}
	 // 02
				if (account1.groups == null) {
					System.out.println("Nhân viên này chưa có group");
				}else if( account1.groups.length == 1 || account1.groups.length == 2) {
					System.out.println("Group của nhân viên này là:");
					for(Group group:groupOfAccount2) {
					System.out.println(group.name);
					}
				}
	//03
				System.out.println(account2.department == null ? "Nhân viên này chưa có phòng ban" : "Phòng ban của nhân viên này là" + account2.department.name);
				
	// 04
				System.out.println(account1.position.name == PositionName.DEV  ? "Đây là Developer"  : "Người này không phải la Developer") ; 
	// 05
				
				switch (accountOfGroups1.length) {
				case 1:
					System.out.println("Nhóm có 1 thành viên");
					break;
				case 2:
					System.out.println("Nhóm có 2 thành viên");
					break;
				case 3:
					System.out.println("Nhóm có 3 thành viên");
					break;
				default:
					System.out.println("Nhóm có nhiều thành viên");
					break;
				}	
		// 06
				switch (account2.groups.length) {
				case 0:
					System.out.println("Nhân viên này chưa có group");
					break;
				case 1:
					System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
				case 2:
					System.out.println("Group của nhân viên này là Java Fresher, C# Fresher");
					break;
				case 3:
					System.out.println("Nhân viên này là người quan trọng. tham gia nhiều group");
					break;
				default:
					System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
				}
 	// 07
		int checkAccount = (account1.position.name == PositionName.DEV ? 1:2);
		switch (checkAccount) {
		case 1:
			System.out.println("Đây là Develop");
			break;
		case 2:
			System.out.println("Người này không phải là Develop");
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
		//Khai báo 2 số lương có kiểu dữ liệu là float.
		//Khởi tạo Lương của Account 1 là 5240.5 $
		//Khởi tạo Lương của Account 2 là 10970.055$
		//Khai báo 1 số int để làm tròn Lương của Account 1 và in số int đó ra
		//Khai báo 1 số int để làm tròn Lương của Account 2 và in số int đó ra
			float Luong1;
			float Luong2;
			Luong1 = (float) 5240.5;
			Luong2 = (float) 10970.055;
			System.out.println ("Luong1:"+Luong1+" || Luong2:"+Luong2);
			
			int roundLuong1 = (int)Luong1;
			int roundLuong2 = (int)Luong2;
			System.out.println("roundLuong1:"+roundLuong1+" || roundLuong2:"+roundLuong2);
		
//			Question 4: Viết 1 method nhập vào 2 số nguyên a và b và trả về thương của chúng
			
			int a,b;
			Scanner scanner = new Scanner (System.in);
			System.out.println("Nhập a = ");
			a = scanner.nextInt();
			do {
				System.out.println("Nhập b =");
				b = scanner.nextInt();
				if (b == 0) {
					System.out.println("Vui lòng nhập b khác 0 !");
				}
			}while (b==0);
			scanner.close();
			System.out.println("Thương:"+(float)a / (float)b);
			
		// Exercise 2:Không sử dụng data đã insert từ bài trước, tạo 1 array Account và khởi 
//			tạo 5 phần tử theo cú pháp (sử dụng vòng for để khởi tạo):
//				 Email: "Email 1"
//				 Username: "User name 1"
//				 FullName: "Full name 1"
//				 CreateDate: now
			
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
				// Khởi tạo lương có datatype là Integer có giá trị bằng 5000.
				// Sau đó convert lương ra float và hiển thị lương lên màn hình (với số
				// float có 2 số sau dấu thập phân)
				public static void question1() {
					Integer salary = 5000;
					System.out.printf("%2.2f", (float) salary);
				}

				// Question 2:
				// Khai báo 1 String có value = "1234567"
				// Hãy convert String đó ra số int
				public static void question2() {
					String s1 = "1234567";
					Integer a = Integer.parseInt(s1);
					System.out.println(a);
				}

				// Question 3:
				// Khởi tạo 1 số Integer có value là chữ "1234567"
				// Sau đó convert số trên thành datatype int
				public static void question3() {
					Integer a = 1234567;
					int b = a.intValue();
					System.out.println(b);
				}
			}

			
	}
		
}










