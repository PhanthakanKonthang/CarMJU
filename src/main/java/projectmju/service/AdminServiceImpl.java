package projectmju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import projectmju.dao.AdminDao;
import projectmju.model.Admin;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    @Transactional
    public Admin adminLogin(String username, String password) {
        Admin admin = adminDao.getAdminByUsername(username);
        if (admin != null && admin.getPassword_admin().equals(password)) {
            return admin;
        } else {
            return null;
        }
    }

}
