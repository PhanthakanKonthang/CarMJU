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
import projectmju.service.RouteTimeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    private RouteService routeService;
    @Autowired
    private BusstopService busstopService;
    @Autowired
    private RouteTimeService routeTimeService;

    @RequestMapping("/")
    public String home() {
        return "Guest-user/home";
    }


//    @RequestMapping("/searchRoute")
//    public String searchRoute(){
//        return "Guest-user/searchRoute";
//    }

//    @RequestParam("id_route") String id_route


    @GetMapping("/searchRoute")
    public String searchRoute(Model model, @RequestParam("id_route") String id_route) {
        model.addAttribute("route", routeService.getRoutes());
//        model.addAttribute("routeTimeTable", routeTimeService.getRoutetimetables());

        model.addAttribute("routeTimeTable", routeService.getSearchRt(Long.parseLong(id_route)));

        System.out.println(routeTimeService.getRoutetimetables().size());
        model.addAttribute("busstop", routeService.getSearchBusstop(Long.parseLong(id_route)));
        System.out.println("ID ROUTE : " + id_route);
        return "Guest-user/searchRoute";
    }

    @GetMapping("/searchRoute2")
    public String searchRoute2(Model model) {
        model.addAttribute("route", routeService.getRoutes());
        model.addAttribute("routeTimeTable", routeTimeService.getRoutetimetables());
//
        model.addAttribute("busstop", routeService.getSearchBusstop(1));

        System.out.println(routeTimeService.getRoutetimetables().size());

        return "Guest-user/searchRoute";
    }


//    @GetMapping("/searchRoute")
//    public String searchRoute(@RequestParam(name = "id_route") long id_route, Model model, HttpSession session) {
//        model.addAttribute("route", routeService.getRoutes());
//        model.addAttribute("routeTimeTable", routeTimeService.getRoutetimetables());
//        model.addAttribute("busstop", routeService.getSearchBusstop(id_route)); // แปลงเป็น int ก่อนส่งไปยัง service
//
//        // อื่น ๆ ที่คุณต้องการทำใน Controller
//
//        return "Guest-user/searchRoute";
//    }


}


