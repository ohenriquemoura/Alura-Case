package br.com.alura.projeto.registration;

import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface RegistrationRepository extends JpaRepository<Registration, Long> {

    boolean existsByUserAndCourse(User user, Course course);

    Optional<Registration> findByUserAndCourse(User user, Course course);

    @Query(value = """
        SELECT 
            c.id,
            c.name,
            c.code,
            c.instructor_email,
            COALESCE(cat.name, 'Sem Categoria') as categoryName,
            COUNT(r.id) as enrollmentCount
        FROM Course c
        LEFT JOIN Category cat ON c.category_id = cat.id
        LEFT JOIN Registration r ON c.id = r.course_id
        GROUP BY c.id, c.name, c.code, c.instructor_email, cat.name
        ORDER BY enrollmentCount DESC, c.name ASC
        """, nativeQuery = true)
    List<Object[]> findCoursesWithEnrollmentCount();
}
