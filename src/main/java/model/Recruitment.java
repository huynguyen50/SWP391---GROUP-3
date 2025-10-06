
package model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class Recruitment {
    private int recruitmentId;
    private String jobTitle;
    private String jobDescription;
    private Date postDate;
    private String status; // Open, Closed
    private Integer postedBy;
    private Timestamp postedDate;
    public Recruitment(){
        
    }

    public Recruitment(int recruitmentId, String jobTitle, String jobDescription, Date postDate, String status, Integer postedBy, Timestamp postedDate) {
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

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
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

    public Timestamp getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(Timestamp postedDate) {
        this.postedDate = postedDate;
    }

    @Override
    public String toString() {
        return "Recruitment{" + "recruitmentId=" + recruitmentId + ", jobTitle=" + jobTitle + ", jobDescription=" + jobDescription + ", postDate=" + postDate + ", status=" + status + ", postedBy=" + postedBy + ", postedDate=" + postedDate + '}';
    }
}