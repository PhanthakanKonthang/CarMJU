package projectmju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import projectmju.dao.BusstopDao;
import projectmju.dao.RouteDao;
import projectmju.model.Busstop;
import projectmju.model.Route;

import java.util.List;

@Service
public class BusstopServiceImpl implements BusstopService{

    @Autowired
    private BusstopDao busstopDao;

    @Override
    @Transactional
    public List<Busstop> getBusstops() {
        return busstopDao.getBusstops();
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
}
