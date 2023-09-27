package projectmju.dao;


import projectmju.model.Route;

import java.util.List;

public interface RouteDao {

    List<Route> getRoutes();

    void saveRoute(Route route);

    long getLatestId();

    Route getRouteById(long RouteId);
    void updateRoute(Route route);

    void deleteRoute(long routeId);

}
