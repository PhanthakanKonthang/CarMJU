package projectmju.model;

import javax.persistence.*;
@Entity
@Table(name="car")
public class Car {


    @Id
    @Column(name = "regplate_no",  length = 6)
    private String regplate_no;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_driver")
    private Driver driver;

    @ManyToOne
    @JoinColumn(name = "id_route")
    private Route route;

    public String getRegplate_no() {
        return regplate_no;
    }

    public void setRegplate_no(String regplate_no) {
        this.regplate_no = regplate_no;
    }

    public Driver getDriver() {
        return driver;
    }

    public void setDriver(Driver driver) {
        this.driver = driver;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }
}