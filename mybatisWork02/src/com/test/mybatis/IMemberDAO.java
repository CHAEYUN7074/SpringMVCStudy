/*=======================
 * IMemberDAO.java
 - 인터페이스
 - 멤버 DAO를 만들기 위한 틀이다.
 ***이제는 마이바티스를 쓰면서
 *DAO를 XML로 설계를...(자바가 XML 품고 있는게 아니라, 쿼리문만 있으면 된다 BUT 뭐가 각각의 역할을 하는지 알 수 있는 방법입 없으니까 인터페이스를 만들어야해)
=========================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IMemberDAO
{
	//필요한 메소드 들을 선언만 하면 된다.
	//EXCEPTION THROWS 하는게 없다.
	public int add(MemberDTO m); //클래스..객체 개념
	public int count();
	public ArrayList<MemberDTO> list();
	
	
	public int modify(MemberDTO m);
	public int remove(MemberDTO m); //이렇게 구성하면 MemberDTO 넘겨주는거
}
