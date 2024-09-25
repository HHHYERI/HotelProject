package com.springmvc.service;

import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	@Autowired
	private JavaMailSender mailSender;
	/*
	 * @Autowired private SimpleMailMessage preConfiguredMessage;
	 */
	
	@Async
	public void sendMail(String to , String subject, String body){
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8"); 
			messageHelper.setFrom("hyeri7773@gmail.com","hotel reservation");//메일 수신 시 표시될 이름 설정
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(body, true); // true: HTML로 설정
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
    public void sendReservationEmail(String recipientEmail, String resvNum, List<Map<String, Object>> formList) {
        StringBuilder emailContent = new StringBuilder();
        emailContent.append("<html><head><meta charset='UTF-8'></head><body>");
        emailContent.append("<h2>Reservation number: ").append(resvNum).append("</h2>");
        emailContent.append("<h3>Please use the site to check details, change, or cancel:<br>");
        emailContent.append("<a href='http://localhost:8080/Hotel/resv_cfm'>Hotel Site here</h3>");
        emailContent.append("</body></html>");

        // 메일 전송
        sendMail(recipientEmail, "Hotel: Thank you. Your reservation has been completed.", emailContent.toString());
    }
	
}
