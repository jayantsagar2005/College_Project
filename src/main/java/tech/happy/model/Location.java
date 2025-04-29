package tech.happy.model;

public class Location {
	private double latitude;
    private double longitude;
    private String name; // Optional: to store the name of the location

    public Location(double latitude, double longitude, String name) {
        this.latitude = latitude;
        this.longitude = longitude;
        this.name = name;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public String getName() {
        return name;
    }
}
