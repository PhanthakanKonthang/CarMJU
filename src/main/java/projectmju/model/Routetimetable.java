package projectmju.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;

@Entity
@Table(name="routeTimetable")
public class Routetimetable {

//    @Id
//    @Column(name = "round_no",nullable = false,length = 3)
//    private String round_no;

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment" ,strategy = "increment")
    private long round_no;

//    @Id
//    @GeneratedValue(generator = "increment")
//    @GenericGenerator(name = "increment" ,strategy = "increment")
//    private long id_route;

    @Temporal(TemporalType.TIME)
    @Column(name="start_time",nullable = false)
    private Date start_time;

    @Column(name="status",nullable = false,length = 15)
    private String status;

    @ManyToOne
    @JoinColumn(name = "id_route", nullable = false)
    private Route route;

    public Routetimetable() {
    }

    public Routetimetable( Time start_time, String status, Route route) {
        this.start_time = start_time;
        this.status = status;
        this.route = route;
    }

    public long getRound_no() {
        return round_no;
    }

    public void setRound_no(long round_no) {
        this.round_no = round_no;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }
}
