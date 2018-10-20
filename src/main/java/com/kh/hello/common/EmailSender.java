package com.kh.hello.common;

import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
	
	
	@Autowired
	private MailSender mailSender;
	
	@Autowired
	private VelocityEngine velocityEngine;
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender; 
	}
	
	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine; 
	}
	
	public void sendMail(Email mail, int orderNum, String orderDate, String orderName, String orderPhone, String proCName, String proRName, double proPrice, HttpServletRequest request) {
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(mail.getMailFrom());
		message.setTo(mail.getMailTo());
		message.setSubject(mail.getMailSubject());
		
		String root=request.getSession().getServletContext().getRealPath("resources");
		
		String filePath=root + "\\templates\\";
		
		System.out.println("filePath : " + filePath);
		
		Template template = velocityEngine.getTemplate(filePath + mail.getTemplateName());
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
