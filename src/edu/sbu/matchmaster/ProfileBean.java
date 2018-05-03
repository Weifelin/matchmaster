package edu.sbu.matchmaster;

import java.sql.*;
import java.util.Arrays;
import java.util.List;

public class ProfileBean {
    private int age;

    public int getAge(){
        return age;
    }

    public List<String> getHobbies(){
        return hobbies;
    }

    public void setID(String id){
        this.id = id;
    }

    public enum Gender{
        Male,Female,Other
    }

    public enum HairColor{
        Blonde,Black,Brown,Red
    }
    private String id;
    private String ssn;
    private int ageRangeStart;
    private int ageRangeEnd;
    private int geoRange;
    private Gender gender;
    private List<String> hobbies;
    private double height;
    private double weight;
    private HairColor color;
    private Date creationDate;
    private Date lastModDate;

    public ProfileBean(String id, String ssn, int age, int ageRangeStart, int ageRangeEnd, int geoRange,
                       Gender gender, List<String> hobbies, double height, double weight, HairColor color,
                       Date creationDate, Date lastModDate){

        this.id = id;
        this.ssn = ssn;
        this.age = age;
        this.ageRangeStart = ageRangeStart;
        this.ageRangeEnd = ageRangeEnd;
        this.geoRange = geoRange;
        this.gender = gender;
        this.hobbies = hobbies;
        this.height = height;
        this.weight = weight;
        this.color = color;
        this.creationDate = creationDate;
        this.lastModDate = lastModDate;
    }

    public String getID(){ return this.id;}
    public String getSSN(){ return this.ssn;}
    public int getAgeRangeStart(){ return this.ageRangeStart;}
    public int getAgeRangeEnd(){ return this.ageRangeEnd;}
    public int getGeoRange(){ return this.geoRange;}
    public Gender getGender(){ return this.gender;}
    public double getHeight(){ return this.height;}
    public double getWeight() { return this.weight;}
    public HairColor getHairColor(){ return this.color;}
    public Date getCreationDate(){ return this.creationDate;}
    public Date getLastModDate() { return this.lastModDate;}

    public static ProfileBean loadProfile(String pid) throws SQLException, ClassNotFoundException{
        Connection conn = ConnectionUtils.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(
                "select * from Profile where ProfileID=?"
        );
        pstmt.setString(1, pid);
        ResultSet rs = pstmt.executeQuery();
        conn.close();
        pstmt.close();
        if(rs.next()){
            ProfileBean prof = new ProfileBean(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getInt(3),
                    rs.getInt(4),
                    rs.getInt(5),
                    rs.getInt(6),
                    ProfileBean.Gender.valueOf(rs.getString(7)),
                    Arrays.asList(rs.getString(8).split(", ")),
                    rs.getInt(9),
                    rs.getInt(10),
                    ProfileBean.HairColor.valueOf(rs.getString(11)),
                    rs.getDate(12),
                    rs.getDate(13)
            );

            rs.close();
            return prof;
        } else return null;
    }
}
