package br.com.alura.projeto.login;

import br.com.alura.projeto.category.Category;
import br.com.alura.projeto.course.Course;

import java.util.List;
import java.util.Random;

public record CategoryWithCoursesDTO(Long id,
                                     String name,
                                     String code,
                                     String color,
                                     int order,
                                     List<String> activeCourses,
                                     String cardColor,
                                     String icon) {

    private static final String[] CARD_COLORS = {
        "#FF6B6B", "#4ECDC4", "#45B7D1", "#96CEB4", "#FFEAA7", 
        "#DDA0DD", "#98D8C8", "#F7DC6F", "#BB8FCE", "#85C1E9"
    };
    
    private static final String[] ICONS = {
        "💻", "🎨", "📊", "🤖", "⚙️", "🎯", "📱", "🚀", "🔧", "💡"
    };

    public CategoryWithCoursesDTO(Category category, List<Course> courses) {
        this(category.getId(),
                category.getName(),
                category.getCode(),
                category.getColor(),
                category.getOrder(),
                courses.stream()
                        .filter(course -> course.getStatus().name().equals("ACTIVE"))
                        .map(Course::getName)
                        .toList(),
                getRandomCardColor(category.getId()),
                getRandomIcon(category.getId()));
    }
    
    private static String getRandomCardColor(Long categoryId) {
        Random random = new Random(categoryId);
        return CARD_COLORS[random.nextInt(CARD_COLORS.length)];
    }
    
    private static String getRandomIcon(Long categoryId) {
        Random random = new Random(categoryId);
        return ICONS[random.nextInt(ICONS.length)];
    }
}
