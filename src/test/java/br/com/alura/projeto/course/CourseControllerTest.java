package br.com.alura.projeto.course;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.category.CategoryRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(CourseController.class)
class CourseControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private CourseRepository courseRepository;

    @MockBean
    private CategoryRepository categoryRepository;


    @Test
    void list__should_return_courses_page() throws Exception {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        Course course = new Course("Spring Boot", "spring-boot", "Curso de Spring Boot", "instructor@alura.com", category);
        
        when(courseRepository.findAll()).thenReturn(Arrays.asList(course));

        mockMvc.perform(get("/admin/courses"))
                .andExpect(status().isOk());
    }

    @Test
    void create__should_return_new_course_form() throws Exception {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        
        when(categoryRepository.findAll()).thenReturn(Arrays.asList(category));

        mockMvc.perform(get("/admin/course/new"))
                .andExpect(status().isOk());
    }

    @Test
    void updateStatus__should_return_not_found_when_course_does_not_exist() throws Exception {
        when(courseRepository.findByCode("non-existent")).thenReturn(null);

        mockMvc.perform(post("/course/non-existent/inactive"))
                .andExpect(status().isNotFound());
    }

    @Test
    void updateStatus__should_inactivate_course_when_exists() throws Exception {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        Course course = new Course("Spring Boot", "spring-boot", "Curso de Spring Boot", "instructor@alura.com", category);
        
        when(courseRepository.findByCode("spring-boot")).thenReturn(course);

        mockMvc.perform(post("/course/spring-boot/inactive"))
                .andExpect(status().isOk());
    }
}
