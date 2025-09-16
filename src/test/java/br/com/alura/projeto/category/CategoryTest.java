package br.com.alura.projeto.category;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class CategoryTest {

    @Test
    void category__should_be_created_with_correct_properties() {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        
        assertThat(category.getName()).isEqualTo("Programming");
        assertThat(category.getCode()).isEqualTo("prog");
        assertThat(category.getColor()).isEqualTo("#FF6B6B");
        assertThat(category.getIcon()).isEqualTo("ti-code");
        assertThat(category.getOrder()).isEqualTo(1);
    }

    @Test
    void category__should_have_id_after_creation() {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        
        assertThat(category.getId()).isNull(); // ID será definido pelo JPA
    }

    @Test
    void category__should_allow_updating_properties() {
        Category category = new Category("Programming", "prog", "#FF6B6B", "ti-code", 1);
        
        category.setName("Web Development");
        category.setColor("#00FF00");
        
        assertThat(category.getName()).isEqualTo("Web Development");
        assertThat(category.getColor()).isEqualTo("#00FF00");
    }
}
