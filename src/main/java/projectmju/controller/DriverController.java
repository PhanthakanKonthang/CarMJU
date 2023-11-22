package projectmju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
    public String saveDriver (Driver driver, @RequestParam Map<String,String> params, RedirectAttributes redirectAttributes){
        Driver driver1 = new Driver();
        driver1.setId_driver(0);
        driver1.setName_driver(params.get("name_driver"));
        driver1.setSername_driver(params.get("sername_driver"));
        driver1.setTel_driver(params.get("tel_driver"));
        driver1.setEmail_driver(params.get("email_driver"));

        try {
            driverService.saveDriver(driver1);
            //System.out.println(route.getId_route());
            return "redirect:/driver-list";
        } catch (Exception e) { redirectAttributes.addFlashAttribute("Error", "พบข้อมูลที่ซ้ำกันในฐานข้อมูล.");
            return "redirect:/addDriver";
        }


//        driverService.saveDriver(driver1);
//        //System.out.println(route.getId_route());
//        return "redirect:/driver-list";
    }


    @GetMapping("driver/{id}")
    public String dv (@PathVariable("id") String driverId, Model model){
        model.addAttribute("driver", driverService.getDriverById(Long.parseLong((driverId))));
        return "admin/editDriver";
    }

    @RequestMapping("updateDriver/{id}")
    public String doUpdateDriver (Driver driver, @RequestParam Map<String,String> params, @PathVariable("id") String driverId,RedirectAttributes redirectAttributes){
        Driver driver1 = new Driver();
        driver1.setId_driver(Long.parseLong(driverId));
        driver1.setName_driver(params.get("name_driver"));
        driver1.setSername_driver(params.get("sername_driver"));
        driver1.setTel_driver(params.get("tel_driver"));
        driver1.setEmail_driver(params.get("email_driver"));


        try {
            driverService.saveDriver(driver1);
            //System.out.println(route.getId_route());
            return "redirect:/driver-list";
//        } catch (Exception e) { redirectAttributes.addFlashAttribute("Error", "โปรดตรวสอบชื่อ-นามสกุล เบอร์โทร และอีเมลว่าซ้ำกับคนขับรถท่านอื่นหรือไม่");
        } catch (Exception e) { redirectAttributes.addFlashAttribute("Error", " พบข้อมูลที่ซ้ำกันในฐานข้อมูล ");

            return "redirect:/driver/{id}";
        }


//        driverService.saveDriver(driver1);
//        return "redirect:/driver-list";
    }

    @GetMapping("deleteDriver/{id}")
    public String deleteDriver (@PathVariable("id") String driverId, Model model){
        boolean delFinished = driverService.deleteDriver(Long.parseLong(driverId));
        if (!delFinished) {
            model.addAttribute("delAlert", false);
        }
        model.addAttribute("driversPack", driverService.getDrivers());
        return "admin/list-driver";
    }
    //Driver
    //Driver
    //Driver
}
