
public class Dog {

		int doDaiChan;
		int doRongMom;
		
		float thoiGianAn(String loaiThucAn, int doDaiThucAn) {
			float thoiGianAn = 0f;
			if (loaiThucAn == "Ba�nh mi�") {
				thoiGianAn = doDaiThucAn/0.2f;
			}
			else {
				thoiGianAn = doDaiThucAn/0.5f;
			}
			return thoiGianAn;
			
		}
}

