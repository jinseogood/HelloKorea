package com.kh.hello.common;

import java.io.StringWriter;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class EmailSender {
	
	@Autowired
	private JavaMailSender nMailSender;
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired
	private VelocityEngine velocityEngine;
	
	public static final String mailPath="/resources/templates/";
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender; 
	}
	
	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine; 
	}
	
	//일반 메일 전송
	public void sendMailNormal(Email mail) throws Exception{
		MimeMessage msg=nMailSender.createMimeMessage();
		
		try{
			msg.setSubject(mail.getMailSubject());
			
			msg.setText(mail.getMailContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(mail.getMailTo()));
		}
		catch(MessagingException e){
			System.out.println(e.getMessage());
		}
		catch(MailException e2){
			System.out.println(e2.getMessage());
		}
		
	}
	
	//템블릿 메일 전송
	public void sendMail(Email mail, int orderNum, String orderDate, String orderName, String orderPhone, String proCName, String proRName, double proPrice, HttpServletRequest request) {
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(mail.getMailFrom());
		message.setTo(mail.getMailTo());
		message.setSubject(mail.getMailSubject());
		
		String filePath=mailPath + mail.getTemplateName();
		
		System.out.println("filePath : " + filePath);
		
		Template template = velocityEngine.getTemplate(mail.getTemplateName());
		VelocityContext velocityContext = new VelocityContext();
		velocityContext.put("orderNum", orderNum);
		velocityContext.put("orderDate", orderDate);
		velocityContext.put("orderName", orderName);
		velocityContext.put("orderPhone", orderPhone);
		velocityContext.put("proCName", proCName);
		velocityContext.put("proRName", proRName);
		velocityContext.put("proPrice", proPrice);
		
		StringWriter stringWriter = new StringWriter();
		template.merge(velocityContext, stringWriter);
		message.setText(stringWriter.toString());
		mailSender.send(message);
	}

}
