package projectmju.dao;

import projectmju.model.Admin;

public interface AdminDao {

    Admin getAdminByUsername (String username);

}
