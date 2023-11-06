package projectmju.dao;

import projectmju.model.Busstop;


import java.util.List;

public interface BusstopDao {

    List<Busstop> getBusstops();

    void saveBusstop(Busstop busstop);

    long getLatestBusStopId();

    Busstop getBusstopById(long BusstopId);
    void updateBusstop(Busstop busstop);

    void deleteBusstop(Busstop busstop);

    List<Busstop> getBusstopsByStartPointAndDestination (String startPoint, String destination);

    List<Busstop> getBusstopsByRouteId (long routeId);

    List<String> getListNameBusStop();

}
