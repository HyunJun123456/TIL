package com.multi.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.multi.dto.MDBoardDto;

import static common.JDBCTemplate.*;
public class MDBoardDao {
	//게시판 목록
	public List<MDBoardDto> selectAll() {
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<MDBoardDto> res = new ArrayList<>();
		
		String sql = " SELECT * FROM MDBOARD ORDER BY SEQ DESC ";
		
		try {
			stmt = con.createStatement();
			System.out.println("03.query 준비: "+sql);
			
			rs = stmt.executeQuery(sql);
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				MDBoardDto tmp = new MDBoardDto();
				tmp.setSeq(rs.getInt(1));
				tmp.setWriter(rs.getString(2));
				tmp.setTitle(rs.getString(3));
				tmp.setContent(rs.getString(4));
				tmp.setRegdate(rs.getDate(5));
				
				res.add(tmp);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				con.close();
				System.out.println("05.db 종료\n");
			} catch (SQLException e) {
				System.out.println("05.db 종료 에러\n");
				e.printStackTrace();
			}
		}
		return res;
	}
	
	//글선택
	public MDBoardDto selectOne(int seq) {
		
		return null;
	}
	
	
	//글작성
	public int insert(MDBoardDto dto) {
		return 0;
		
	}
	
	//글수정
	public int update(MDBoardDto dto) {
		return 0;
	}
	
	//글삭제
	public int delete(int seq) {
		return 0;
	}
	
	//다중삭제
	public int multiDelete(String[] seq) {
		return 0;
		
	}
	
}
