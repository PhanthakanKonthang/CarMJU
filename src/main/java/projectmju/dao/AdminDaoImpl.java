package projectmju.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import projectmju.model.Admin;

@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Admin getAdminByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        System.out.println(username);
        Query<Admin> query = session.createQuery("FROM Admin a WHERE a.user_admin =: userName", Admin.class);
        query.setParameter("userName", username);
        return query.getSingleResult();
    }
}
