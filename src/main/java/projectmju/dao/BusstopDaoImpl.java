package projectmju.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import projectmju.model.Busstop;
import projectmju.model.Driver;


import java.util.List;
import java.util.Set;

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
    public List<Busstop> getBusstopGroupByNameNoDes() {
        Session session = sessionFactory.getCurrentSession();
//        Query <Busstop> query = session.createQuery("FROM Busstop b group by b.name_busstop ORDER BY b.id_busstop ASC", Busstop.class);
        Query <Busstop> query = session.createQuery("FROM Busstop b where name_busstop<> 'โรงเทิดกสิกร (ปลายทาง)' group by b.name_busstop ORDER BY b.id_busstop ASC", Busstop.class);
        List<Busstop> busStops = query.getResultList();
        for (Busstop b : busStops) {
            System.out.println(b.getId_busstop());
        }
        return busStops;
    }

    @Override
    public List<Busstop> getBusstopGroupByNameNoStart() {
        Session session = sessionFactory.getCurrentSession();
        Query <Busstop> query = session.createQuery("FROM Busstop b where name_busstop<> 'โรงเทิดกสิกร (ต้นทาง)' group by b.name_busstop ORDER BY b.id_busstop ASC", Busstop.class);
        List<Busstop> busStops = query.getResultList();
        for (Busstop b : busStops) {
            System.out.println(b.getId_busstop());
        }
        return busStops;
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

    @Override
    public List<Busstop> getBusstopsByStartPointAndDestination(String startPoint, String destination) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Busstop b WHERE b.name_busstop =: stp OR b.name_busstop =: des", Busstop.class);
        query.setParameter("stp", startPoint);
        query.setParameter("des", destination);
        return query.getResultList();
    }

    @Override
    public List<Busstop> getBusstopsByRouteId(long routeId) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Busstop b WHERE b.route.id_route =: rid ORDER BY b.id_busstop ASC", Busstop.class);
        query.setParameter("rid", routeId);
        return query.getResultList();
    }



//    @Override
//    public List<Busstop> getListNameBusStop() {
//        Session session = sessionFactory.getCurrentSession();
//        Query <Busstop> query = session.createQuery("select distinct name_busstop FROM Busstop b", Busstop.class);
//        List<Busstop> ListNameBusStop = query.getResultList();
//        return ListNameBusStop;
//    }

    @Override
    public List<String> getListNameBusStop() {
        Session session = sessionFactory.getCurrentSession();
        Query<String> query = session.createQuery("SELECT DISTINCT b.name_busstop FROM Busstop b", String.class);
        List<String> listNameBusStop = query.getResultList();
        return listNameBusStop;
    }

    @Override
    public List<Busstop> getBusstopsByStartPointIdAndDestIdAndRouteId(long start_point_id, long dest_id, long route_id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Busstop> query = session.createQuery("FROM Busstop b WHERE b.id_busstop >= :spid AND b.id_busstop <= :did AND b.route.id_route =: rid ORDER BY b.id_busstop ASC", Busstop.class);
        query.setParameter("spid", start_point_id);
        query.setParameter("did", dest_id);
        query.setParameter("rid", route_id);
        List<Busstop> test = query.getResultList();
        return test;
    }

//    @Override
//    public List<Busstop> getBusStopsByStartPointToDestination() {
//        return null;
//    }


}
