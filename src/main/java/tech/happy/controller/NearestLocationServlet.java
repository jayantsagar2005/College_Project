package tech.happy.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tech.happy.dao.ConnectionFactory;
import tech.happy.model.Location;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/NearestLocationServlet")
public class NearestLocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		double userLat = Double.parseDouble(request.getParameter("lat"));
        double userLng = Double.parseDouble(request.getParameter("lng"));
        
                
        double nearestDistance = Double.MAX_VALUE;
        int nearestLocationId = -1;
        String nearestLocationName = "";
        Connection connection = null;
                 
        try {
        	
        	List<Location> list = new ArrayList<>();
        	connection = ConnectionFactory.getConnection();
        	String query = "select* from location"; 
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			
			while (resultSet.next()) {
                int locationId = resultSet.getInt("SNo");
                String locationName = resultSet.getString("City");              	
                double dbLat = resultSet.getDouble("Latitude");
                double dbLng = resultSet.getDouble("Longitude");
                
                Location location = new Location(dbLat, dbLng, locationName);
                list.add(location);               
			}
			
			Location nearLocation = findNearestLocation(userLat, userLng, list);
			
			HttpSession session = request.getSession();
			session.setAttribute("location", nearLocation.getName());
			String userLatString = ""+userLat;
			String userLngString = ""+userLng;
			session.setAttribute("latitude", userLatString);
	        session.setAttribute("longitude", userLngString);
			
			response.setContentType("text/plain");
			response.getWriter().write(nearLocation.getName());			
			response.sendRedirect("index.jsp");
			
        }catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(connection != null) connection.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public static Location findNearestLocation(double userLat, double userLon, List<Location> locations) {
	    Location nearestLocation = null;
	    double shortestDistance = Double.MAX_VALUE;

	    for (Location location : locations) {
	        double distance = getDistance(userLat, userLon, location.getLatitude(), location.getLongitude());
//	        System.out.println(location.getName()+", "+distance);
	        if (distance < shortestDistance) {
	            shortestDistance = distance;
	            nearestLocation = location;
	        }
	    }
	    

	    return nearestLocation;
	}
	
	private static double getDistance(double lat1, double lon1, double lat2, double lon2) {
		final int R = 6371; // Radius of Earth in KM
		double latDistance = Math.toRadians(lat2 - lat1); // convert degree to radians
		double lonDistance = Math.toRadians(lon2 - lon1);
		
		double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
		         + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
		         * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
		
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		
		return R * c;
	}

}
