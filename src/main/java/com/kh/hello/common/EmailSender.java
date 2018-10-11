package com.kh.hello.common;

import javax.annotation.Resource;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.util.StringUtils;

@Component
public class EmailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name="velocityEngine")
    VelocityEngine velocityEngine;
     
    Logger log = LoggerFactory.getLogger(this.getClass());
    
    private static String path="D:/git/HelloKorea/src/main/webapp/resources/templates/emailtemplate.vm";
     
    // 템플릿 사용한 이메일(Velocity 사용)
    public void sendVelocityEmail(Email email) {
         
        MimeMessage msg = mailSender.createMimeMessage();
         
        try {
             
            MimeMessageHelper helper = new MimeMessageHelper(msg, false);
            
            String veloTemplate = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, path, "UTF-8", email.getEmailMap());
            helper.setSubject(email.getSubject());
            helper.setFrom(email.getFrom());
            helper.setTo(email.getReceiver());
            if ( StringUtils.isEmpty(email.getHtmlYn()) == false && email.getHtmlYn().equals("Y") ) {
                helper.setText(veloTemplate, true);
            } else {
                helper.setText(veloTemplate);
            }
             
        } catch(MessagingException e) {
            log.error("이메일 전송 에러");
            log.debug(e.getMessage());
        }
         
        try {
            mailSender.send(msg);
        } catch(MailException e) {
            log.error("Email MailException...");
            log.debug(e.getMessage());
        }
    }


	/*public void sendEmail(Email email) throws Exception{
		MimeMessage msg=mailSender.createMimeMessage();
		msg.setSubject(email.getSubject());
		msg.setText(email.getContent());
		msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
		mailSender.send(msg);
	}*/

}
