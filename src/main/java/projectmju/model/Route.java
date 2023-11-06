package projectmju.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="route")
public class Route {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment" ,strategy = "increment")
    private long id_route;

    @Column(name="name_route",nullable = false,length = 100)
    private String name_route;

//    @OneToMany(cascade = CascadeType.ALL)
//    @JoinColumn(name = "id_route",nullable = false)
//    private Set<Routetimetable> routetimetable = new HashSet<>();

    @OneToMany(mappedBy = "route", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Routetimetable> routetimetable = new HashSet<>();

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "id_route")
    private Set<Car> cars = new HashSet<>();

    @OneToMany(mappedBy = "route", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Busstop> busstops = new HashSet<>();

    /////////////////////


    public Route() {
    }


    public long getId_route() {
        return id_route;
    }

    public void setId_route(long id_route) {
        this.id_route = id_route;
    }

    public String getName_route() {
        return name_route;
    }

    public void setName_route(String name_route) {
        this.name_route = name_route;
    }

    public Set<Routetimetable> getRoutetimetable() {
        return routetimetable;
    }

    public void setRoutetimetable(Set<Routetimetable> routetimetable) {
        this.routetimetable = routetimetable;
    }

    public Set<Car> getCars() {
        return cars;
    }

    public void setCars(Set<Car> cars) {
        this.cars = cars;
    }

    public Set<Busstop> getBusstops() {
        return busstops;
    }

    public void setBusstops(Set<Busstop> busstops) {
        this.busstops = busstops;
    }




    //    public Set<Busstop> getBusstops() {
//        return busstops;
//    }
//
//    public void setBusstops(Set<Busstop> busstops) {
//        this.busstops = busstops;
//    }


//    @OneToMany(cascade = CascadeType.ALL)
//    @JoinColumn(name = "id_route",nullable = false);
//    private Set<Car> car = new HashSet<>();
}
