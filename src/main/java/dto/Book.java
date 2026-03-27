package dto;
import java.io.Serializable;

public class Book implements Serializable {
    private String bookId;
    private String name;
    private int unitPrice;
    private String author;
    private String descString;
    private String publisher;
    private String category;
    private long unitInStock;
    private String releasData;
    private String condition;

    public Book(){
        super();
    }

    public Book(String bookId, String name, int unitPrice) {
        super();
        this.bookId = bookId;
        this.name = name;
        this.unitPrice = unitPrice;
    }

    public String getBookId() { return bookId; }
    public void setBookId(String bookId) { this.bookId = bookId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getUnitPrice() { return unitPrice; }
    public void setUnitPrice(int unitPrice) { this.unitPrice = unitPrice; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getDescription() { return descString; }
    public void setDescription(String descString) { this.descString = descString; }

    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public long getUnitsInStock() { return unitInStock; }
    public void setUnitsInStock(long unitInStock) { this.unitInStock = unitInStock; }

    public String getReleaseDate() { return releasData; }
    public void setReleaseDate(String releasData) { this.releasData = releasData; }

    public String getCondition() { return condition; }
    public void setCondition(String condition) { this.condition = condition; }

}
