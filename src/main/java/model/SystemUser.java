/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class SystemUser {
    private int userId;
    private String username;
    private String password;
    private int roleId;
    private Timestamp lastLogin;
    private boolean isActive;
    private Timestamp createdDate;
    private Integer employeeId;
    public SystemUser(){
        
    }

    public SystemUser(int userId, String username, String password, int roleId, Timestamp lastLogin, boolean isActive, Timestamp createdDate, Integer employeeId) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.roleId = roleId;
        this.lastLogin = lastLogin;
        this.isActive = isActive;
        this.createdDate = createdDate;
        this.employeeId = employeeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Timestamp getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    @Override
    public String toString() {
        return "SystemUser{" + "userId=" + userId + ", username=" + username + ", password=" + password + ", roleId=" + roleId + ", lastLogin=" + lastLogin + ", isActive=" + isActive + ", createdDate=" + createdDate + ", employeeId=" + employeeId + '}';
    }
}
