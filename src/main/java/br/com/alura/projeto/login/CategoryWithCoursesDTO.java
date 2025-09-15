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
                validateColor(category.getColor()),
                getRandomIcon(category.getId()));
    }
    
    private static String validateColor(String color) {
        if (color == null || color.trim().isEmpty()) {
            return "#FFFFFF"; // branco como fallback
        }
        
        // Validação básica de cor hexadecimal
        String cleanColor = color.trim().toUpperCase();
        if (cleanColor.matches("^#[0-9A-F]{6}$")) {
            return cleanColor;
        }
        
        // Cores nomeadas básicas
        switch (cleanColor.toLowerCase()) {
            case "red": return "#FF0000";
            case "green": return "#00FF00";
            case "blue": return "#0000FF";
            case "yellow": return "#FFFF00";
            case "purple": return "#800080";
            case "orange": return "#FFA500";
            case "pink": return "#FFC0CB";
            case "black": return "#000000";
            case "white": return "#FFFFFF";
            default: return "#FFFFFF"; // branco como fallback
        }
    }
    
    private static String getRandomIcon(Long categoryId) {
        Random random = new Random(categoryId);
        return ICONS[random.nextInt(ICONS.length)];
    }
}
