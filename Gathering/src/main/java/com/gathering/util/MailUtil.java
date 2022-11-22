package com.gathering.util;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MailUtil {
	public static final Logger logger= LoggerFactory.getLogger(MailUtil.class);
	
	public static void sendMail(String email, String subject, String msg) throws Exception{
		
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "ohoh2022";
		String hostSMTPpwd = "oh2022A@@";
		
		// 보내는 사람
		String fromEmail = "ohoh2022@naver.com";
		String fromName = "Gathering 서비스";
		
		// email 전송
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
			
		} catch(Exception e) {
			
			logger.error("이메일 전송에 실패했습니다",e);
		}
		
	}
}
