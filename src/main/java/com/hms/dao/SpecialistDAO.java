package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hms.entity.Specialist;

public class SpecialistDAO {
	
	private Connection conn;

	public SpecialistDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecialist(String sp) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into specialist (specialist_name) values(?)";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			
			pstmt.setString(1, sp);
			
			pstmt.executeUpdate();
			
			f = true;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
		
	}
	
	public List<Specialist> getAllSpecialist(){
		
		List<Specialist> spList = new ArrayList<Specialist>();
		
		Specialist specialistObj = null;
		
		try {
			
			String sql = "select * from specialist";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			ResultSet resultSet = pstmt.executeQuery();
			
			while(resultSet.next()) {
				
				//create object
				specialistObj = new Specialist();

				specialistObj.setId(resultSet.getInt(1));
				specialistObj.setSpecialistName(resultSet.getString(2));
				
				//now add specialist object into List 
				spList.add(specialistObj);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return spList;
	}
	public Specialist getSpecialistById(int id) {
	    Specialist specialist = null;
	    try {
	        String sql = "SELECT * FROM specialist WHERE id=?";
	        PreparedStatement pstmt = this.conn.prepareStatement(sql);
	        pstmt.setInt(1, id);
	        ResultSet resultSet = pstmt.executeQuery();
	        if (resultSet.next()) {
	            specialist = new Specialist();
	            specialist.setId(resultSet.getInt("id"));
	            specialist.setSpecialistName(resultSet.getString("specialist_name"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return specialist;
	}

}

