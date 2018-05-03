package edu.sbu.matchmaster;

import java.sql.*;
import java.text.SimpleDateFormat;

public class DateBean{
    private ProfileBean Profile1, Profile2;
    private EmployeeBean CustRep;
    private Timestamp dateTime;
    private String location;
    private double bookingFee;
    private String comments;
    private int user1Rating, user2Rating;

    public static DateBean  loadDate(String pid1, String pid2, Timestamp dateTime) throws SQLException, ClassNotFoundException{
        Connection conn = ConnectionUtils.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(
                "select * from Date where (Profile1 LIKE ? AND Profile2 LIKE ? AND Date_Time=?)"
        );

        pstmt.setString(1, pid1);
        pstmt.setString(2, pid2);
        System.out.println( dateTime.toString().split("\\.")[0]);
        pstmt.setTimestamp(3, dateTime);

        ResultSet rs = pstmt.executeQuery();
        System.out.println(dateTime);

        if(rs.next()){
            try{
                System.out.println("HERE?!?!?");
                DateBean retreivedDate = new DateBean(
                        ProfileBean.loadProfile(rs.getString(1)),
                        ProfileBean.loadProfile(rs.getString(2)),
                        EmployeeBean.loadEmployee(rs.getString(3)),
                        rs.getTimestamp(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9)
                );
                System.out.println("HERE?!?!?");
                conn.close();
                System.out.println("HERE222222");
                pstmt.close();
                System.out.println("HERE333333");
                rs.close();

                System.out.println("Date Retrieved!!!");
                return retreivedDate;
            } catch(Exception e){
                System.out.println("Retrieval Error ?????");
            } finally {
                conn.close();
                pstmt.close();
                rs.close();
            }
        }
        System.out.println("no date found");
        conn.close();
        pstmt.close();
        rs.close();
        return null;
    }


    public DateBean(ProfileBean profile1, ProfileBean profile2, EmployeeBean custRep, Timestamp dateTime, String location, double bookingFee, String comments, int user1Rating, int user2Rating){
        Profile1 = profile1;
        Profile2 = profile2;
        CustRep = custRep;
        this.dateTime = dateTime;
        this.location = location;
        this.bookingFee = bookingFee;
        this.comments = comments;
        this.user1Rating = user1Rating;
        this.user2Rating = user2Rating;
    }
    public void addComment(String commentToAdd) throws SQLException, ClassNotFoundException{
        this.comments += "; " + commentToAdd;
        Connection conn = ConnectionUtils.getConnection();
        PreparedStatement pstmt = conn.prepareStatement("update Date set Comments=? where (Profile1, Profile2, Date_Time)=(?,?,?)");
        pstmt.setString(1, comments);
        pstmt.setString(2, getProfile1().getID());
        pstmt.setString(3, getProfile2().getID());
        pstmt.setTimestamp(4, getDateTime());
    }
    public ProfileBean getProfile1(){
        return Profile1;
    }

    public ProfileBean getProfile2(){
        return Profile2;
    }

    public EmployeeBean getCustRep(){
        return CustRep;
    }

    public Timestamp getDateTime(){
        return dateTime;
    }

    public String getLocation(){
        return location;
    }

    public double getBookingFee(){
        return bookingFee;
    }

    public String getComments(){
        return comments;
    }

    public int getUser1Rating(){
        return user1Rating;
    }

    public int getUser2Rating(){
        return user2Rating;
    }
}
