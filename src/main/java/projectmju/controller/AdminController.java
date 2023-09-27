package projectmju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectmju.model.Admin;
import projectmju.service.AdminService;
import projectmju.service.DriverService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private DriverService driverService;

    @RequestMapping("/home-admin")
    public String homeAdmin(){
        return "admin/home-admin";
    }
    @RequestMapping("/searchRoute-admin")
    public String searchRouteAdmin(){
        return "admin/searchRoute-admin";
    }

    @RequestMapping("/login")
    public String goToLoginPage () {
        return "Guest-user/loginAdmin";
    }

    @PostMapping("/doLogin")
    public String doLogin (@RequestParam Map<String, String> map, Model model, HttpSession session) {
        String username = map.get("username");
        String password = map.get("password");
        Admin admin = adminService.adminLogin(username, password);
        if (admin != null) {
            session.setAttribute("admin", admin);
            session.setMaxInactiveInterval(60 * 5);
            return "redirect:/driver-list";
        } else {
            model.addAttribute("loginFailed", true);
            return "Guest-user/loginAdmin";
        }
    }

    @RequestMapping("/doLogout")
    public String doLogout (HttpSession session) {
        session.setAttribute("admin", null);
        return "redirect:/login";
    }


    @RequestMapping("/driver-list")
    public String driverPage(Model model, HttpSession session){
        if (session.getAttribute("admin") != null) {
            model.addAttribute("driversPack", driverService.getDrivers());
            return "admin/driverList";
        } else {
            return "Guest-user/loginAdmin";
        }
    }

//    @RequestMapping("/addbusstop")
//    public String addBusStop (@RequestBody Map<String, String> map) {
//        String test = map.get("busstopname");
//        System.out.println("sdfsdf ");
//        return "admin/driverList";
//    }

}
