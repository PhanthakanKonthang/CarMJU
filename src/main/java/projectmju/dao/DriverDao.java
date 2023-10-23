package projectmju.dao;

import projectmju.model.Driver;

import java.util.List;

public interface DriverDao {
    List<Driver> getDrivers();

    void saveDriver(Driver driver);

    long getLatestId();

    Driver getDriverById(long driverId);
    void updateDriver(Driver driver);

    void deleteDriver(long driverId);
}
