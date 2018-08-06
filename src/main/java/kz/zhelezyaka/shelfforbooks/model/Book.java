package kz.zhelezyaka.shelfforbooks.model;

import javax.persistence.*;

@Entity
@Table(name = "BOOKS")
public class Book {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "BOOK_TITLE")
    private String bookTitle;

    @Column(name = "BOOK_AUTHOR")
    private String bookAuthor;

    @Column(name = "BOOK_PRICE")
    private int price;

    @Column(name = "BOOK_ISBN")
    private String bookIsbn;

    @Column(name = "BOOK_PRINTYEAR")
    private int bookPrintYear;

    @Column(name = "BOOK_READALREADY")
    private boolean readAlready;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBookIsbn() {
        return bookIsbn;
    }


    public void setBookIsbn(String bookIsbn) {
        this.bookIsbn = bookIsbn;
    }


    public int getBookPrintYear() {
        return bookPrintYear;
    }


    public void setBookPrintYear(int bookPrintYear) {
        this.bookPrintYear = bookPrintYear;
    }


    public boolean isReadAlready() {
        return readAlready;
    }


    public void setReadAlready(boolean readAlready) {
        this.readAlready = readAlready;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", bookTitle='" + bookTitle + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", price=" + price +
                ", bookIsbn='" + bookIsbn + '\'' +
                ", bookPrintYear=" + bookPrintYear +
                ", readAlready=" + readAlready +
                '}';
    }
}
