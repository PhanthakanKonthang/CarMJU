package projectmju.dao;

import projectmju.model.Busstop;


import java.util.List;
import java.util.Set;

public interface BusstopDao {

    List<Busstop> getBusstops();

    List<Busstop> getBusstopGroupByNameNoDes();

    List<Busstop> getBusstopGroupByNameNoStart();

    void saveBusstop(Busstop busstop);

    long getLatestBusStopId();

    Busstop getBusstopById(long BusstopId);
    void updateBusstop(Busstop busstop);

    void deleteBusstop(Busstop busstop);

    List<Busstop> getBusstopsByStartPointAndDestination (String startPoint, String destination);

    List<Busstop> getBusstopsByRouteId (long routeId);

    List<String> getListNameBusStop();

    List<Busstop> getBusstopsByStartPointIdAndDestIdAndRouteId(long start_point_id, long dest_id, long route_id);
//    List<Busstop> getBusStopsByStartPointToDestination();
}
