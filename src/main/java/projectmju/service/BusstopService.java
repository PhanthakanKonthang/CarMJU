package projectmju.service;

import projectmju.model.Busstop;
import projectmju.model.Route;

import java.util.List;

public interface BusstopService {
    List<Busstop> getBusstops();

    void saveBusstop(Busstop busstop);

    Busstop getBusstopById(long busstopId);
    void updateBusstop(Busstop busstop);

    void deleteBusstop(Busstop busstop);
}
