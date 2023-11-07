package projectmju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import projectmju.dao.CarDao;
import projectmju.dao.DriverDao;
import projectmju.model.Car;
import projectmju.model.Driver;

import java.util.List;

@Service
public class DriverServiceImpl implements DriverService{

    @Autowired
    private DriverDao driverDao;

    @Autowired
    private CarDao carDao;

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
    public Driver getDriverById(long driverId) {
        return driverDao.getDriverById(driverId);
    }

    @Override
    @Transactional
    public void updateDriver(Driver driver) {
        driverDao.updateDriver(driver);
    }

    @Override
    @Transactional
    public boolean deleteDriver(long driverId) {
        List<Car> cars = carDao.getCarsByDriverId(driverId);
        if (cars.size() == 0) {
            driverDao.deleteDriver(driverId);
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public List<Driver> getDriversNoCar() {
        return driverDao.getDriversNoCar();
    }

}
