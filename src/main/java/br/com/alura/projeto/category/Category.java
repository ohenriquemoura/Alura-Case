package br.com.alura.projeto.category;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import java.time.LocalDateTime;

@Entity
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String name;

    @NotBlank
    @Length(min = 4, max = 10)
    private String code;

    @NotBlank
    private String color;

    @NotBlank
    private String icon;

    @NotNull
    @Min(1)
    @Column(name = "`order`")
    private int order;

    private LocalDateTime createdAt = LocalDateTime.now();

    @Deprecated
    public Category() {}

    public Category(String name, String code, String color, String icon, int order) {
        this.name = name;
        this.code = code;
        this.color = color;
        this.icon = icon;
        this.order = order;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getColor() {
        return color;
    }

    public int getOrder() {
        return order;
    }

    public String getCode() {
        return code;
    }

    public String getIcon() {
        return icon;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public void setOrder(int order) {
        this.order = order;
    }
}
