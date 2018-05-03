package edu.sbu.matchmaster;

import java.sql.Date;
public class ProfileBean {
    public enum Gender{
        MALE,FEMALE,OTHER
    }

    public enum HairColor{
        BLOND,BLACK,BROWN,RED
    }
    private String id;
    private String ssn;
    private int ageRangeStart;
    private int ageRangeEnd;
    private int geoRange;
    private Gender gender;
    private int height;
    private int weight;
    private HairColor color;
    private Date creationDate;
    private Date lastModDate;

    public ProfileBean(String id, String ssn, int ageRangeStart, int ageRangeEnd, int geoRange,
                        Gender gender, int height, int weight, HairColor color,
                        Date creationDate, Date lastModDate){

        this.id = id;
        this.ssn = ssn;
        this.ageRangeStart = ageRangeStart;
        this.ageRangeEnd = ageRangeEnd;
        this.geoRange = geoRange;
        this.gender = gender;
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
    public int getHeight(){ return this.height;}
    public int getWeight() { return this.weight;}
    public HairColor getColor(){ return this.color;}
    public Date getCreationDate(){ return this.creationDate;}
    public Date getLastModDate() { return this.lastModDate;}
}
