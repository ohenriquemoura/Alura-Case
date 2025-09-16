package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class CourseTest {

    @Test
    void course__should_be_created_with_active_status() {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        Course course = new Course("Spring Boot", "spring-boot", "Curso de Spring Boot", "instructor@alura.com", category);
        
        assertThat(course.getStatus()).isEqualTo(CourseStatus.ACTIVE);
        assertThat(course.getName()).isEqualTo("Spring Boot");
        assertThat(course.getCode()).isEqualTo("spring-boot");
    }

    @Test
    void course__should_be_inactivated() {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        Course course = new Course("Spring Boot", "spring-boot", "Curso de Spring Boot", "instructor@alura.com", category);
        
        course.inactivate();
        
        assertThat(course.getStatus()).isEqualTo(CourseStatus.INACTIVE);
    }

    @Test
    void course__should_be_activated() {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        Course course = new Course("Spring Boot", "spring-boot", "Curso de Spring Boot", "instructor@alura.com", category);
        
        course.inactivate();
        course.activate();
        
        assertThat(course.getStatus()).isEqualTo(CourseStatus.ACTIVE);
    }
}
