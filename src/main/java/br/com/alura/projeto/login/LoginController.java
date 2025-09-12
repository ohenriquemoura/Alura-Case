package br.com.alura.projeto.login;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryRepository;
import br.com.alura.projeto.course.Course;
import br.com.alura.projeto.course.CourseRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class LoginController {

    private final CategoryRepository categoryRepository;
    private final CourseRepository courseRepository;

    public LoginController(CategoryRepository categoryRepository, CourseRepository courseRepository) {
        this.categoryRepository = categoryRepository;
        this.courseRepository = courseRepository;
    }

    @GetMapping("/")
    public String home(Model model) {
        List<Category> categories = categoryRepository.findAll();
        List<Course> allCourses = courseRepository.findAll();
        
        List<CategoryWithCoursesDTO> categoriesWithCourses = categories.stream()
                .map(category -> {
                    List<Course> categoryCourses = allCourses.stream()
                            .filter(course -> course.getCategory().getId().equals(category.getId()))
                            .toList();
                    return new CategoryWithCoursesDTO(category, categoryCourses);
                })
                .toList();

        model.addAttribute("categoriesWithCourses", categoriesWithCourses);
        return "login";
    }
}
