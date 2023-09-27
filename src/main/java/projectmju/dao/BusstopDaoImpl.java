package projectmju.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import projectmju.model.Busstop;


import java.util.List;

@Repository
public class BusstopDaoImpl implements BusstopDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Busstop> getBusstops() {
        Session session = sessionFactory.getCurrentSession();
        Query <Busstop> query = session.createQuery("FROM Busstop b ORDER BY b.id_busstop ASC", Busstop.class);

        List<Busstop> busstops = query.getResultList();
        for (Busstop b : busstops) {
            System.out.println(b.getId_busstop());
        }
        return busstops;
    }

    @Override
    public void saveBusstop(Busstop busstop) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(busstop);
    }

    @Override
    public long getLatestBusStopId() {
        Session session = sessionFactory.getCurrentSession();
        Query<Long> query = session.createQuery("SELECT COUNT(b) FROM Busstop b", Long.class);
        return query.getSingleResult();
    }

    @Override
    public Busstop getBusstopById(long busstopId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Busstop> query = session.createQuery("FROM Busstop b WHERE b.id_busstop =: bId", Busstop.class);
        query.setParameter("bId", busstopId);
        return query.getSingleResult();
    }

    @Override
    public void updateBusstop(Busstop busstop) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(busstop);
    }

    @Override
    public void deleteBusstop(Busstop busstop) {
        Session session = sessionFactory.getCurrentSession();
        session.remove(busstop);
    }
}
