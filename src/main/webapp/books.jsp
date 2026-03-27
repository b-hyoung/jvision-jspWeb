<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>도서 목록</title>
</head>
<body>
    <div class="container py-4">
        <%@ include file="ch03/include02_header.jsp" %>

        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">도서 목록</h1>
                <p class="col-md-8 fs-4">Book List</p>
            </div>
        </div>

        <%
            BookRepository dao = BookRepository.getInstance();
            ArrayList<Book> bookList = dao.getAllBooks();
        %>
        <div class="row align-items-md-stretch text-center">
            <%
                for (int i=0; i < bookList.size(); i++) {
                    Book book = bookList.get(i);
            %>
            <div class="col-md-4">
                <div class="h-100 p-2">
                    <h5><b><%= book.getName() %></b></h5>
                    <h2><%= book.getAuthor() %></h2>
                    <p><%= book.getPublisher() %> | <%= book.getReleaseDate() %></p>
                    <p><%= book.getDescription().substring(0,60) %>...</p>
                    <p><%= book.getUnitPrice() %>원</p>
                    <p><a href="book_detail.jsp?bookId=<%= book.getBookId() %>" class="btn btn-secondary" role="button">상세 정보</a></p>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <%@ include file="ch03/include02_footer.jsp" %>
    </div>
</body> 
</html>
