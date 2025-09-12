<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lista de Cursos</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
</head>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h1>Cursos</h1>
            <a class="btn btn-info new-button" href="/admin/course/new">Cadastrar novo</a>
        </div>
        <table class="panel-body table table-hover">
            <thead>
            <tr>
                <th>Nome</th>
                <th>Código</th>
                <th>Instrutor</th>
                <th>Categoria</th>
                <th>Status</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.name()}</td>
                    <td>${course.code()}</td>
                    <td>${course.instructorEmail()}</td>
                    <td>${course.categoryName()}</td>
                    <td>${course.status()}</td>
                    <td>
                        <c:if test="${course.status() == 'ACTIVE'}">
                            <form action="/course/${course.code()}/inactive" method="post" style="display:inline">
                                <button type="submit" class="btn btn-warning">Inativar</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


