
package model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class MailRequest {
    
    private int requestId;
    private int employeeId;
    private String requestType; // Leave, Resignation, Petition
    private Date startDate;
    private Date endDate;
    private String reason;
    private String status; // Pending, Approved, Rejected
    private Integer approvedBy;
    
    public MailRequest(){
        
    }

    public MailRequest(int requestId, int employeeId, String requestType, Date startDate, Date endDate, String reason, String status, Integer approvedBy) {
        this.requestId = requestId;
        this.employeeId = employeeId;
        this.requestType = requestType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.reason = reason;
        this.status = status;
        this.approvedBy = approvedBy;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(Integer approvedBy) {
        this.approvedBy = approvedBy;
    }

    @Override
    public String toString() {
        return "MailRequest{" + "requestId=" + requestId + ", employeeId=" + employeeId + ", requestType=" + requestType + ", startDate=" + startDate + ", endDate=" + endDate + ", reason=" + reason + ", status=" + status + ", approvedBy=" + approvedBy + '}';
    }
    
}