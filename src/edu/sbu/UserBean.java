package edu.sbu;

public class UserBean{

    public enum Type{
        CUST, EMP, MNG;
    }



    private int ssn;
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

    public UserBean(int ssn, Type type){
        this.ssn = ssn;
        this.type = type;
    }

    public int getSsn(){
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

