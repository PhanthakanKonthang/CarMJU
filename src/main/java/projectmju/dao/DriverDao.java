package projectmju.dao;

import projectmju.model.Driver;

import java.util.List;

public interface DriverDao {
    List<Driver> getDrivers();

    void saveDriver(Driver driver);

    Driver getDriverById(String driverId);
    void updateDriver(Driver driver);

    void deleteDriver(String driverId);
}
