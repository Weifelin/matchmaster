package edu.sbu.matchmaster;

public class AccountBean {
    private String ssn;
    private int cardNum;
    private String acctNum;

    public AccountBean(String ssn, int cardNum, String acctNum){
        this.ssn = ssn;
        this.acctNum = acctNum;
        this.cardNum = cardNum;
    }

    public int getCardNum() {
        return cardNum;
    }

    public String getAcctNum() {
        return acctNum;
    }

    public String getSsn() {
        return ssn;
    }

}
