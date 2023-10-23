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
    public String addDriverPage (Model model){
        model.addAttribute("driver", new Driver());
        return "admin/addDriver";
    }

    @RequestMapping("/saveDriver")
    public String saveDriver (Driver driver, @RequestParam Map<String,String> params){
        Driver driver1 = new Driver();
        driver1.setId_driver(0);
        driver1.setName_driver(params.get("name_driver"));
        driver1.setSername_driver(params.get("sername_driver"));
        driver1.setTel_driver(params.get("tel_driver"));
        driver1.setEmail_driver(params.get("email_driver"));

        driverService.saveDriver(driver1);
        //System.out.println(route.getId_route());
        return "redirect:/driver-list";
    }


    @GetMapping("driver/{id}")
    public String dv (@PathVariable("id") String driverId, Model model){
        model.addAttribute("driver", driverService.getDriverById(Long.parseLong((driverId))));
        return "admin/editDriver";
    }

    @RequestMapping("updateDriver/{id}")
    public String updateDriverPage (Driver driver, @RequestParam Map<String,String> params, @PathVariable("id") String driverId){
        Driver driver1 = new Driver();
        driver1.setId_driver(Long.parseLong(driverId));
        driver1.setName_driver(params.get("name_driver"));
        driver1.setSername_driver(params.get("sername_driver"));
        driver1.setTel_driver(params.get("tel_driver"));
        driver1.setEmail_driver(params.get("email_driver"));

        driverService.saveDriver(driver1);
        return "redirect:/driver-list";
    }

    @GetMapping("deleteDriver/{id}")
    public String deleteDriver (@PathVariable("id") String driverId){
        driverService.deleteDriver(Long.parseLong(driverId));
        return "redirect:/driver-list";
    }
    //Driver
    //Driver
    //Driver
}
