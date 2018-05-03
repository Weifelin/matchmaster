package edu.sbu.matchmaster;
import java.sql.*;

public class EmployeeBean {
    private String ssn;
    private Date startDate;
    private double rate;
    private String first;
    private String last;

    public EmployeeBean(String ssn, Date startDate, double rate, String first, String last){
        this.ssn = ssn;
        this.startDate = startDate;
        this.rate = rate;
        this.first = first;
        this.last = last;
    }

    public String getSsn(){return ssn;}
    public Date getStartDate(){return startDate;}
    public double getRate(){return rate;}
    public String getFirst(){return first;}
    public String getLast(){return last;}

    public static EmployeeBean loadEmployee(String ssn) throws SQLException, ClassNotFoundException{
        Connection conn = ConnectionUtils.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(
                "select E.SSN, E.StartDate, E.HourlyRate ,P.FirstName,P.LastName from Employee E, Person P where P.SSN=? and E.SSN=P.SSN"
        );
        pstmt.setString(1, ssn);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            EmployeeBean emp = new EmployeeBean(
                    rs.getString(1),
                    rs.getDate(2),
                    rs.getDouble(3),
                    rs.getString(4),
                    rs.getString(5)
            );
            conn.close();
            pstmt.close();
            rs.close();
            return emp;
        }
        conn.close();
        pstmt.close();
        rs.close();
        return null;
    }
}
