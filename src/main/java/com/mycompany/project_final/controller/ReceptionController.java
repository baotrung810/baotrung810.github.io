/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.project_final.controller;

import com.mycompany.project_final.entities.AccountEntity;
import com.mycompany.project_final.entities.BookingDetailEntity;
import com.mycompany.project_final.entities.BookingEntity;
import com.mycompany.project_final.entities.CustomerInformationEntity;
import com.mycompany.project_final.entities.ImageEntity;
import com.mycompany.project_final.entities.RoomCategoryEntity;
import com.mycompany.project_final.entities.RoomEntity;
import com.mycompany.project_final.entities.ServiceEntity;
import com.mycompany.project_final.enums.Gender;
import com.mycompany.project_final.service.BookingDetailService;
import com.mycompany.project_final.service.BookingService;
import com.mycompany.project_final.service.CategoryService;
import com.mycompany.project_final.service.CustomerService;
import com.mycompany.project_final.service.RoomService;
import com.mycompany.project_final.service.ServiceEntityService;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/reception")
public class ReceptionController {

    @Autowired
    CategoryService categoryService;
    @Autowired
    RoomService roomService;
    @Autowired
    ServiceEntityService services;
    @Autowired
    CustomerService customerService;
    @Autowired
    BookingService bookingService;
    @Autowired
    BookingDetailService bookingDetailService;

    @RequestMapping(value = {"/home"})
    public String home(Model model) {
        model.addAttribute("category", categoryService.viewCategory());
        return "/reception/booking";
    }

    @RequestMapping(value = {"/search"}, method = RequestMethod.POST) // lay thong tin tu form de search room va hien list room
    public String search(Model model,
            @ModelAttribute("checkIn") Date checkIn, @ModelAttribute("checkOut") Date checkOut, // lay value checkin, out, id tu form
            @ModelAttribute("category") int id, HttpServletRequest rq, HttpSession session) {
        // format date
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String checkin = formatter.format(checkIn);
        String checkout = formatter.format(checkOut);
        rq.setAttribute("checkin", checkin);
        rq.setAttribute("checkout", checkout);
        model.addAttribute("category", categoryService.viewCategory());
        List<RoomEntity> room = roomService.searchRoomByBooking(id, checkin, checkout);
        if (session.getAttribute("roomList") == null) {
            session.setAttribute("room", room);
        }
        if (session.getAttribute("checkin") == null) {
            session.setAttribute("checkin", checkin);
        }
        if (session.getAttribute("checkout") == null) {
            session.setAttribute("checkout", checkout);
        }
        model.addAttribute("roomList", room);
        return "redirect:/reception/search-room";
    }

    @RequestMapping(value = "/search-room") // view page search room
    public String dislaySearch(Model model, HttpSession session, HttpServletRequest rq) {
        List<RoomEntity> roomList = (List<RoomEntity>) session.getAttribute("roomList");
        model.addAttribute("room", roomList);
        return "/reception/search-room";
    }

    @RequestMapping("/return") // return page view list room
    public String returnRoom(Model model) {
        return "redirect:/reception/search-room";
    }
// search theo category da co ngay check-in-out ( dang test)

    @RequestMapping(value = {"/find"}, method = RequestMethod.POST)
    public String find(Model model, HttpServletRequest rq, @ModelAttribute("category") int id) {
        String checkOut = (String) rq.getAttribute("checkout");
        String checkIn = (String) rq.getAttribute("checkin");
        model.addAttribute("category", categoryService.viewCategory());
        List<RoomEntity> room = roomService.searchRoomByBooking(id, checkIn, checkOut);
        model.addAttribute("room", room);
        return "/reception/search-room";
    }

    @RequestMapping(value = "/booking")
    public String bookingRoom(Model model, HttpSession session, HttpServletRequest rq
    ) {
        DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String inDate = (String) session.getAttribute("checkin");
        String outDate = (String) session.getAttribute("checkout");
        try {
            Date dateIn = formatter.parse(inDate);
            Date dateOut = formatter.parse(outDate);
            int id = Integer.parseInt(rq.getParameter("id"));
            RoomEntity room = roomService.findRoom(id);
            double totalPrice = 0;
            if (session.getAttribute("booking") == null) { // check session?
                BookingDetailEntity bookingDetail = new BookingDetailEntity();
                BookingEntity booking = new BookingEntity();
                bookingDetail.setRoom(room);
                bookingDetail.setPrice(room.getRoomCategory().getPrice());
                List<BookingDetailEntity> listBookDetail = new ArrayList<>();
                listBookDetail.add(bookingDetail);
                booking.setBookingDetail(listBookDetail);
                booking.setCheckIn(dateIn);
                booking.setCheckOut(dateOut);
                session.setAttribute("booking", booking);

            } else {
                BookingEntity booking = (BookingEntity) session.getAttribute("booking");
                List<BookingDetailEntity> listBookDetail = booking.getBookingDetail();
                boolean check = false;
                for (BookingDetailEntity bookingDetail : listBookDetail) {
                    if (bookingDetail.getRoom().getId() == id) { // kiem tra xem phong  do da dc booking chua
//                    model.addAttribute("massage", "You have already booked room" + bookingDetail.getRoom().getRoomNumber());
                        check = true;
                    }
                }
                if (check == false) {
                    BookingDetailEntity bookingDetailEntity = new BookingDetailEntity();
                    bookingDetailEntity.setRoom(room);
                    bookingDetailEntity.setPrice(room.getRoomCategory().getPrice());
                    listBookDetail.add(bookingDetailEntity);
                }

                session.setAttribute("booking", booking);

            }

        } catch (ParseException e) {
            e.printStackTrace();
        }

        return "redirect:/reception/view-booking";
    }

    @RequestMapping("/remove/{id}")  /// xoa room trong booking
    public String removeString(@PathVariable("id") int id, HttpSession session) {
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");  // lay booking tu session
        List<BookingDetailEntity> listBookDetail = booking.getBookingDetail();
        for (int i = 0; i < listBookDetail.size(); i++) { //  delete position i in listBookDetail
            if (listBookDetail.get(i).getRoom().getId() == id) {
                listBookDetail.remove(i);
                session.setAttribute("booking", booking);
            }
        }
        return "redirect:/reception/view-booking";
    }

    @RequestMapping(value = "/service-book/{id_room}")  // book service in page view-bookingRoom
    public String addQuantity(Model model,
            @ModelAttribute("serviceId") int serviceId, @PathVariable("id_room") int id_room,
            HttpSession session) {
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");// get booking from session
        List<BookingDetailEntity> book_list = booking.getBookingDetail(); // get book_list from booking
        ServiceEntity service = services.findServiceById(serviceId);  // get service
        for (BookingDetailEntity bd : book_list) {
            if (bd.getRoom().getId() == id_room) {
                List<ServiceEntity> serviceList = bd.getServices();
                if (serviceList == null) {
                    serviceList = new ArrayList<>();
                    serviceList.add(service);
                } else {
                    boolean isExist = false;
                    for (ServiceEntity serviceEntity : serviceList) {  // check service
                        if (serviceEntity.getId() == serviceId) {
                            isExist = true;
                            break;
                        }
                    }
                    if (!isExist) {
                        serviceList.add(service);
                    }
                }
                bd.setServices(serviceList);
            }
        }
        booking.setBookingDetail(book_list);
        session.setAttribute("booking", booking);
        return "redirect:/reception/view-booking";
    }

    @RequestMapping("/view-booking")  // view page booking
    public String viewBooking(Model model, HttpSession session, HttpServletRequest rq) {
        Date currentDate = new Date(); // format date
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String dateFormat = formatter.format(currentDate);
        rq.setAttribute("currentDate", dateFormat);
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");
        List<BookingDetailEntity> bookingList = booking.getBookingDetail();
        // calculate the total amount
        double total, totalRoom = 0, totalService = 0;
        for (BookingDetailEntity b : bookingList) {
            totalRoom += b.getRoom().getRoomCategory().getPrice();
        }
        for (BookingDetailEntity b : bookingList) {
            List<ServiceEntity> sv = b.getServices();
            if (sv == null) {
                break;
            } else {
                for (ServiceEntity serviceEntity : sv) {
                    totalService += serviceEntity.getPrice();
                }
            }

        }
        total = totalRoom + totalService;
        booking.setTotalPrice(total);
        booking.setCreatedDate(currentDate);
        String inDate = formatter.format(booking.getCheckIn());
        rq.setAttribute("inDate", inDate);
        String outDate = formatter.format(booking.getCheckOut());
        rq.setAttribute("outDate", outDate);
        model.addAttribute("booking", booking);
        model.addAttribute("service", services.viewService());
        return "/reception/view-bookingRoom";
    }

    @RequestMapping("/service")  /// display service page sercvice
    public String viewService(Model model) {
        model.addAttribute("service", services.viewService());
        return "/reception/service";
    }

    //view form customer information
    @RequestMapping("/customer")   // view form enter infromation customer
    public String viewFormCustomer(Model model) {
        model.addAttribute("customer", new CustomerInformationEntity());
        model.addAttribute("gender", Gender.values());
        return "/reception/information-form";
    }

    @RequestMapping(value = {"/confirm"}, method = RequestMethod.POST) // confirm information and save in data
    public String confirmBooking(Model model, @ModelAttribute("customer") CustomerInformationEntity c,
            HttpSession session) {

        BookingEntity booking = (BookingEntity) session.getAttribute("booking"); // lay booking in session
        c = customerService.addCustomer(c);
        if (c.getId() > 0 && booking != null) {
            booking.setCustomerInformation(c);
            booking = bookingService.addBooking(booking);
            if (booking.getId() > 0) {
                List<BookingDetailEntity> bookDetails = booking.getBookingDetail();
                if (bookDetails != null && bookDetails.size() > 0) {
                    for (BookingDetailEntity bookDetail : bookDetails) {
                        bookDetail.setBooking(booking);
                        bookingDetailService.addBookingDetail(bookDetail);
                    }
                }
            }
        }
        session.removeAttribute("booking"); // delete session booking
        session.removeAttribute("checkin");
        session.removeAttribute("checkout");
        return "redirect:/reception/home";
    }
    //check in

    @RequestMapping("/checkin") // view page check in
    public String viewCheckIn(Model model) {
        model.addAttribute("bookingDetail", bookingDetailService.viewBookingDetail());
        return "reception/check-in";
    }

    @RequestMapping("/check-in/{id}")
    public String checkIn(Model model, @PathVariable("id") int id) {
        BookingDetailEntity bookingDetail = bookingDetailService.findBookingDetail(id);
        bookingDetail.setStatus("check in");
        bookingDetailService.addBookingDetail(bookingDetail);
        return "redirect:/reception/checkin";
    }

    // check-out
    @RequestMapping("/checkout") // view page check out
    public String viewCheckout(Model model) {
        model.addAttribute("bookingDetail", bookingDetailService.viewBookingDetail());
        return "reception/check-out";
    }

    @RequestMapping("/check-out/{id}") //set status
    public String checkOut(Model model, @PathVariable("id") int id, HttpServletResponse response) {
        BookingDetailEntity bookingDetail = bookingDetailService.findBookingDetail(id);
        bookingDetail.setStatus("check out");
        bookingDetailService.addBookingDetail(bookingDetail);
        ///// print file
        Workbook workbook = new HSSFWorkbook(); // create file in Microsoft Excel format
        Sheet sheet = workbook.createSheet("Bill"); // create sheet in excel with name Bill;
        Row row = sheet.createRow(0);  // create row 
        row.createCell(0).setCellValue("Ticket Bill");

        Row row1 = sheet.createRow(1);

        Row row2 = sheet.createRow(2); // create row 2 and set value

        row2.createCell(0).setCellValue("FullName"); // assign values to the 0 cell

        row2.createCell(1).setCellValue("Phone");

        row2.createCell(2).setCellValue("RoomNumber");

        row2.createCell(3).setCellValue("Check In");

        row2.createCell(4).setCellValue("Check Out");

        row2.createCell(5).setCellValue("Price");

        // format date
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//        Date date = new Date();
        String checkin = formatter.format(bookingDetail.getBooking().getCheckIn());
        String checkout = formatter.format(bookingDetail.getBooking().getCheckOut());
        Row row3 = sheet.createRow(3);
        row3.createCell(0).setCellValue(bookingDetail.getBooking().getCustomerInformation().getName());
        row3.createCell(1).setCellValue(bookingDetail.getBooking().getCustomerInformation().getPhoneNumber());
        row3.createCell(2).setCellValue(bookingDetail.getRoom().getRoomNumber());
        row3.createCell(3).setCellValue(checkin);
        row3.createCell(4).setCellValue(checkout);
        row3.createCell(5).setCellValue(bookingDetail.getPrice());

        response.setHeader("content-disposition", "attachment;filename=bill.xls");/// ten file la bill
        response.setHeader("cache-control", "no-cache");

        try {
            OutputStream out = response.getOutputStream();
            workbook.write(out);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/reception/checkout";
    }

}
