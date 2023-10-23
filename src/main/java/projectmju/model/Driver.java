package projectmju.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;
@Entity
@Table(name="driver")
public class Driver {
    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment" ,strategy = "increment")
    private long id_driver;

    @Column(name = "name_driver", nullable = false, length = 100)
    private String name_driver;

    @Column(name = "sername_driver", nullable = false, length = 100)
    private String sername_driver;

    @Column(name = "tel", nullable = false, length = 10)
    private String tel_driver;

    @Column(name = "email", nullable = false, length = 100)
    private String email_driver;


    ///////////////////////////////


    public Driver() {
    }

    public Driver(long id_driver, String name_driver, String sername_driver, String tel_driver, String email_driver) {
        this.id_driver = id_driver;
        this.name_driver = name_driver;
        this.sername_driver = sername_driver;
        this.tel_driver = tel_driver;
        this.email_driver = email_driver;
    }

    public long getId_driver() {
        return id_driver;
    }

    public void setId_driver(long id_driver) {
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


