<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%
    request.setCharacterEncoding("UTF-8");

    String realFolder = application.getRealPath("/resources/images");
    int maxSize = 5 * 1024 * 1024;
    String enctype = "UTF-8";

    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, enctype, new DefaultFileRenamePolicy());

    String bookId = multi.getParameter("bookId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String author = multi.getParameter("author");
    String publisher = multi.getParameter("publisher");
    String releaseDate = multi.getParameter("releaseDate");
    String description = multi.getParameter("description");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");

    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String filename = multi.getFilesystemName(fname);

    int price;
    if (unitPrice == null || unitPrice.isEmpty())
        price = 0;
    else
        price = Integer.valueOf(unitPrice);

    long stock;
    if (unitsInStock == null || unitsInStock.isEmpty())
        stock = 0;
    else
        stock = Long.valueOf(unitsInStock);

    BookRepository dao = BookRepository.getInstance();

    Book newBook = new Book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setUnitPrice(price);
    newBook.setAuthor(author);
    newBook.setPublisher(publisher);
    newBook.setReleaseDate(releaseDate);
    newBook.setDescription(description);
    newBook.setCategory(category);
    newBook.setUnitsInStock(stock);
    newBook.setCondition(condition);
    newBook.setFilename(filename);

    dao.addBook(newBook);

    response.sendRedirect("books.jsp");
%>
