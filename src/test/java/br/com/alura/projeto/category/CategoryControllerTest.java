package br.com.alura.projeto.category;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(CategoryController.class)
class CategoryControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private CategoryRepository categoryRepository;

    @Test
    void list__should_return_categories_page() throws Exception {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        
        when(categoryRepository.findAll()).thenReturn(Arrays.asList(category));

        mockMvc.perform(get("/admin/categories"))
                .andExpect(status().isOk());
    }

    @Test
    void create__should_return_new_category_form() throws Exception {
        mockMvc.perform(get("/admin/category/new"))
                .andExpect(status().isOk());
    }

    @Test
    void edit__should_return_edit_form_when_category_exists() throws Exception {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        
        when(categoryRepository.findById(1L)).thenReturn(java.util.Optional.of(category));

        mockMvc.perform(get("/admin/category/edit/1"))
                .andExpect(status().isOk());
    }

    @Test
    void edit__should_redirect_when_category_does_not_exist() throws Exception {
        when(categoryRepository.findById(999L)).thenReturn(java.util.Optional.empty());

        mockMvc.perform(get("/admin/category/edit/999"))
                .andExpect(status().is3xxRedirection());
    }
}
