# Human Resource Management System (HRMS)

## Overview
Web-based HRMS project using:
- Java 24, Jakarta Servlet 6.0, JSP/JSTL
- Tomcat 10.1
- MySQL (JDBC)
- Maven

## Project Structure
hrms/
 ├── src/main/java/com/hrms/ (controller, model, dao, service)
 ├── src/main/webapp/ (views JSP, WEB-INF)
 ├── pom.xml
 └── README.md

## How to Run
1. Install JDK 24, Maven, Tomcat 10.1, MySQL 8+
2. Create database:  
   CREATE DATABASE hrm_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
3. Build project:  
   mvn clean package
4. Deploy target/hrms.war to Tomcat webapps/
5. Access: http://localhost:8080/hrms
