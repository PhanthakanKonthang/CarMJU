package projectmju.service;

import projectmju.model.Busstop;
import projectmju.model.Route;

import java.util.List;
import java.util.Set;

public interface BusstopService {
    List<Busstop> getBusstops();

    List<Busstop> getBusstopGroupByNameNoDes();

    List<Busstop> getBusstopsByRouteId(long routeId);

    List<Busstop> getBusstopGroupByNameNoStart();

    void saveBusstop(Busstop busstop);

    Busstop getBusstopById(long busstopId);
    void updateBusstop(Busstop busstop);

    void deleteBusstop(Busstop busstop);

    List<String> getListNameBusStop();

    Busstop findBusstopInRouteByName (Route route, String name);

    List<Busstop> getBusstopsByStartPointIdAndDestIdAndRouteId (long start_point_id, long dest_id, long route_id);
}
