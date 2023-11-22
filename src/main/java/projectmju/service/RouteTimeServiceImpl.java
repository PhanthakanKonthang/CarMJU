package projectmju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import projectmju.dao.RouteTimeDao;
import projectmju.model.Busstop;
import projectmju.model.Routetimetable;

import java.util.List;

@Service
public class RouteTimeServiceImpl implements RouteTimeService{

    @Autowired
    private RouteTimeDao routeTimeDao;

    @Override
    @Transactional
    public List<Routetimetable> getRoutetimetables() {
        return routeTimeDao.getRoutetimetables();
    }


    @Override
    @Transactional
    public void saveRoutetimetable(Routetimetable routetimetable) {
        routeTimeDao.saveRoutetimetable(routetimetable);
    }

    @Override
    @Transactional
    public long getLatestRoutetimetableId() {
        return 0;
    }


    @Override
    @Transactional
    public Routetimetable getRoutetimetableById(long RoutetimetableId) {
        return routeTimeDao.getRoutetimetableById(RoutetimetableId);
    }

    @Override
    @Transactional
    public void updateRoutetimetable(Routetimetable routetimetable) {
        routeTimeDao.updateRoutetimetable(routetimetable);
    }

    @Override
    @Transactional
    public void deleteRoutetimetable(Routetimetable routetimetable) {
        routeTimeDao.deleteRoutetimetable(routetimetable);
    }

    @Override
    @Transactional
    public List<Routetimetable> getRoutetimetableByRoute() {
        return routeTimeDao.getRoutetimetableByRoute();
    }

}
