package projectmju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import projectmju.dao.BusstopDao;
import projectmju.dao.RouteDao;
import projectmju.model.Busstop;
import projectmju.model.Route;

import java.util.*;

@Service
public class BusstopServiceImpl implements BusstopService{

    @Autowired
    private BusstopDao busstopDao;

    @Autowired
    private RouteDao routeDao;

    @Override
    @Transactional
    public List<Busstop> getBusstops() {
        return busstopDao.getBusstops();
    }

    @Override
    @Transactional
    public List<Busstop> getBusstopGroupByNameNoDes() {
        return busstopDao.getBusstopGroupByNameNoDes();
    }

    @Override
    @Transactional
    public List<Busstop> getBusstopsByRouteId(long routeId) {
        return busstopDao.getBusstopsByRouteId(routeId);
    }

    @Override
    @Transactional
    public List<Busstop> getBusstopGroupByNameNoStart() {
        return busstopDao.getBusstopGroupByNameNoStart();
    }


    @Override
    @Transactional
    public void saveBusstop(Busstop busstop) {
//        long id = busstopDao.getLatestId();
//        busstop.setId_busstop(generateLatestId(id + 1));
        busstopDao.saveBusstop(busstop);
    }

    @Override
    @Transactional
    public Busstop getBusstopById(long busstopId) {
        return busstopDao.getBusstopById(busstopId);
    }

    @Override
    @Transactional
    public void updateBusstop(Busstop busstop) {
        busstopDao.updateBusstop(busstop);
    }

    @Override
    @Transactional
    public void deleteBusstop(Busstop busstop) {
        busstopDao.deleteBusstop(busstop);
    }

    @Override
    @Transactional
    public List<String> getListNameBusStop() {
        return busstopDao.getListNameBusStop();
    }

    @Override
    public Busstop findBusstopInRouteByName(Route route, String name) {
        for (Busstop busstop : route.getBusstops()) {
            if (name.equals(busstop.getName_busstop())) {
                return busstop;
            }
        }
        return null;
    }

    @Override
    @Transactional
    public List<Busstop> getBusstopsByStartPointIdAndDestIdAndRouteId(long start_point_id, long dest_id, long route_id) {
        return busstopDao.getBusstopsByStartPointIdAndDestIdAndRouteId(start_point_id, dest_id, route_id);
    }
}
