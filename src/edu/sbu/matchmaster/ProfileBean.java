package edu.sbu.matchmaster;

import java.sql.Date;
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
}
