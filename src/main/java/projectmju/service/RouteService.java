package projectmju.service;

import projectmju.model.Driver;
import projectmju.model.Route;

import java.util.List;

public interface RouteService {

    List<Route> getRoutes();

    void saveRoute(Route route);

    Route getRouteById(long routeId);
    void updateRoute(Route route);

    void deleteRoute(long routeId);
}
