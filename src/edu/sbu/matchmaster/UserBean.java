package edu.sbu.matchmaster;

//updated userbean.
public class UserBean{

    public void setType(Type type){
        this.type = type;
    }

    public enum Type{
        CUST, EMP, MNG;
    }



    private String ssn;
    private Type type;
    private String userName;
    private String street;
    private String city;
    private String state;
    private int zip;
    private String email;
    private String phone;


    public UserBean(String ssn, Type type, String userName, String street, String city, String state, int zip, String email, String phone){
        this.ssn = ssn;
        this.type = type;
        this.userName = userName;
        this.street = street;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.email = email;
        this.phone = phone;
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

