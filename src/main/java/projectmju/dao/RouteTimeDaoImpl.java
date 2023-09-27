package projectmju.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import projectmju.model.Busstop;
import projectmju.model.Routetimetable;

import java.util.List;

@Repository
public class RouteTimeDaoImpl implements RouteTimeDao{

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public List<Routetimetable> getRoutetimetables() {
        Session session = sessionFactory.getCurrentSession();
        Query<Routetimetable> query = session.createQuery("FROM Routetimetable rt ORDER BY rt.round_no ASC", Routetimetable.class);

        List<Routetimetable> routetimetables = query.getResultList();
        for (Routetimetable rt : routetimetables){
            System.out.println(rt.getRound_no());
        }
        return routetimetables;
    }

    @Override
    public void saveRoutetimetable(Routetimetable routetimetable) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(routetimetable);
    }

    @Override
    public long getLatestRoutetimetableId() {
        Session session = sessionFactory.getCurrentSession();
        Query<Long> query = session.createQuery("SELECT COUNT (rt) FROM Routetimetable rt", Long.class);
        return query.getSingleResult();
    }


    @Override
    public Routetimetable getRoutetimetableById(long RoutetimetableId) {
        Session session = sessionFactory.getCurrentSession();
        Query<Routetimetable> query = session.createQuery("FROM Routetimetable rt WHERE rt.round_no =: rtId", Routetimetable.class);
        query.setParameter("rtId",RoutetimetableId);
        return query.getSingleResult();
    }

    @Override
    public void updateRoutetimetable(Routetimetable routetimetable) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(routetimetable);
    }

    @Override
    public void deleteRoutetimetable(Routetimetable routetimetable) {
        Session session = sessionFactory.getCurrentSession();
        session.remove(routetimetable);
    }
}
