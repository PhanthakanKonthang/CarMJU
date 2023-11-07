package projectmju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import projectmju.model.Car;
import projectmju.model.Driver;
import projectmju.model.Route;
import projectmju.service.CarService;
import projectmju.service.DriverService;
import projectmju.service.RouteService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;
@Controller
public class CarController {

    @Autowired
    private RouteService routeService;
    @Autowired
    private CarService carService;
    @Autowired
    private DriverService driverService;

    @GetMapping("/assignDriver/{id}")
    public String assign(@PathVariable("id") String routeId, Model model) {
        model.addAttribute("route", routeService.getRouteById(Long.parseLong(routeId)));
        model.addAttribute("carList", carService.getCars());
        model.addAttribute("carNoList", carService.getCarsNoRouteId());
        model.addAttribute("driverList", driverService.getDriversNoCar());
        return "admin/assignDriver";
    }

    @PostMapping(path = "/saveCarRoute/{id}/update")
    public String assignDriver(@RequestParam Map<String, String> allReqParams, HttpServletRequest request, @PathVariable long id) {
        Car car = carService.getCarById(allReqParams.get("selectCarRoute"));
        Route route = routeService.getRouteById(id);
        Driver driver = driverService.getDriverById(Long.parseLong(request.getParameter("selectDriver")));

        car.setRoute(route);

       // long driver = Long.parseLong(request.getParameter("selectDriver"));
        //System.out.println("test" + route.getId_route());
        String regplate = request.getParameter("selectCarRoute");
        car.setRegplate_no(regplate);
        car.setDriver(driver);
        //System.out.println("test2" + regplate);
        carService.updateCar(car);
        return "redirect:/list-route";
    }

    @RequestMapping("/list-assign")
    public String listAssignPage(Model model, HttpSession session) {
//        model.addAttribute("driverList", driverService.getDrivers());
        model.addAttribute("carListDriver", carService.getCarsNotNullRouteAndDriver());

//        System.out.println(carService.getCars().size());

//        for (Car c : carService.getCarsNotNullRouteAndDriver() ) {
//            System.out.println(c.getDriver().getId_driver());
//            System.out.println(c.getDriver().getName_driver());
//            System.out.println(c.getDriver().getSername_driver());
//
//            System.out.println(c.getRegplate_no());
//            System.out.println(c.getRoute().getName_route());
//        }
            return "admin/list-assign";

        }
    }



