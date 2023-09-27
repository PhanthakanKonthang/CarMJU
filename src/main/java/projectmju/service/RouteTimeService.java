package projectmju.service;

import projectmju.model.Routetimetable;

import java.util.List;

public interface RouteTimeService {

    List<Routetimetable> getRoutetimetables();

    void saveRoutetimetable(Routetimetable routetimetable);

    long getLatestRoutetimetableId();

    Routetimetable getRoutetimetableById(long RoutetimetableId);

    void updateRoutetimetable(Routetimetable routetimetable);

    void deleteRoutetimetable(Routetimetable routetimetable);

}
