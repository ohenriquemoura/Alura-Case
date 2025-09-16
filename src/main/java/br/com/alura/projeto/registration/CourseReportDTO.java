package br.com.alura.projeto.registration;

public record CourseReportDTO(
        Long courseId,
        String courseName,
        String courseCode,
        String instructorEmail,
        String categoryName,
        Long enrollmentCount
) {
    
    public CourseReportDTO(Long courseId, String courseName, String courseCode, 
                          String instructorEmail, String categoryName, Long enrollmentCount) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.courseCode = courseCode;
        this.instructorEmail = instructorEmail;
        this.categoryName = categoryName;
        this.enrollmentCount = enrollmentCount;
    }
}

