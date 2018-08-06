<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%request.setCharacterEncoding("UTF-8");%>



<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Подробно о книге</title>

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
      background-color: #40bcaf;
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
      background-color: #f9f9f9
    }
  </style>
<body>
<a href="<c:url value="/books"/>" target="_self">
    <button>Вернуться назад</button>
</a>

<h1>Детальная информация о книге: </h1>

<table class="tg">
  <tr>
    <th width="80">Номер книги</th>
    <th width="120">Название книги</th>
    <th width="120">Автор</th>
    <th width="120">Цена</th>
    <th width="120">ISBN</th>
    <th width="120">Год выхода</th>
    <th width="120">Популярность</th>
  </tr>
  <tr>
    <td>${book.id}</td>
    <td>${book.bookTitle}</td>
    <td>${book.bookAuthor}</td>
    <td>${book.price/100}${book.price%100}</td>
    <td>${book.bookIsbn}</td>
    <td>${book.bookPrintYear}</td>
    <td>${book.readAlready}</td>
  </tr>
</table>
</body>
</head>
</html>