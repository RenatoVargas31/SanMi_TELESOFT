package com.example.sanmi_telesoft.daos;


import java.io.File;
import java.io.IOException;
import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;

public class EmailService {
    public boolean asd(String to, String subject, String body)  {
        Properties properties = new Properties();
        String user = "loliperales17@gmail.com";
        String password = "xpkwbfgqhgjovpex";

        //ssl
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new jakarta.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user, password);
                    }
                });


        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);

            MimeBodyPart part1 = new MimeBodyPart();
            part1.setText(body);

            //Esto usaras cuando quieras subir imagenes u otros archivos
            /*MimeBodyPart part2 = new MimeBodyPart();
            File file = new File("C:\\Users\\CARLOS\\Pictures\\Screenshots\\nepe.png");
            part2.attachFile(file);
            part2.setContent("This is my content","text/html; charset=utf-8");*/

            MimeMultipart multipart = new MimeMultipart();
            //multipart.addBodyPart(part2);
            multipart.addBodyPart(part1);

            message.setContent(multipart);
            Transport.send(message);
            System.out.println("sent");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        } /*catch (IOException e) {
            e.printStackTrace();
            return false;
        }*/
    }
}