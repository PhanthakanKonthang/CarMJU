package projectmju.model;

import javax.persistence.*;
@Entity
@Table(name="driver")
public class Driver {
    @Id
    @Column(name = "id_driver",nullable = false,length = 5)
    private String id_driver;

    @Column(name="name_driver",nullable = false,length = 100)
    private String name_driver;

    @Column(name="sername_driver",nullable = false,length = 100)
    private String sername_driver;

    @Column(name="tel",nullable = false,length = 10)
    private String tel_driver;

    @Column(name="email",nullable = false,length = 100)
    private String email_driver;

///////////////////////////////
    public String getId_driver() {
        return id_driver;
    }

    public void setId_driver(String id_driver) {
        this.id_driver = id_driver;
    }

    public String getName_driver() {
        return name_driver;
    }

    public void setName_driver(String name_driver) {
        this.name_driver = name_driver;
    }

    public String getSername_driver() {
        return sername_driver;
    }

    public void setSername_driver(String sername_driver) {
        this.sername_driver = sername_driver;
    }

    public String getTel_driver() {
        return tel_driver;
    }

    public void setTel_driver(String tel_driver) {
        this.tel_driver = tel_driver;
    }

    public String getEmail_driver() {
        return email_driver;
    }

    public void setEmail_driver(String email_driver) {
        this.email_driver = email_driver;
    }
}


