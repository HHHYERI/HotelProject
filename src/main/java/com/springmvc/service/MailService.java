package com.springmvc.service;

import java.util.List;
import java.util.Map;

public interface MailService {

	void sendMail(String recipientEmail, String subject, String content);
	void sendReservationEmail(String recipientEmail, String resvNum, List<Map<String, Object>> formList);

}
