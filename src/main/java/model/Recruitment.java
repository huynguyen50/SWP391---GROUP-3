package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Recruitment entity – stores job postings for the HRMS system.
 * @author admin
 */
public class Recruitment implements Serializable {
    private static final long serialVersionUID = 1L;

    private int recruitmentId;
    private String jobTitle;
    private String jobDescription;
    private LocalDate postDate;
    private String status;       // Open, Closed
    private Integer postedBy;    // userId of the HR or Admin who posted
    private LocalDateTime postedDate;

    public Recruitment() {}

    public Recruitment(int recruitmentId, String jobTitle, String jobDescription, 
                       LocalDate postDate, String status, Integer postedBy, 
                       LocalDateTime postedDate) {
        this.recruitmentId = recruitmentId;
        this.jobTitle = jobTitle;
        this.jobDescription = jobDescription;
        this.postDate = postDate;
        this.status = status;
        this.postedBy = postedBy;
        this.postedDate = postedDate;
    }

    public int getRecruitmentId() {
        return recruitmentId;
    }

    public void setRecruitmentId(int recruitmentId) {
        this.recruitmentId = recruitmentId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public LocalDate getPostDate() {
        return postDate;
    }

    public void setPostDate(LocalDate postDate) {
        this.postDate = postDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getPostedBy() {
        return postedBy;
    }

    public void setPostedBy(Integer postedBy) {
        this.postedBy = postedBy;
    }

    public LocalDateTime getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(LocalDateTime postedDate) {
        this.postedDate = postedDate;
    }

    @Override
    public String toString() {
        return "Recruitment{" +
                "recruitmentId=" + recruitmentId +
                ", jobTitle='" + jobTitle + '\'' +
                ", jobDescription='" + jobDescription + '\'' +
                ", postDate=" + postDate +
                ", status='" + status + '\'' +
                ", postedBy=" + postedBy +
                ", postedDate=" + postedDate +
                '}';
    }
}