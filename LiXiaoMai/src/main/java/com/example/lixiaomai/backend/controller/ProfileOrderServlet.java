package com.example.lixiaomai.backend.controller;

import com.example.lixiaomai.backend.entity.Order;
import com.example.lixiaomai.backend.entity.Product;
import com.example.lixiaomai.backend.service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/ProfileOrder")
public class ProfileOrderServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        String userType = (String) session.getAttribute("userType");
        String userName = (String) session.getAttribute("name");
        OrderService orderService = new OrderService();
        ProductService productService = new ProductService();


        List<Order> list = new ArrayList<>();


        int page = 1;
        int recordsPerPage = 2;
        String x = request.getParameter("page");

        if (x != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }


        if (userType.equals("customer")) {
            CustomerService customerService = new CustomerService();
            list = orderService.getAllOrderByCid(customerService.getUserByUsername(userName).getId());
        } else if (userType.equals("business")) {
            BusinessService businessService = new BusinessService();
            list = orderService.getAllOrderBySid(businessService.getBusinessByUsername(userName).getId());
        } else if (userType.equals("deliverman")) {
            DelivermanService delivermanService = new DelivermanService();
            list = orderService.getAllOrderByDId(delivermanService.getDelivermanByUsername(userName).getId());
        }

        int allRecords = list.size();
        int totalPages = (int) Math.ceil(allRecords * 1.0 / recordsPerPage);
        int start = (page - 1) * recordsPerPage;
        int end = Math.min(start + recordsPerPage, allRecords);
        List<Order> paginatedList = list.subList(start, end);
        Map<Integer, List<String>> ProductMap = new HashMap<>();
        for (Order order : paginatedList) {
            List<Integer> ProductIds = order.getGId();
            List<String> productNames = new ArrayList<>();
            for (int pId : ProductIds) {
                Product product = productService.getProductById(pId);
                productNames.add(product.getName());
            }
            int id = order.getId();
            ProductMap.put(id, productNames);
        }

        request.setAttribute("orderList", paginatedList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("productMap", ProductMap);
        request.setAttribute("currentPage", page);


        request.getRequestDispatcher("profileOrder.jsp").forward(request, response);
        //12346


    }
}
