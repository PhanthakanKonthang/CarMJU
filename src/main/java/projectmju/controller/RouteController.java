package projectmju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import projectmju.model.Route;
import projectmju.service.BusstopService;
import projectmju.service.CarService;
import projectmju.service.DriverService;
import projectmju.service.RouteService;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class RouteController {

    @Autowired
    private RouteService routeService;
    @Autowired
    private BusstopService busstopService;
    @Autowired
    private CarService carService;
    @Autowired
    private DriverService driverService;

    // Route Route Route Route Route Route Route Route Route
    // Route Route Route Route Route Route Route Route Route
    // Route Route Route Route Route Route Route Route Route

    @RequestMapping("/addRoute")
    public String addRoute(Model model){
        model.addAttribute("route", new Route());
        return "admin/addRoute";
    }

    @RequestMapping("/saveRoute")
    public String saveRoute (Route route, @RequestParam Map<String,String> params){
        Route route1 = new Route();
        route1.setId_route(0);
        route1.setName_route(params.get("nameRoute"));

        //System.out.println(route.getId_route());
        routeService.saveRoute(route1);
        return "redirect:/list-route";
    }


    @GetMapping("route/{id}")
    public String routeDetailEdit (@PathVariable("id") String routeId, Model model){
        model.addAttribute("route", routeService.getRouteById(Long.parseLong(routeId)));
        return "admin/editRoute";
    }

    @RequestMapping("/updateRoute/{id}")
    public String doUpdateRoute (Route route, @RequestParam Map<String,String> params, @PathVariable("id") String routeId) {
        Route route1 = new Route();
        route1.setId_route(Long.parseLong(routeId));
        route1.setName_route(params.get("nameRoute"));

        //System.out.println(route.getId_route());
        routeService.saveRoute(route1);
        return "redirect:/list-route";
    }

    @GetMapping("deleteRoute/{id}")
    public String deleteRoute (@PathVariable("id") String routeId, Model model){
        boolean delStatus = routeService.deleteRoute(Long.parseLong(routeId));
        if (!delStatus) {
            model.addAttribute("delAlert", false);
        }
        model.addAttribute("routespack", routeService.getRoutes());
        return "admin/list-route";
    }


    @RequestMapping("/list-route")
    public String getListRoute(Model model) {
        model.addAttribute("routespack", routeService.getRoutes());
//        model.addAttribute("carByIdRoute", carService.getCarByRouteId(Long.parseLong((routeId))));
        return "admin/list-route";
    }

//    @RequestMapping("/list-route")
//    public String ListRoutePage(Model model, HttpServletRequest request, @PathVariable(name = "id", required = false) Long routeId) {
//        if (routeId != null) {
//            model.addAttribute("carByIdRoute", carService.getCarByRouteId(routeId));
//        }
//        model.addAttribute("routespack", routeService.getRoutes());
//        return "admin/list-route";
//    }



//    @RequestMapping("/Route")
//    public String routePage(Model model, HttpServletRequest request) {
//        model.addAttribute("routes", routeService.getRoutes());
//        model.addAttribute("busstops", busstopService.getBusstops());
//        request.
//        return "admin/Route";
//    }


    // Route Route Route Route Route Route Route Route Route
    // Route Route Route Route Route Route Route Route Route
    // Route Route Route Route Route Route Route Route Route

}
