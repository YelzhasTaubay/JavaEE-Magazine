package com.shop.entities;

public class Users {

    private Long id;
    private String email;
    private String password;
    private String fullNAme;
    private int roleId; //1-Admin,2-User

    public Users(){}
    public Users(Long id, String email, String password, String fullNAme, int roleId) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullNAme = fullNAme;
        this.roleId = roleId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullNAme() {
        return fullNAme;
    }

    public void setFullNAme(String fullNAme) {
        this.fullNAme = fullNAme;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
