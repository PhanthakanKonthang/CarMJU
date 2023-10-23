package projectmju.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import projectmju.model.Busstop;
import projectmju.model.Route;
import projectmju.model.Routetimetable;

import java.util.List;

@Repository
public class RouteDaoImpl implements RouteDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Route> getRoutes() {
        Session session = sessionFactory.getCurrentSession();
        Query<Route> query = session.createQuery("FROM Route ", Route.class);
//        Query<Route> query = session.createQuery("FROM Route R WHERE R.busstops = : id_route ", Route.class);
        List<Route> routes = query.getResultList();
        return routes;
    }

    @Override
    public void saveRoute(Route route) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(route);
    }

    @Override
    public long getLatestId() {
        Session session = sessionFactory.getCurrentSession();
        Query<Long> query = session.createQuery("SELECT COUNT(r) FROM Route r", Long.class);
        return query.getSingleResult();
    }

    @Override
    public Route getRouteById(long routeId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Route> query = session.createQuery("FROM Route r WHERE r.id_route =: rId", Route.class);
        query.setParameter("rId", routeId);
        return query.getSingleResult();
    }

    @Override
    public void updateRoute(Route route) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(route);
    }

    @Override
    public void deleteRoute(long routeId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Route> query = session.createQuery("FROM Route r WHERE r.id_route =: rId", Route.class);
        query.setParameter("rId", routeId);
        Route route = query.getSingleResult();
        session.remove(route);
    }





//    @Override
//    public List<Busstop> getSearchBusstop(long  id_route) {
//        Session session = sessionFactory.getCurrentSession();
//        Query query = session.createQuery("FROM Busstop WHERE Busstop .id_busstop =:id_route", Busstop.class);
//        query.setParameter("id_route",id_route);
//        List<Busstop> busstops = query.getResultList();
//        return busstops;
//    }

//    @Override
//    public List<Route> getSearchBusstop(long id_route) {
//        Session session = sessionFactory.getCurrentSession();
//        Query<Route> query = session.createQuery("FROM Route r WHERE r.busstops = :id_route and r.routetimetable = :id_route", Route.class);
//
//        query.setParameter("id_route", id_route);
//        List<Route> routes = query.getResultList();
//        return routes;
//    }

    @Override
    public List<Busstop> getSearchBusstop(long id_route) {
        Session session = sessionFactory.getCurrentSession();
        Query<Busstop> query = session.createQuery("FROM Busstop bs  WHERE bs.route.id_route = :id_route ", Busstop.class);


        query.setParameter("id_route", id_route);
        List<Busstop> busstops = query.getResultList();
        System.out.println("จุดจอด " + busstops.size());
        return busstops;
    }

    @Override
    public List<Routetimetable> getSearchRt(long id_route) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Routetimetable rt WHERE rt.route.id_route = :id_route", Routetimetable.class);

        query.setParameter("id_route", id_route);
        List<Routetimetable> routetimetables = query.getResultList();
        return routetimetables;
    }

//    public List<Busstop> getSearchBusstop(long id_route) {
//        Session session = sessionFactory.getCurrentSession();
//        Query query = session.createQuery("SELECT bs FROM Busstop bs JOIN FETCH bs.route rt JOIN FETCH rt.routetimetables WHERE bs.route.id_route = :id_route", Busstop.class);
//
//        query.setParameter("id_route", id_route);
//        List<Busstop> busstops = query.getResultList();
//        return busstops;
//    }





    @Override
    public List<Busstop> getSearchBusstop2() {
        Session session = sessionFactory.getCurrentSession();

        Query<Busstop> query = session.createQuery("FROM Busstop ", Busstop.class);

        List<Busstop> busstops = query.getResultList();
        return busstops;
    }



}
