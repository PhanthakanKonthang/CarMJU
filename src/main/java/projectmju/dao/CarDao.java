package projectmju.dao;

import projectmju.model.Busstop;
import projectmju.model.Car;

import java.util.List;

public interface CarDao {

    List<Car> getCars();

    void saveCar(Car car);

    Car getCarById(String carId);
    void updateCar(Car car);

    void deleteCar(Car car);

    List<Car> getCarsNotNullRouteAndDriver();

    List<Car> getCarByRouteId(long routeId);
}
