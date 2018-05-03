package edu.sbu.matchmaster;

//updated userbean.
public class UserBean{

    public enum Type{
        CUST, EMP, MNG;
    }



    private String ssn;
    private Type type;
    private String userName;
    private String gender;
    private String password;
    private String email;
    private String street;
    private String city;
    private String phone;
    private String state;
    private int zip;

    public UserBean(String ssn, String name, Type type){
        this.userName = name;
        this.ssn = ssn;
        this.type = type;
    }

    public String getSsn(){
        return ssn;
    }

    public Type getType(){
        return type;
    }

    public int getZip() {
        return zip;
    }

    public String getCity() {
        return city;
    }

    public String getEmail() {
        return email;
    }

    public String getGender() {
        return gender;
    }

    public String getPhone() {
        return phone;
    }

    public String getState() {
        return state;
    }

    public String getStreet() {
        return street;
    }

    public String getUserName() {
        return userName;
    }

}

