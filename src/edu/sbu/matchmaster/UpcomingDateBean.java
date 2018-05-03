package edu.sbu.matchmaster;
import java.sql.Date;
public class UpcomingDateBean {
    String pid1;
    String pid2;
    String location;
    Date date;

    public UpcomingDateBean(String p1, String p2, String l, Date d){
        this.pid1 = p1;
        this.pid2 = p2;
        this.location = l;
        this.date = d;

    }

    public String getProfile1(){return pid1;}
    public String getProfile2(){return pid2;}
    public String getLocation(){return location;}
    public Date getDate(){return date;}
}
//p1id, -p2id,location, time,