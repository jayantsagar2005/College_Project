package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.happy.model.OrderDeatils;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/StoreOrderServlet")
public class StoreOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        
        JSONArray jsonArray = new JSONArray(sb.toString());
        ArrayList<OrderDeatils> list = new ArrayList<>();
        
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject obj = jsonArray.getJSONObject(i);
            
            String name = obj.getString("name");
            int price = obj.getInt("price");
            String meal = obj.getString("meal");
            int quantity = obj.getInt("quantity"); 
            
            OrderDeatils item = new OrderDeatils(name, price, meal, quantity);
            list.add(item);
        }
        
        request.getSession().setAttribute("orderList", list);
        response.setStatus(200);
	}

}
