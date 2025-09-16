package br.com.alura.projeto.registration;

import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.course.CourseRepository;
import br.com.alura.projeto.course.CourseStatus;
import br.com.alura.projeto.user.User;
import br.com.alura.projeto.user.UserRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class RegistrationController {

    private final RegistrationRepository registrationRepository;
    private final UserRepository userRepository;
    private final CourseRepository courseRepository;

    public RegistrationController(RegistrationRepository registrationRepository,
                                UserRepository userRepository,
                                CourseRepository courseRepository) {
        this.registrationRepository = registrationRepository;
        this.userRepository = userRepository;
        this.courseRepository = courseRepository;
    }

    @Transactional
    @PostMapping("/registration/new")
    @ResponseBody
    public ResponseEntity createCourse(@Valid @RequestBody NewRegistrationDTO newRegistration) {
        // Buscar usuário por email
        User user = userRepository.findByEmail(newRegistration.getStudentEmail()).orElse(null);
        if (user == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuário não encontrado");
        }

        // Buscar curso por código
        Course course = courseRepository.findByCode(newRegistration.getCourseCode());
        if (course == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Curso não encontrado");
        }

        // Verificar se o curso está ativo
        if (course.getStatus() != CourseStatus.ACTIVE) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Não é possível se matricular em um curso inativo");
        }

        // Verificar se o usuário já está matriculado neste curso
        if (registrationRepository.existsByUserAndCourse(user, course)) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Usuário já está matriculado neste curso");
        }

        // Criar nova matrícula
        Registration registration = new Registration(user, course);
        registrationRepository.save(registration);

        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @GetMapping("/setup-registration")
    public String setupRegistration() {
        return "setup-registration";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @GetMapping("/course-report")
    public String courseReport() {
        return "course-report";
    }


    @GetMapping("/registration/report")
    @ResponseBody
    public ResponseEntity<List<CourseReportDTO>> report() {
        List<Object[]> results = registrationRepository.findCoursesWithEnrollmentCount();
        
        List<CourseReportDTO> report = results.stream()
                .map(row -> new CourseReportDTO(
                        ((Number) row[0]).longValue(),      // courseId
                        (String) row[1],                    // courseName
                        (String) row[2],                    // courseCode
                        (String) row[3],                    // instructorEmail
                        (String) row[4],                    // categoryName
                        ((Number) row[5]).longValue()       // enrollmentCount
                ))
                .toList();

        return ResponseEntity.ok(report);
    }

}
