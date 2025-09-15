<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
    <title>Editar Curso</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
    </head>

<div class="container">
    <section class="panel panel-primary vertical-space">
        <div class="panel-heading">
            <h1>Editar curso</h1>
        </div>

        <form:form modelAttribute="newCourseForm" cssClass="form-horizontal panel-body" action="/admin/course/edit/${courseId}" method="post">
            <div class="row form-group">
                <div class="col-md-9">
                    <label for="newCourse-name">Nome:</label>
                    <form:input path="name" id="newCourse-name" cssClass="form-control" required="required"/>
                </div>

                <div class="col-md-9">
                    <label for="newCourse-code">Código:</label>
                    <form:input path="code" id="newCourse-code" cssClass="form-control" required="required"/>
                </div>

                <div class="col-md-9">
                    <label for="newCourse-instructorEmail">Instrutor (email):</label>
                    <form:input path="instructorEmail" id="newCourse-instructorEmail" cssClass="form-control" required="required"/>
                </div>

                <div class="col-md-9">
                    <label for="newCourse-category">Categoria:</label>
                    <form:select path="categoryId" id="newCourse-category" cssClass="form-control" required="required">
                        <form:options items="${categories}" itemValue="id" itemLabel="name"/>
                    </form:select>
                </div>

                <div class="col-md-9">
                    <label for="newCourse-description">Descrição:</label>
                    <form:textarea path="description" id="newCourse-description" cssClass="form-control" rows="4"/>
                </div>
            </div>

            <input class="btn btn-success submit" type="submit" value="Salvar"/>
            <a href="/admin/courses" class="btn btn-default">Cancelar</a>
        </form:form>
    </section>
</div>
