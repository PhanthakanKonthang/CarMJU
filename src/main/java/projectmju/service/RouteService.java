package projectmju.service;

import org.springframework.transaction.annotation.Transactional;
import projectmju.model.Busstop;
import projectmju.model.Driver;
import projectmju.model.Route;
import projectmju.model.Routetimetable;

import java.util.List;

public interface RouteService {

    List<Route> getRoutes();

    void saveRoute(Route route);

    Route getRouteById(long routeId);
    void updateRoute(Route route);

    void deleteRoute(long routeId);

    List<Busstop> getSearchBusstop(long  id_route);
    List<Routetimetable> getSearchRt(long id_route);

    List<Busstop> getSearchBusstop2();

    List<Route> getRoutesByStartPointAndDestination(String startPoint, String destination);

}
