package Model;

import java.util.Date;

public class User {
    private Integer userId;
    private String userName;
    private String passWord;
    private String email;
    private String fullName;
    private String state;
    private String city;
    private String street;
    private Integer zipCode;
    private Date birthDate;
    private String role;

    public User() {
    }

    public User(String userName, String passWord, String email, String fullName, String role, String state, String city,
                String street, Integer zipCode,String gender) {
        this.userName = userName;
        this.passWord = passWord;
        this.email = email;
        this.fullName = fullName;
        this.role = role;
        this.state = state;
        this.city = city;
        this.street = street;
        this.zipCode = zipCode;
        this.gender = gender;
    }

    public User(Integer userId, String userName, String passWord, String email, String fullName, String state, String city,
                String street, Integer zipCode, Date birthDate, String role) {
        this.userId = userId;
        this.userName = userName;
        this.passWord = passWord;
        this.email = email;
        this.fullName = fullName;
        this.state = state;
        this.city = city;
        this.street = street;
        this.zipCode = zipCode;
        this.birthDate = birthDate;
        this.role = role;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public Integer getZipCode() {
        return zipCode;
    }

    public void setZipCode(Integer zipCode) {
        this.zipCode = zipCode;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
