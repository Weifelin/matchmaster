package edu.sbu.matchmaster;
import java.sql.Date;
public class EmployeeBean {
    String ssn;
    Date startDate;
    int rate;

    public EmployeeBean(String ssn, Date startDate, int rate){
        this.ssn = ssn;
        this.startDate = startDate;
        this.rate = rate;
    }

    public String getSsn(){return ssn;}
    public Date getStartDate(){return startDate;}
    public int getRate(){return rate;}
}
