package projectmju.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="busstop")
public class Busstop {

    
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment" ,strategy = "increment")
    @Column(name = "id_busstop",nullable = false)
    private long id_busstop;

    @Column(name="name_busstop",nullable = false,length = 150)
    private String name_busstop;


    @Column(name="spendingtime",nullable = false)
    private int spendingtime;


    @ManyToOne
    @JoinColumn(name = "id_route", nullable = false)
    private Route route;

    public Busstop() {
    }

    public Busstop(String name_busstop, int spendingtime, Route route) {
        this.name_busstop = name_busstop;
        this.spendingtime = spendingtime;
        this.route = route;
    }


    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

    public long getId_busstop() {
        return id_busstop;
    }

    public void setId_busstop(int id_busstop) {
        this.id_busstop = id_busstop;
    }

    public String getName_busstop() {
        return name_busstop;
    }

    public void setName_busstop(String name_busstop) {
        this.name_busstop = name_busstop;
    }

    public int getSpendingtime() {
        return spendingtime;
    }

    public void setSpendingtime(int spendingtime) {
        this.spendingtime = spendingtime;
    }
}
