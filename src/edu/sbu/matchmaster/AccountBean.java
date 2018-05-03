package edu.sbu.matchmaster;

public class AccountBean {
    private String ssn;
    private long cardNum;
    private String acctNum;

    public AccountBean(String ssn, long cardNum, String acctNum){
        this.ssn = ssn;
        this.acctNum = acctNum;
        this.cardNum = cardNum;
    }

    public long getCardNum() {
        return cardNum;
    }

    public String getAcctNum() {
        return acctNum;
    }

    public String getSsn() {
        return ssn;
    }

}
