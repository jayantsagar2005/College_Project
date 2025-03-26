package tech.happy.fileio;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendOTP {
	
	public boolean sendEmail(String username, String content, String subject, int otp) {
		boolean test = false;
		
		String fromEmail = "happymail18062022@gmail.com"; 
		String password = "sueb pwbi ljzh spxh"; 
		String toEmail = "jayantsagar2005@gmail.com"; 
		 
		try{
			Properties properties = new Properties();

	        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
	        properties.setProperty("mail.smtp.port", "587");
	        properties.setProperty("mail.smtp.auth", "true");
	        properties.setProperty("mail.smtp.starttls.enable", "true");
	        properties.put("mail.smtp.socketFactory.port", "587");
	        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	        Session session = Session.getInstance(properties, new Authenticator() {
	        @Override
	        	protected PasswordAuthentication getPasswordAuthentication() {
	            	return new PasswordAuthentication(fromEmail, password);
	            }
	        });

	        Message message = new MimeMessage(session);

	        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
	        message.setFrom(new InternetAddress(fromEmail));
	        message.setSubject(subject);
	        message.setText(content);
	        
	        Transport.send(message);
	        test = true;

		}catch (Exception e){
	        e.printStackTrace();
	    }

	    return test;
	}
}
