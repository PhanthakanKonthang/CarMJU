package projectmju.service;

import projectmju.model.Driver;

import java.util.List;

public interface DriverService {
    List<Driver> getDrivers();

    void saveDriver(Driver driver);

    Driver getDriverById(long driverId);
    void updateDriver(Driver driver);

    boolean deleteDriver(long driverId);

    List<Driver> getDriversNoCar();

}
