package edu.sbu.matchmaster;
import java.sql.Date;
public class EmployeeBean {
    String ssn;
    Date startDate;
    int rate;
    String first;
    String last;

    public EmployeeBean(String ssn, Date startDate, int rate, String first, String last){
        this.ssn = ssn;
        this.startDate = startDate;
        this.rate = rate;
        this.first = first;
        this.last = last;
    }

    public String getSsn(){return ssn;}
    public Date getStartDate(){return startDate;}
    public int getRate(){return rate;}
    public String getFirst(){return first;}
    public String getLast(){return last;}
}
