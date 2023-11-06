package projectmju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import projectmju.model.Busstop;
import projectmju.model.Route;
import projectmju.model.Routetimetable;
import projectmju.service.RouteService;
import projectmju.service.RouteTimeService;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
public class RouteTimetableController {

    @Autowired
    private RouteService routeService;
    @Autowired
    private RouteTimeService routeTimeService;

    @RequestMapping("viewRouteTime/{id}")
    public String getListTimetable(@PathVariable("id") String routeId, Model model) {
        model.addAttribute("route", routeService.getRouteById(Long.parseLong(routeId)));
        model.addAttribute("routeTimeTable", routeTimeService.getRoutetimetables());
        return "admin/viewRouteTime";
    }

    @RequestMapping("/addRouteTime/{id_route}")
    public String addRouteTime(Model model, @PathVariable("id_route") long id_route) {
        model.addAttribute("id_route", id_route);

        return "admin/addRouteTime";
    }

//    @PostMapping(path = "/saveRouteTime/{id_route}")
//    public String saveRouteTime(@RequestParam Map<String, String> allReqParams, @PathVariable("id_route") long id_route) {
//        String startTimeString = allReqParams.get("startTime");
//
//        // ตรวจสอบรูปแบบเวลา "HH:mm"
//        if (!isValidTimeFormat(startTimeString)) {
//            // จัดการกับข้อมูลที่ไม่ถูกต้อง (เช่น ส่งข้อความข้อผิดพลาด)
//            return "errorPage"; // หรือแสดงข้อความข้อผิดพลาดอื่น ๆ ตามความต้องการของคุณ
//        }
//
//        // แปลงเวลาจากข้อความ "HH:mm" เป็น java.sql.Time
//        Time startTime = Time.valueOf(startTimeString + ":00"); // เพิ่มวินาทีเป็น 00
//
//        String status = allReqParams.get("status");
//        Route route = routeService.getRouteById(id_route);
//
//        Routetimetable routetimetable = new Routetimetable(startTime, status, route);
//        routeTimeService.saveRoutetimetable(routetimetable);
//        return "redirect:/viewRouteTime/{id_route}";
//    }

    // เมธอดช่วยในการตรวจสอบรูปแบบเวลา "HH:mm"
    private boolean isValidTimeFormat(String timeString) {
        // นำเข้าตรรกะสำหรับตรวจสอบรูปแบบ "HH:mm"
        // คุณสามารถปรับแต่งตรรกะของคุณตามความต้องการ
        return timeString.matches("^\\d{2}:\\d{2}$");
    }

    @PostMapping(path = "/saveRouteTime/{id_route}")
    public String saveRouteTimeTable(@RequestParam Map<String, String> allReqParams, @PathVariable("id_route") long id_route) {
        String startTimeString = allReqParams.get("startTime");

        // ตรวจสอบรูปแบบเวลา "HH:mm"
        if (!isValidTimeFormat(startTimeString)) {
            // จัดการกับข้อมูลที่ไม่ถูกต้อง (แสดง popup)
            return "redirect:/viewRouteTime/{id_route}?error=invalidTime"; // เพิ่มพารามิเตอร์ข้อผิดพลาดใน URL
        }

        // แปลงเวลาจากข้อความ "HH:mm" เป็น java.sql.Time
        Time startTime = Time.valueOf(startTimeString + ":00"); // เพิ่มวินาทีเป็น 00

        String status = allReqParams.get("status");
        Route route = routeService.getRouteById(id_route);

        Routetimetable routetimetable = new Routetimetable(startTime, status, route);
        routeTimeService.saveRoutetimetable(routetimetable);
        return "redirect:/viewRouteTime/{id_route}";
    }

//    @PostMapping(path = "/saveRouteTime/{id_route}")
//    public String saveRouteTime(@RequestParam Map<String, String> allReqParams, @PathVariable("id_route") long id_route) {
//        Time startTime = Time.valueOf(allReqParams.get("startTime"));
//        String status = allReqParams.get("status");
//        Route route = routeService.getRouteById(id_route);
//
//        Routetimetable routetimetable = new Routetimetable(startTime, status, route);
//        routeTimeService.saveRoutetimetable(routetimetable);
//        return "redirect:/viewRouteTime/{id_route}";
//    }

//    @PostMapping(path = "/saveRouteTime/{id_route}")
//    public String saveRouteTime(@RequestParam Map<String, String> allReqParams, @PathVariable("id_route") long id_route) {
//        String startTimeStr = allReqParams.get("startTime");
//        String status = allReqParams.get("status");
//        Route route = routeService.getRouteById(id_route);
//
//        try {
//            Time startTime = Time.valueOf(startTimeStr);
//            Routetimetable routetimetable = new Routetimetable(startTime, status, route);
//            routeTimeService.saveRoutetimetable(routetimetable);
//        } catch (IllegalArgumentException e) {
//            // ถ้ามีข้อผิดพลาดในการแปลงเวลา
//            // คุณสามารถจัดการกับข้อผิดพลาดได้ที่นี่
//            // อย่างเช่น แสดงข้อความแจ้งเตือนหรือทำอย่างอื่น
//            e.printStackTrace(); // หรือใช้เพื่อล็อกข้อผิดพลาด
//
//            // คุณสามารถกำหนดการไปยังหน้าแสดงผลที่เหมาะสมในกรณีของข้อผิดพลาด
//            return "errorPage"; // เช่น "errorPage" เป็น URI ของหน้าผิดพลาด
//        }
//        return "redirect:/viewRouteTime/{id_route}";
//    }

    @GetMapping("/eDitRouteTime/{round_no}")
    public String getRouteTimeDetail(Model model, @PathVariable long round_no) {
        Routetimetable routetimetable = routeTimeService.getRoutetimetableById(round_no);
        model.addAttribute("routeTime", routetimetable);
        return "admin/editRouteTime";
    }

//    @PostMapping("/{round_no}/updateRouteTime")
//    public  String doUpdateRouteTime(@RequestParam Map<String, String> allReqParams, @PathVariable long round_no) {
//        Routetimetable routetimetable = routeTimeService.getRoutetimetableById(round_no);
//        System.out.println("PASS");
//        if (routetimetable != null){
//            routetimetable.setStart_time(Time.valueOf(allReqParams.get("startTime")));
//            routetimetable.setStatus(allReqParams.get("status"));
//            routeTimeService.updateRoutetimetable(routetimetable);
//        }
//        return "redirect:/viewRouteTime/" +routetimetable.getRoute().getId_route();
//    }
@PostMapping("/{round_no}/updateRouteTime")
public String updateTimeTable(@RequestParam Map<String, String> allReqParams, @PathVariable long round_no) {
    String startTimeString = allReqParams.get("startTime");

    // ตรวจสอบรูปแบบเวลา "HH:mm"
    if (!isValidTimeFormat(startTimeString)) {
        // จัดการกับข้อมูลที่ไม่ถูกต้อง (แสดง popup)
        return "redirect:/viewRouteTime/{round_no}?error=invalidTime"; // เพิ่มพารามิเตอร์ข้อผิดพลาดใน URL
    }

    Routetimetable routetimetable = routeTimeService.getRoutetimetableById(round_no);

    if (routetimetable != null) {
        // แปลงเวลาจากข้อความ "HH:mm" เป็น java.sql.Time
        Time startTime = Time.valueOf(startTimeString + ":00"); // เพิ่มวินาทีเป็น 00

        routetimetable.setStart_time(startTime);
        routetimetable.setStatus(allReqParams.get("status"));
        routeTimeService.updateRoutetimetable(routetimetable);
    }

    return "redirect:/viewRouteTime/" + routetimetable.getRoute().getId_route();
}


    @GetMapping("/{round_no}/deleteRouteTime")
    public String deleteTimetable(@PathVariable long round_no) {
        Routetimetable routetimetable = routeTimeService.getRoutetimetableById(round_no);
        routeTimeService.deleteRoutetimetable(routetimetable);

        return "redirect:/viewRouteTime/"+routetimetable.getRoute().getId_route();
    }

}
