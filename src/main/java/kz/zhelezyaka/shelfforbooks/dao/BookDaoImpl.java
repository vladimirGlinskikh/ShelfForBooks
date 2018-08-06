package kz.zhelezyaka.shelfforbooks.dao;

import kz.zhelezyaka.shelfforbooks.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        sessionFactory.getCurrentSession().save(book);
        logger.info("Book successfully saved. Book details: " + book);
    }

    @Override
    public void updateBook(Book book) {
        sessionFactory.getCurrentSession().update(book);
        logger.info("Book successfully update. Book details: " + book);
    }

    @Override
    public void removeBook(int id) {
        sessionFactory.getCurrentSession().delete(getBookById(id));
        logger.info("Book successfully removed. Book details: " + id);
    }

    @Override
    public Book getBookById(int id) {
        return (Book)sessionFactory.getCurrentSession().get(Book.class, id);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book").list();

        for (Book book : bookList) {
            logger.info("Book list: " + book);
        }

        return bookList;
    }
}
