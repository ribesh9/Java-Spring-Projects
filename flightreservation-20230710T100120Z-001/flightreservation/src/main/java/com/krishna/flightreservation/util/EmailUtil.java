package com.krishna.flightreservation.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;

@Component
public class EmailUtil {

    @Autowired
    private JavaMailSender mailSender;

    public void sendItinerary(String toAddress, String filePath)
    {
        MimeMessage message=mailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper=new MimeMessageHelper(message,true);
            messageHelper.setTo(toAddress);
            messageHelper.setSubject("Itinerary for your flight");
            messageHelper.setText("Please find your Itinerary Attached");
            messageHelper.addAttachment("Itinerary", new File(filePath));
            mailSender.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}
