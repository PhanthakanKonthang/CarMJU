package projectmju.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import projectmju.model.Driver;

import java.util.List;

@Repository
public class DriverDaoImpl implements DriverDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Driver> getDrivers() {
        Session session = sessionFactory.getCurrentSession();
        Query<Driver> query = session.createQuery("FROM Driver", Driver.class);
        List<Driver> drivers = query.getResultList();
        return drivers;
    }

    @Override
    public void saveDriver(Driver driver) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(driver);
    }

    @Override
    public long getLatestId() {
        Session session = sessionFactory.getCurrentSession();
        Query<Long> query = session.createQuery("SELECT COUNT(d) FROM Driver d", Long.class);
        return query.getSingleResult();
    }


    @Override
    public Driver getDriverById(long driverId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Driver> query = session.createQuery("FROM Driver d WHERE d.id_driver =: dId", Driver.class);
        query.setParameter("dId", driverId);
        return query.getSingleResult();
    }

    @Override
    public void updateDriver(Driver driver) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(driver);
    }

    @Override
    public void deleteDriver(long driverId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Driver> query = session.createQuery("FROM Driver d WHERE d.id_driver =: dId", Driver.class);
        query.setParameter("dId", driverId);
        Driver driver = query.getSingleResult();
        session.remove(driver);
    }
}
