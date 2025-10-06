/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Task {
      private int taskId;
    private String title;
    private String description;
    private int assignedBy;
    private int assignTo;
    private Date startDate;
    private Date dueDate;
    private String status;
    public Task(){
        
    }

    public Task(int taskId, String title, String description, int assignedBy, int assignTo, Date startDate, Date dueDate, String status) {
        this.taskId = taskId;
        this.title = title;
        this.description = description;
        this.assignedBy = assignedBy;
        this.assignTo = assignTo;
        this.startDate = startDate;
        this.dueDate = dueDate;
        this.status = status;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAssignedBy() {
        return assignedBy;
    }

    public void setAssignedBy(int assignedBy) {
        this.assignedBy = assignedBy;
    }

    public int getAssignTo() {
        return assignTo;
    }

    public void setAssignTo(int assignTo) {
        this.assignTo = assignTo;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Task{" + "taskId=" + taskId + ", title=" + title + ", description=" + description + ", assignedBy=" + assignedBy + ", assignTo=" + assignTo + ", startDate=" + startDate + ", dueDate=" + dueDate + ", status=" + status + '}';
    }
}
