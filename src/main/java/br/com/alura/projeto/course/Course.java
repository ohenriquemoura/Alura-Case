package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import java.time.LocalDateTime;

@Entity
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String name;

    @NotBlank
    @Length(min = 4, max = 10)
    @Column(unique = true)
    private String code;

    private String description;

    @NotBlank
    @Column(name = "instructor_email")
    private String instructorEmail;

    @NotNull
    @Enumerated(EnumType.STRING)
    private CourseStatus status = CourseStatus.ACTIVE;

    private LocalDateTime deactivatedAt;

    @NotNull
    @ManyToOne(optional = false)
    private Category category;

    @Deprecated
    public Course() {}

    public Course(String name,
                  String code,
                  String description,
                  String instructorEmail,
                  Category category) {
        this.name = name;
        this.code = code;
        this.description = description;
        this.instructorEmail = instructorEmail;
        this.category = category;
        this.status = CourseStatus.ACTIVE;
        this.deactivatedAt = null;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public String getInstructorEmail() {
        return instructorEmail;
    }

    public CourseStatus getStatus() {
        return status;
    }

    public LocalDateTime getDeactivatedAt() {
        return deactivatedAt;
    }

    public Category getCategory() {
        return category;
    }

    public void inactivate() {
        if (this.status == CourseStatus.INACTIVE) {
            return;
        }
        this.status = CourseStatus.INACTIVE;
        this.deactivatedAt = LocalDateTime.now();
    }
}


