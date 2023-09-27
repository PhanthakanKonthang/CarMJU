package projectmju.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import projectmju.model.Route;

import java.util.List;

@Repository
public class RouteDaoImpl implements RouteDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Route> getRoutes() {
        Session session = sessionFactory.getCurrentSession();
        Query<Route> query = session.createQuery("FROM Route ", Route.class);
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
}
