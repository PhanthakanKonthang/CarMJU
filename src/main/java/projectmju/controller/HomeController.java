package projectmju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import projectmju.model.Busstop;
import projectmju.model.Driver;
import projectmju.model.Route;
import projectmju.service.BusstopService;
import projectmju.service.DriverService;
import projectmju.service.RouteService;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class HomeController {


//@GetMapping("/")
//public String homePage(){
//    return "Guest-user/home";
//}

    @RequestMapping("/home")
    public String home(){
        return "Guest-user/home";
    }

    @RequestMapping("/searchRoute")
    public String searchRoute(){
        return "Guest-user/searchRoute";
    }
//    @RequestMapping("/loginAdmin")
//    public String loginAdmin(){
//        return "loginAdmin";
//    }








}


