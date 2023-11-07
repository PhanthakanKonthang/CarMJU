package projectmju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import projectmju.dao.CarDao;
import projectmju.model.Car;
import projectmju.model.Driver;

import java.util.List;
@Service
public class CarServiceImpl implements CarService{

    @Autowired
    private CarDao carDao;


    @Override
    @Transactional
    public List<Car> getCars() {
        return carDao.getCars();
    }

    @Override
    @Transactional
    public void saveCar(Car car) {
        carDao.saveCar(car);
    }

    @Override
    @Transactional
    public Car getCarById(String carId) {
        return carDao.getCarById(carId);
    }

    @Override
    @Transactional
    public void updateCar(Car car) {
        carDao.updateCar(car);
    }

    @Override
    @Transactional
    public void deleteCar(Car car) {
        carDao.deleteCar(car);
    }

    @Override
    @Transactional
    public List<Car> getCarsNotNullRouteAndDriver() {
        return carDao.getCarsNotNullRouteAndDriver();
    }

    @Override
    @Transactional
    public List<Car> getCarByRouteId(long routeId) {
        return carDao.getCarByRouteId(routeId);
    }

    @Override
    @Transactional
    public List<Car> getCarsNoRouteId() {
        return carDao.getCarsNoRouteId();
    }


}
