package projectmju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import projectmju.model.Busstop;
import projectmju.model.Route;
import projectmju.service.BusstopService;
import projectmju.service.RouteService;

import java.util.Map;

@Controller
public class BusStopcontroller {

    @Autowired
    private RouteService routeService;
    @Autowired
    private BusstopService busstopService;




    //BusStop BusStop BusStop BusStop BusStop BusStop BusStop BusStop
    //BusStop BusStop BusStop BusStop BusStop BusStop BusStop BusStop
    //BusStop BusStop BusStop BusStop BusStop BusStop BusStop BusStop
//    @RequestMapping("viewBusStopRoute/{id}")
//        public String viewBusStopRout (@PathVariable("id") String routeId,@RequestParam Map<String, String> allReqParams, Model model){
//        int spendingTime = Integer.parseInt(allReqParams.get("spendingTime"));
//
//        Busstop busstop = new Busstop(spendingTime);
//        busstopService.getBusstops(busstop);
//        return "admin/viewBusStopRoute";
//    }
    @RequestMapping("viewBusStopRoute/{id}")
    public String viewBusStopRoute (@PathVariable("id") String routeId, Model model){
        model.addAttribute("route", routeService.getRouteById(Long.parseLong(routeId)));
        model.addAttribute("busStops", busstopService.getBusstops());
        return "admin/viewBusStopRoute";
    }


    @RequestMapping("/addBusStop/{id_route}")
    public String addBusStop(Model model, @PathVariable("id_route") long id_route){
        model.addAttribute("id_route",id_route);

        return "admin/addBusStop";
    }

    @PostMapping(path = "/saveBusStop/{id_route}")
    public String saveBusStop(@RequestParam Map<String, String> allReqParams, @PathVariable("id_route") long id_route) {
        String nameBussTop = allReqParams.get("nameBussTop");
        int spendingTime = Integer.parseInt(allReqParams.get("spendingTime"));
        Route route = routeService.getRouteById(id_route);

        Busstop busstop = new Busstop(nameBussTop,spendingTime , route);
        busstopService.saveBusstop(busstop);
        return "redirect:/viewBusStopRoute/{id_route}";
    }


//    @GetMapping("busStop/{id}")
//    public String busStopDetailEdit (@PathVariable("id") String busStopId, Model model){
//        model.addAttribute("busStops", busstopService.getBusstopById(Long.parseLong(busStopId)));
//        return "admin/editBusStop";
//    }
//
//    @RequestMapping("/updateBusStop/{id}")
//    public String updateBusStopPage (Busstop busstop, @RequestParam Map<String,String> params, @PathVariable("id") String busStopId) {
//        Busstop busstop1 = new Busstop();
//        busstop1.setId_busstop((int) Long.parseLong(busStopId));
//        busstop1.setName_busstop(params.get("nameBusStop"));
//        busstop1.setSpendingtime(Integer.parseInt(params.get("spendingTime")));
//
//        busstopService.saveBusstop(busstop1);
//        return "redirect:/viewBusStopRoute/{id_route}";
//    }

    @GetMapping("/eDitBusStop/{id_busStop}")
    public String getBusStopDetail(Model model, @PathVariable long id_busStop) {
        Busstop busstop = busstopService.getBusstopById(id_busStop);
        model.addAttribute("busStop", busstop);
        return "admin/editBusStop";
    }

    @PostMapping (path="/{id_busStop}/updateBusStop")
    public String doUpdateBusStop(@RequestParam Map<String, String> allReqParams, @PathVariable long id_busStop) {
        Busstop busstop = busstopService.getBusstopById(id_busStop);
        System.out.println("PASS");
        if (busstop != null) {
            busstop.setName_busstop(allReqParams.get("nameBussTop"));
            busstop.setSpendingtime(Integer.parseInt(allReqParams.get("spendingTime")));
            busstopService.updateBusstop(busstop);

        }
        return "redirect:/viewBusStopRoute/"+busstop.getRoute().getId_route();
    }


    @GetMapping("/{id_busStop}/deleteBusStop")
    public String doDeleteBusStop(@PathVariable long id_busStop) {
        Busstop busstop = busstopService.getBusstopById(id_busStop);
        busstopService.deleteBusstop(busstop);
        return "redirect:/viewBusStopRoute/"+busstop.getRoute().getId_route();
    }




    //BusStop BusStop BusStop BusStop BusStop BusStop BusStop BusStop
    //BusStop BusStop BusStop BusStop BusStop BusStop BusStop BusStop
    //BusStop BusStop BusStop BusStop BusStop BusStop BusStop BusStop

}
