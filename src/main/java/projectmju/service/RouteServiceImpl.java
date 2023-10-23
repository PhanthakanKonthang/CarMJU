package projectmju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import projectmju.dao.RouteDao;
import projectmju.model.Busstop;
import projectmju.model.Route;
import projectmju.model.Routetimetable;

import java.util.List;

@Service
public class RouteServiceImpl implements RouteService{

    @Autowired
    private RouteDao routeDao;

    @Override
    @Transactional
    public List<Route> getRoutes() {
        return routeDao.getRoutes();
    }
    @Override
    @Transactional
    public void saveRoute(Route route) {
//        long id = routeDao.getLatestId();
//        route.setId_route(generateLatestId(id + 1));
        routeDao.saveRoute(route);
    }

    public String generateLatestId (long id){
        String result = String.valueOf(id);
        while (result.length() != 3 ) {
            result = "0" + result;
        }
        return "R" + result;
    }


    @Override
    @Transactional
    public Route getRouteById(long routeId) {
        return routeDao.getRouteById(routeId);
    }

    @Override
    @Transactional
    public void updateRoute(Route route) {
        routeDao.updateRoute(route);
    }

    @Override
    @Transactional
    public void deleteRoute(long routeId) {
        routeDao.deleteRoute(routeId);
    }


    @Override
    @Transactional
    public List<Busstop> getSearchBusstop(long  id_route) {
        return routeDao.getSearchBusstop(id_route);
    }

    @Override
    @Transactional
    public List<Routetimetable> getSearchRt(long id_route) {
        return routeDao.getSearchRt(id_route);
    }

    @Override
    @Transactional
    public List<Busstop> getSearchBusstop2() {
        return routeDao.getSearchBusstop2();
    }

}
