package projectmju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import projectmju.dao.BusstopDao;
import projectmju.dao.RouteDao;
import projectmju.model.Busstop;
import projectmju.model.Route;
import projectmju.model.Routetimetable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RouteServiceImpl implements RouteService{

    @Autowired
    private RouteDao routeDao;

    @Autowired
    private BusstopDao busstopDao;

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
    public boolean deleteRoute(long routeId) {
        Route route = routeDao.getRouteById(routeId);
//&& route.getCars().size() == 0
        if ((route.getRoutetimetable().size() == 0 && route.getBusstops().size() == 0) ) {
            routeDao.deleteRoute(routeId);
            return true;
        }
        return false;
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

    @Override
    @Transactional
    public List<Route> getRoutesByStartPointAndDestination(String startPoint, String destination) {
        List<Busstop> busstops = busstopDao.getBusstopsByStartPointAndDestination(startPoint, destination);
        List<Route> result = new ArrayList<>();
        Map<Long, Integer> countPoints = new HashMap<>();
        for (Busstop bs : busstops) {
            //System.out.println("ROUTE : " + bs.getRoute().getName_route());
            //System.out.println("ID : " + bs.getId_busstop());
            if (!countPoints.containsKey(bs.getRoute().getId_route())) {
                countPoints.put(bs.getRoute().getId_route(), 1);
            } else {
                countPoints.put(bs.getRoute().getId_route(), countPoints.get(bs.getRoute().getId_route()) + 1);
            }
        }

        for (Map.Entry<Long, Integer> entry : countPoints.entrySet()) {
            long key = entry.getKey();
            Integer value = entry.getValue();
            //System.out.println("Key: " + key + ", Value: " + value);
            if (value == 2) {
                Route route = routeDao.getRouteById(key);
                //System.out.println("ROUTE NAME : " + busstop.getRoute().getName_route());
                result.add(route);
            }
        }

        return result;
    }

}
