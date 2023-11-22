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
import java.util.stream.Collectors;

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
        model.addAttribute("busStopNoDes", busstopService.getBusstopGroupByNameNoDes());
        model.addAttribute("busStopNoStart", busstopService.getBusstopGroupByNameNoStart());
        model.addAttribute("busStop", busstopService.getListNameBusStop());
        return "Guest-user/home";
    }

    @RequestMapping("/map")
    public String map(Model model) {
        model.addAttribute("busStop", busstopService.getListNameBusStop());
        return "Guest-user/map";
    }


//    @RequestMapping("/searchRoute")
//    public String searchRoute(){
//        return "Guest-user/searchRoute";
//    }

//    @RequestParam("id_route") String id_route

    @PostMapping("/search-result")
    public String searchResult (@RequestParam Map<String, String> map, Model model) {
        model.addAttribute("busStopNoDes", busstopService.getBusstopGroupByNameNoDes());
        model.addAttribute("busStopNoStart", busstopService.getBusstopGroupByNameNoStart());
        model.addAttribute("busStop", busstopService.getListNameBusStop());
        String start_point = map.get("start_point");
        String destination = map.get("destination");
        System.out.println("Start point : " + start_point);
        System.out.println("Destination : " + destination);

        List<Routetimetable> routeTimes = routeTimeService.getRoutetimetables();

        List<Route> routes = routeService.getRoutesByStartPointAndDestination(start_point, destination);

        Map<String, String> routeColors = new HashMap<>();
        Map<String, String> secondaryColorCode = new HashMap<>();


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
        System.out.println("แสดงค่า" + maps);
        System.out.println("MAP SIZEEE : " + maps.size());
        System.out.println("NULL STATE : " + (maps == null? "NULL" : "NOT NULL"));
        //model.addAttribute("timemaps", timeMaps);

        List<Route> resultRoute = new ArrayList<>();

        for (Route route : routes) {
            long startPointId = busstopService.findBusstopInRouteByName(route, start_point).getId_busstop();
            long destinationId = busstopService.findBusstopInRouteByName(route, destination).getId_busstop();
            List<Busstop> listB = busstopService.getBusstopsByStartPointIdAndDestIdAndRouteId(startPointId, destinationId, route.getId_route());
            route.setBusstops(listB);
            resultRoute.add(route);

//            String secondaryColorCode = "";

            if (route.getName_route().equals("เส้นสีแดง")) {
                routeColors.put("เส้นสีแดง", "#e51c23");
                secondaryColorCode.put("เส้นสีแดง","#f9bdbb");
            } else if (route.getName_route().equals("เส้นสีฟ้า")) {
                routeColors.put("เส้นสีฟ้า", "#03a9f4");
                secondaryColorCode.put("เส้นสีฟ้า","#b3e5fc");
//                secondaryColorCode = "#b3e5fc";
            }else if (route.getName_route().equals("เส้นสีเขียว")) {
                routeColors.put("เส้นสีเขียว", "#259b24");
                secondaryColorCode.put("เส้นสีเขียว","#a3e9a4");
//                secondaryColorCode = "#a3e9a4";
            }else if (route.getName_route().equals("เส้นสีเหลือง")) {
                routeColors.put("เส้นสีเหลือง", "#ffeb3b");
                secondaryColorCode.put("เส้นสีเหลือง","#fff9c4");
//                secondaryColorCode = "#fff9c4";
            }

            model.addAttribute("secondaryColorCode", secondaryColorCode);
        }

        model.addAttribute("routes", resultRoute);
        model.addAttribute("routeColors", routeColors);


        model.addAttribute("routesTimeTable", routeTimeService.getRoutetimetables());
        model.addAttribute("routesTimeTableByRoute", routeTimeService.getRoutetimetableByRoute());
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
            primaryColorCode = "#e51c23";
            secondaryColorCode = "#f9bdbb";
        } else if (route.getName_route().equals("เส้นสีฟ้า")) {
            primaryColorCode = "#03a9f4";
            secondaryColorCode = "#b3e5fc";
        } else if (route.getName_route().equals("เส้นสีเขียว")) {
            primaryColorCode = "#259b24";
            secondaryColorCode = "#a3e9a4";
        } else if (route.getName_route().equals("เส้นสีเหลือง")) {
            primaryColorCode = "#ffeb3b";
            secondaryColorCode = "#fff9c4";
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


