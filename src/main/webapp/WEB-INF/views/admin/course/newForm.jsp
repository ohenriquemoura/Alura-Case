<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar Novo Curso</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/admin.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/control-menu.css">
</head>
<body>
<!-- Control Menu -->
<div class="control-menu">
    <div class="control-icon">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
        <h3 class="sidebar-title">🏫 Alura</h3>
        <p class="sidebar-subtitle">Sistema de Ensino</p>
    </div>
    
    <nav class="sidebar-nav">
        <div class="nav-section">
            <h4 class="nav-section-title">🏠 Páginas Principais</h4>
            <ul class="nav-links">
                <li><a href="/" class="nav-link"><span class="nav-link-icon">🏠</span><span class="nav-link-text">Página Inicial</span></a></li>
                <li><a href="/registration" class="nav-link"><span class="nav-link-icon">📝</span><span class="nav-link-text">Teste de Matrícula</span></a></li>
                <li><a href="/setup-registration" class="nav-link"><span class="nav-link-icon">⚙️</span><span class="nav-link-text">Configurar Testes</span></a></li>
                <li><a href="/course-report" class="nav-link"><span class="nav-link-icon">📊</span><span class="nav-link-text">Relatório de Cursos</span></a></li>
            </ul>
        </div>
        
        <div class="nav-section">
            <h4 class="nav-section-title">👨‍💼 Administração</h4>
            <ul class="nav-links">
                <li><a href="/admin/categories" class="nav-link"><span class="nav-link-icon">📚</span><span class="nav-link-text">Categorias</span></a></li>
                <li><a href="/admin/category/new" class="nav-link"><span class="nav-link-icon">➕</span><span class="nav-link-text">Nova Categoria</span></a></li>
                <li><a href="/admin/courses" class="nav-link"><span class="nav-link-icon">🎓</span><span class="nav-link-text">Cursos</span></a></li>
                <li><a href="/admin/course/new" class="nav-link"><span class="nav-link-icon">➕</span><span class="nav-link-text">Novo Curso</span></a></li>
            </ul>
        </div>
    </nav>
</div>

<!-- Overlay -->
<div class="sidebar-overlay"></div>

    <div class="container">
        <div class="page-header">
            <h1 class="page-title">📚 Novo Curso</h1>
            <p class="page-subtitle">Crie um novo curso para a plataforma</p>
        </div>

        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Dados do Curso</h2>
                <a href="/admin/courses" class="btn btn-secondary">← Voltar</a>
            </div>

            <c:if test="${not empty errors}">
                <div class="alert alert-error">
                    ⚠️ Existem erros no formulário. Verifique os campos abaixo.
                </div>
            </c:if>

            <form:form modelAttribute="newCourseForm" action="/admin/course/new" method="post">
                <div class="grid grid-2">
                    <div class="form-group">
                        <label for="newCourse-name" class="form-label">Nome do Curso:</label>
                        <form:input path="name" id="newCourse-name" cssClass="form-input" placeholder="Ex: Java para Iniciantes" required="required"/>
                        <form:errors path="name" cssClass="field-error"/>
                    </div>

                    <div class="form-group">
                        <label for="newCourse-code" class="form-label">Código do Curso:</label>
                        <form:input path="code" id="newCourse-code" cssClass="form-input" placeholder="Ex: java-basico" required="required"/>
                        <form:errors path="code" cssClass="field-error"/>
                        <small style="color: #cfd8e3; font-size: 0.9rem; margin-top: 0.5rem; display: block;">
                            💡 Use apenas letras minúsculas e hífens, ex.: spring-boot-avancado
                        </small>
                    </div>

                    <div class="form-group">
                        <label for="newCourse-instructorEmail" class="form-label">Email do Instrutor:</label>
                        <form:input path="instructorEmail" id="newCourse-instructorEmail" cssClass="form-input" placeholder="Ex: instrutor@alura.com" required="required"/>
                        <form:errors path="instructorEmail" cssClass="field-error"/>
                    </div>

                    <div class="form-group">
                        <label for="newCourse-category" class="form-label">Categoria:</label>
                        <form:select path="categoryId" id="newCourse-category" cssClass="form-select" required="required">
                            <option value="">Selecione uma categoria</option>
                            <form:options items="${categories}" itemValue="id" itemLabel="name"/>
                        </form:select>
                        <form:errors path="categoryId" cssClass="field-error"/>
                        <small style="color: #cfd8e3; font-size: 0.9rem; margin-top: 0.5rem; display: block;">
                            📂 Escolha a categoria que melhor se adequa ao curso
                        </small>
                    </div>
                </div>

                <div class="form-group">
                    <label for="newCourse-description" class="form-label">Descrição do Curso:</label>
                    <form:textarea path="description" id="newCourse-description" cssClass="form-input" rows="4" placeholder="Descreva o que será ensinado no curso..."/>
                    <form:errors path="description" cssClass="field-error"/>
                    <small style="color: #cfd8e3; font-size: 0.9rem; margin-top: 0.5rem; display: block;">
                        📝 Descrição opcional sobre o conteúdo e objetivos do curso
                    </small>
                </div>

                <div style="text-align: center; margin-top: 2rem;">
                    <button type="submit" class="btn btn-primary">💾 Salvar Curso</button>
                    <a href="/admin/courses" class="btn btn-secondary">❌ Cancelar</a>
                </div>
            </form:form>
        </div>
    </div>

<script src="/assets/js/control-menu.js"></script>
</body>
</html>