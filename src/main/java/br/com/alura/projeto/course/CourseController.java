package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryRepository;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class CourseController {

    private final CourseRepository courseRepository;
    private final CategoryRepository categoryRepository;

    public CourseController(CourseRepository courseRepository, CategoryRepository categoryRepository) {
        this.courseRepository = courseRepository;
        this.categoryRepository = categoryRepository;
    }

    @GetMapping("/admin/courses")
    public String list(Model model) {
        List<CourseDTO> list = courseRepository.findAll().stream().map(CourseDTO::new).toList();
        model.addAttribute("courses", list);
        return "admin/course/list";
    }

    @GetMapping("/admin/course/new")
    public String create(NewCourseForm form, Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        return "admin/course/newForm";
    }

    @Transactional
    @PostMapping("/admin/course/new")
    public String save(@Valid NewCourseForm form, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return create(form, model);
        }

        // validar padrão do code: letras minúsculas e hífens (ex.: spring-boot-avancado)
        if (!form.getCode().matches("^[a-z]+(-[a-z]+)*$")) {
            result.rejectValue("code", "code.pattern", "Use apenas letras minúsculas e hífen, ex.: spring-boot-avancado");
            return create(form, model);
        }

        if (courseRepository.existsByCode(form.getCode())) {
            result.rejectValue("code", "code.unique", "Este código já está em uso");
            return create(form, model);
        }

        Category category = categoryRepository.findById(form.getCategoryId()).orElse(null);
        if (category == null) {
            result.rejectValue("categoryId", "category.required", "Categoria inválida");
            return create(form, model);
        }

        Course course = new Course(
                form.getName(),
                form.getCode(),
                form.getDescription(),
                form.getInstructorEmail(),
                category
        );
        courseRepository.save(course);

        return "redirect:/admin/courses";
    }

    @Transactional
    @PostMapping("/course/{code}/inactive")
    public ResponseEntity<?> updateStatus(@PathVariable("code") String courseCode) {
        Course course = courseRepository.findByCode(courseCode);
        if (course == null) {
            return ResponseEntity.notFound().build();
        }
        course.inactivate();
        return ResponseEntity.ok().build();
    }

}
