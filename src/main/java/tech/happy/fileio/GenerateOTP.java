package tech.happy.fileio;

import java.util.Random;

public class GenerateOTP {
	public static int generateRandomOTP(){
        Random random = new Random();
        return 100000 + random.nextInt(900000);
    }
}
