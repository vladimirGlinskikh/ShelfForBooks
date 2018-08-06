<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%request.setCharacterEncoding("UTF-8");%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Книжная полка</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #3388ff;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #3388ff;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #41e690
        }
    </style>
<body>
<a href="../../index.jsp">
    <button>Вернуться назад</button>
</a>

<br/>
<br/>

<h1>Весь список книг на полке: </h1>

<c:if test="${!empty listBooks}">
    <table class="tg">
        <tr>
            <th width="20">Номер книги</th>
            <th width="120">Название книги</th>
            <th width="120">Автор</th>
            <th width="120">Цена книги</th>
            <th width="120">ISBN</th>
            <th width="20">Год выпуска</th>
            <th width="120">Популярность</th>
            <th width="120">Редактирование</th>
            <th width="60">Удаление</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td><a href="/bookdata/${book.id}" title="жми сюда и перейдешь к подробному обзору книги"
                       target="_self">${book.bookTitle}</a></td>
                <td>${book.bookAuthor}</td>
                <td>${book.price/100}${book.price%100}</td>
                <td>${book.bookIsbn}</td>
                <td>${book.bookPrintYear}</td>
                <td>${book.readAlready}</td>
                <td><a href="<c:url value='/edit/${book.id}'/>"
                       title="редактирование книги будет в блоке 'Положить книгу на полку:'">редактировать</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>"
                       title="жми сюда и удалишь колонку с книгой">удалить</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1>Положить книгу на полку: </h1>

<c:url var="addAction" value="/books/add"/>

<form:form action="${addAction}" commandName="book">
    <table>
        <c:if test="${!empty book.bookTitle}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="Номер"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="bookTitle">
                    <spring:message text="Название"/>
                </form:label>
            </td>
            <td>
                <form:input path="bookTitle"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="bookAuthor">
                    <spring:message text="Автор"/>
                </form:label>
            </td>
            <td>
                <form:input path="bookAuthor"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">
                    <spring:message text="Цена"/>
                </form:label>
            </td>
            <td>
                <form:input path="price"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="bookIsbn">
                    <spring:message text="ISBN"/>
                </form:label>
            </td>
            <td>
                <form:input path="bookIsbn"/>
            </td>
        <tr>
            <td>
                <form:label path="bookPrintYear">
                    <spring:message text="Год выпуска"/>
                </form:label>
            </td>
            <td>
                <form:input path="bookPrintYear"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="readAlready">
                    <spring:message text="Читали уже?"/>
                </form:label>
            </td>
            <td>
                <form:input path="readAlready"/>
            </td>
        </tr>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty book.bookTitle}">
                    <input type="submit"
                           value="<spring:message text="Редактировать книгу"/>"/>
                </c:if>
                <c:if test="${empty book.bookTitle}">
                    <input type="submit"
                           value="<spring:message text="Положить на полку"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

<h1>Найти книгу на полке: </h1>
<form action="/search/">
    <label for="id">ID:</label>
    <input path="id" type="text" name="id" placeholder="введите id книги"/>
    <br/>
    <br/>
    <input type="submit" value="Найти"/>
</form>
</body>
</head>
</html>
