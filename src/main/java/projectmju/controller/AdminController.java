package projectmju.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import projectmju.model.Admin;
import projectmju.service.*;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private DriverService driverService;

    @Autowired
    private RouteService routeService;
    @Autowired
    private BusstopService busstopService;
    @Autowired
    private RouteTimeService routeTimeService;

    @RequestMapping("/home-admin")
    public String homeAdmin() {
        return "admin/home-admin";
    }


//    @RequestMapping("/searchRoute-admin")
//    public String searchRouteAdmin(Model model, HttpSession session) {
//        model.addAttribute("route", routeService.getRoutes());
//
//        return "admin/searchRoute-admin";
//    }

    @GetMapping("/searchRoute-admin")
    public String SearchRouteAdmin( Model model) {

        model.addAttribute("route", routeService.getRoutes());
        model.addAttribute("routeTimeTable", routeTimeService.getRoutetimetables());

        System.out.println(routeTimeService.getRoutetimetables().size());
        model.addAttribute("busstop", routeService.getSearchBusstop((1)));

//        System.out.println(id_route + "hello");
        return "admin/searchRoute-admin";
    }


//    @GetMapping("/search2")
//    public String search(@RequestParam("keyword") String keyword, Model model) {
//        // Assuming planService and Plan class are properly defined
//        model.addAttribute("plans", planService.getSearchPlan(keyword));
//
//        System.out.println(keyword);
//        return "Member/MemberHome";  // Assuming "MainHome.jsp" is the JSP to display search results.
//    }

    @RequestMapping("/login")
    public String goToLoginPage() {
        return "Guest-user/loginAdmin";
    }

//    @PostMapping("/doLogin")
//    public String doLoginByAdmin(@RequestParam Map<String, String> map, Model model, HttpSession session) {
//        String username = map.get("username");
//        String password = map.get("password");
//        Admin admin = adminService.adminLogin(username, password);
//        if (admin != null) {
//            session.setAttribute("admin", admin);
//            session.setMaxInactiveInterval(60 * 15);
//            return "redirect:/driver-list";
//        } else {
//            model.addAttribute("loginFailed", true);
//            return "Guest-user/loginAdmin";
//        }
//    }

//    @PostMapping("/doLogin")
//    public String doLoginByAdmin(@RequestParam Map<String, String> map, Model model, HttpSession session) {
//        String username = map.get("username");
//        String password = map.get("password");
//
//        try {
//            Admin admin = adminService.adminLogin(username, password);
//            if (admin != null) {
//                session.setAttribute("admin", admin);
//                session.setMaxInactiveInterval(60 * 15);
//                return "redirect:/driver-list";
//            } else {
//                model.addAttribute("loginFailed", true);
//                return "Guest-user/loginAdmin";
//            }
//        } catch (NoResultException e) {
//            // กรณีไม่พบผลลัพธ์จากการค้นหา Admin
//            model.addAttribute("loginFailed", true);
//            return "Guest-user/loginAdmin";
//        }
//    }

    @PostMapping("/doLogin")
    public String doLoginByAdmin(@RequestParam Map<String, String> map, Model model, HttpSession session) {
        String username = map.get("username");
        String password = map.get("password");

        try {
            Admin admin = adminService.adminLogin(username, password);
            if (admin != null) {
                session.setAttribute("admin", admin);
                session.setMaxInactiveInterval(60 * 15);
                return "redirect:/driver-list";
            } else {
                model.addAttribute("loginFailed", true);
                return "Guest-user/loginAdmin";
            }
        } catch (NoResultException e) {
            // กรณีไม่พบผลลัพธ์จากการค้นหา Admin
            model.addAttribute("loginFailed", true);
            return "Guest-user/loginAdmin";
        }
    }


    @RequestMapping("/doLogout")
    public String doLogout(HttpSession session) {
        session.setAttribute("admin", null);
        return "redirect:/login";
    }


    @RequestMapping("/driver-list")
    public String getListDriver (Model model, HttpSession session) {
        if (session.getAttribute("admin") != null) {
            model.addAttribute("driversPack", driverService.getDrivers());
            return "admin/list-driver";
        } else {
            return "Guest-user/loginAdmin";
        }
    }


}
