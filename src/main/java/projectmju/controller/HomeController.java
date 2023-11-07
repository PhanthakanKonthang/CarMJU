package projectmju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import projectmju.model.*;
import projectmju.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class HomeController {

    @Autowired
    private RouteService routeService;
    @Autowired
    private BusstopService busstopService;
    @Autowired
    private RouteTimeService routeTimeService;

    @Autowired
    private CarService carService;

    @RequestMapping("/")
    public String home(Model model) {
        model.addAttribute("busStop", busstopService.getListNameBusStop());
        return "Guest-user/home";
    }


//    @RequestMapping("/searchRoute")
//    public String searchRoute(){
//        return "Guest-user/searchRoute";
//    }

//    @RequestParam("id_route") String id_route

    @PostMapping("/search-result")
    public String searchResult (@RequestParam Map<String, String> map, Model model) {
        model.addAttribute("busStopp", busstopService.getBusstops());
        model.addAttribute("busStop", busstopService.getListNameBusStop());
        String start_point = map.get("start_point");
        String destination = map.get("destination");
        System.out.println("Start point : " + start_point);
        System.out.println("Destination : " + destination);

        List<Routetimetable> routeTimes = routeTimeService.getRoutetimetables();

        List<Route> routes = routeService.getRoutesByStartPointAndDestination(start_point, destination);
        model.addAttribute("start_point_name", start_point);
        model.addAttribute("destination_name", destination);
        Map<String, Integer> maps = new HashMap<>();
        Map<String, Date> timeMaps = new HashMap<>();
        int startPointTime = 0;
        int destinationTime = 0;
        int intervalTime = 0;
        int sumTime = 0;
        for (int i = 0; i < routes.size(); i++) {
            sumTime = 0;
            List<Busstop> busstops = busstopService.getBusstopsByRouteId(routes.get(i).getId_route());
            for (Busstop busstop : busstops) {
                sumTime += busstop.getSpendingtime();
                if (busstop.getName_busstop().equals(start_point)) {
                    startPointTime = sumTime;
                    //timeMaps.put("startTime"+(routes.get(i).getName_route()), startPointTime);
                } else if (busstop.getName_busstop().equals(destination)) {
                    destinationTime = sumTime;
                    //timeMaps.put("destinationTime"+(routes.get(i).getName_route()), destinationTime);
                }
            }
            intervalTime = destinationTime - startPointTime;
            maps.put(routes.get(i).getName_route(), intervalTime);
        }
        model.addAttribute("intervals", maps);
        //model.addAttribute("timemaps", timeMaps);
        model.addAttribute("routes", routes);
        model.addAttribute("routesTimeTable", routeTimeService.getRoutetimetables());
        model.addAttribute("routeTime", routeTimes);
        return "Guest-user/home";
    }





    @GetMapping("/searchRoute")
    public String searchRoute(Model model, @RequestParam("id_route") String id_route) {
        model.addAttribute("route", routeService.getRoutes());
        Route route = routeService.getRouteById(Long.parseLong(id_route));
        String primaryColorCode = "";
        String secondaryColorCode = "";
        if (route.getName_route().equals("เส้นสีแดง")) {
            primaryColorCode = "#e12121";
            secondaryColorCode = "#eeb29b";
        } else if (route.getName_route().equals("เส้นสีฟ้า")) {
            primaryColorCode = "#56b0cb";
            secondaryColorCode = "#98d0f3";
        }
        model.addAttribute("primaryColorCode", primaryColorCode);
        model.addAttribute("secondaryColorCode", secondaryColorCode);
//        model.addAttribute("routeTimeTable", routeTimeService.getRoutetimetables());

        model.addAttribute("routeTimeTable", routeService.getSearchRt(Long.parseLong(id_route)));
        model.addAttribute("busstop", routeService.getSearchBusstop(Long.parseLong(id_route)));
        System.out.println(routeTimeService.getRoutetimetables().size());
        System.out.println("ID ROUTE : " + id_route);
        return "Guest-user/searchRoute";
    }

    @GetMapping("/searchRoute2")
    public String searchRoute2(Model model) {

        model.addAttribute("route", routeService.getRoutes());
        model.addAttribute("routeTimeTable", null);
//
        model.addAttribute("busstop", null);
        model.addAttribute("routeTimeTable", null);

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


