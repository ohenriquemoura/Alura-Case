package br.com.alura.projeto.course;

public record CourseDTO(Long id,
                        String name,
                        String code,
                        String instructorEmail,
                        String categoryName,
                        String status) {

    public CourseDTO(Course course) {
        this(course.getId(),
                course.getName(),
                course.getCode(),
                course.getInstructorEmail(),
                course.getCategory().getName(),
                course.getStatus().name());
    }
}


