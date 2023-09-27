package projectmju.model;

import javax.persistence.*;
@Entity
@Table(name="car")
public class Car {


    @Id
    @Column(name = "regplate_no",  length = 6)
    private String regplate_no;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_driver",nullable = false)
    private Driver driver;

}