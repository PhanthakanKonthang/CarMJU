package projectmju.dao;


import projectmju.model.Busstop;
import projectmju.model.Route;
import projectmju.model.Routetimetable;

import java.util.List;

public interface RouteDao {

    List<Route> getRoutes();

    void saveRoute(Route route);

    long getLatestId();

    Route getRouteById(long RouteId);
    void updateRoute(Route route);

    void deleteRoute(long routeId);

    List<Busstop> getSearchBusstop(long  id_route);


    List<Routetimetable> getSearchRt(long id_route);

    List<Busstop> getSearchBusstop2();
}
