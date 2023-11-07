package projectmju.service;

import projectmju.model.Car;

import java.util.List;

public interface CarService {

    List<Car> getCars();

    void saveCar(Car car);

    Car getCarById(String carId);
    void updateCar(Car car);

    void deleteCar(Car car);

    List<Car> getCarsNotNullRouteAndDriver();

    List<Car> getCarByRouteId(long routeId);

    List<Car> getCarsNoRouteId();
}
