package edu.iot.butter.test;

import com.google.gson.Gson;

import edu.iot.butter.model.Member;

public class GsonTest {
	public static void main(String[] args) {
		Member member = new Member();
		member.setUserId("hong");
		member.setName("홍길동");
		member.setPassword("1234");
		
		Gson gson = new Gson();
		String json = gson.toJson(member); //객체 인스턴스를 문자열로 변환할 때 toJson.
		//e다시 변환할 떄 : from Json
		System.out.println(json);
		Member member2= gson.fromJson(json, Member.class);
		System.out.println(member2);
	}
}
