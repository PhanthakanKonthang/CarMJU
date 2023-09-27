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
public class DriverController {

    @Autowired
    private DriverService driverService;

    //Driver
    //Driver
    //Driver
    @RequestMapping("/addDriver")
    public String addDriver(Model model){
        model.addAttribute("driver", new Driver());
        return "admin/addDriver";
    }

    @RequestMapping("/saveDriver")
    public String saveDriver (Driver driver){
        System.out.println(driver.getId_driver());
        driverService.saveDriver(driver);
        return "redirect:/driver-list";
    }

    @GetMapping("driver/{id}")
    public String driverDetailEdit (@PathVariable("id") String driverId, Model model){
        model.addAttribute("driver", driverService.getDriverById(driverId));
        return "admin/editDriver";
    }

    @PostMapping("/updateDv")
    public String updateDriver (Driver driver){
        driverService.updateDriver(driver);
        return "redirect:/driver-list";
    }

    @GetMapping("/deleteDv/{id}")
    public String deleteDriver(@PathVariable("id") String driverId){
        driverService.deleteDriver(driverId);
        return "redirect:/driver-list";
    }

    @RequestMapping("/editDriver")
    public String editDriver(){
        return "admin/editDriver";
    }

    //Driver
    //Driver
    //Driver
}
