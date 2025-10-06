/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author admin
 */
public class Payroll {
    private int payrollId;
    private int employeeId;
    private String payPeriod; // Format: YYYY-MM
    private BigDecimal baseSalary;
    private BigDecimal allowance;
    private BigDecimal bonus;
    private BigDecimal deduction;
    private BigDecimal netSalary;
    private Integer approvedBy;
    private Date approvedDate;
    public Payroll(){
        
    }

    public Payroll(int payrollId, int employeeId, String payPeriod, BigDecimal baseSalary, BigDecimal allowance, BigDecimal bonus, BigDecimal deduction, BigDecimal netSalary, Integer approvedBy, Date approvedDate) {
        this.payrollId = payrollId;
        this.employeeId = employeeId;
        this.payPeriod = payPeriod;
        this.baseSalary = baseSalary;
        this.allowance = allowance;
        this.bonus = bonus;
        this.deduction = deduction;
        this.netSalary = netSalary;
        this.approvedBy = approvedBy;
        this.approvedDate = approvedDate;
    }

    public int getPayrollId() {
        return payrollId;
    }

    public void setPayrollId(int payrollId) {
        this.payrollId = payrollId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getPayPeriod() {
        return payPeriod;
    }

    public void setPayPeriod(String payPeriod) {
        this.payPeriod = payPeriod;
    }

    public BigDecimal getBaseSalary() {
        return baseSalary;
    }

    public void setBaseSalary(BigDecimal baseSalary) {
        this.baseSalary = baseSalary;
    }

    public BigDecimal getAllowance() {
        return allowance;
    }

    public void setAllowance(BigDecimal allowance) {
        this.allowance = allowance;
    }

    public BigDecimal getBonus() {
        return bonus;
    }

    public void setBonus(BigDecimal bonus) {
        this.bonus = bonus;
    }

    public BigDecimal getDeduction() {
        return deduction;
    }

    public void setDeduction(BigDecimal deduction) {
        this.deduction = deduction;
    }

    public BigDecimal getNetSalary() {
        return netSalary;
    }

    public void setNetSalary(BigDecimal netSalary) {
        this.netSalary = netSalary;
    }

    public Integer getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(Integer approvedBy) {
        this.approvedBy = approvedBy;
    }

    public Date getApprovedDate() {
        return approvedDate;
    }

    public void setApprovedDate(Date approvedDate) {
        this.approvedDate = approvedDate;
    }

    @Override
    public String toString() {
        return "Payroll{" + "payrollId=" + payrollId + ", employeeId=" + employeeId + ", payPeriod=" + payPeriod + ", baseSalary=" + baseSalary + ", allowance=" + allowance + ", bonus=" + bonus + ", deduction=" + deduction + ", netSalary=" + netSalary + ", approvedBy=" + approvedBy + ", approvedDate=" + approvedDate + '}';
    }
}
