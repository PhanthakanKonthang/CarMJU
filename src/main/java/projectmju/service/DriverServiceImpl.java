package projectmju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import projectmju.dao.DriverDao;
import projectmju.model.Driver;

import java.util.List;

@Service
public class DriverServiceImpl implements DriverService{

    @Autowired
    private DriverDao driverDao;

    @Override
    @Transactional
    public List<Driver> getDrivers() {
        return driverDao.getDrivers();
    }

    @Override
    @Transactional
    public void saveDriver(Driver driver) {
        driverDao.saveDriver(driver);
    }

    @Override
    @Transactional
    public Driver getDriverById(String driverId) {
        return driverDao.getDriverById(driverId);
    }

    @Override
    @Transactional
    public void updateDriver(Driver driver) {
        driverDao.updateDriver(driver);
    }

    @Override
    @Transactional
    public void deleteDriver(String driverId) {
        driverDao.deleteDriver(driverId);
    }
}
