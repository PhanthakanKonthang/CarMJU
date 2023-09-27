package projectmju.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admin")
public class Admin {

    @Id
    @Column(name = "user_admin",nullable = false,length = 50)
    private String user_admin;

    @Column(name="password_admin",nullable = false,length = 20)
    private String password_admin;

    public String getUser_admin() {
        return user_admin;
    }

    public void setUser_admin(String user_admin) {
        this.user_admin = user_admin;
    }

    public String getPassword_admin() {
        return password_admin;
    }

    public void setPassword_admin(String password_admin) {
        this.password_admin = password_admin;
    }
}
