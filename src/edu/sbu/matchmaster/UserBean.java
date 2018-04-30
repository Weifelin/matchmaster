package edu.sbu.matchmaster;

public class UserBean{
    public enum Type{
        CUST, EMP, MNG;
    }

    public int getSsn(){
        return ssn;
    }

    public Type getType(){
        return type;
    }

    private int ssn;
    private Type type;

    public UserBean(int ssn, Type type){
        this.ssn = ssn;
        this.type = type;
    }


}

