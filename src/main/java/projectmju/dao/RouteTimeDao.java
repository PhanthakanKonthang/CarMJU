package projectmju.dao;



import projectmju.model.Busstop;
import projectmju.model.Routetimetable;

import java.util.List;

public interface RouteTimeDao {

    List<Routetimetable> getRoutetimetables();

    void saveRoutetimetable(Routetimetable routetimetable);

    long getLatestRoutetimetableId();

    Routetimetable getRoutetimetableById(long RoutetimetableId);

    void updateRoutetimetable(Routetimetable routetimetable);

    void deleteRoutetimetable(Routetimetable routetimetable);

    List<Routetimetable> getRoutetimetableByRoute();
}
