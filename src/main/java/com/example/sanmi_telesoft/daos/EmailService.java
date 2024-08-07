package com.example.sanmi_telesoft.daos;


import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import com.example.sanmi_telesoft.beans.Evento;
import com.example.sanmi_telesoft.dto.DiaconHoras;
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

import javax.security.auth.Subject;

public class EmailService {

    public boolean asd(String to, String subject, String body)  {
        Properties properties = new Properties();
        String user = "telesoft.iweb@gmail.com";
        String password = "bxbhficpibnizans";

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

    public void enviarLink(String to, String subject, String link)  {
        Properties properties = new Properties();
        String user = "telesoft.iweb@gmail.com";
        String password = "bxbhficpibnizans";

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

            MimeBodyPart bodyPart = new MimeBodyPart();
            String htmlContent = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + "<style>"
                    + "body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }"
                    + "h1 { color: #004080; }"
                    + "p { font-size: 14px; color: #333333; }"
                    + ".container { background-color: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }"
                    + ".header { text-align: center; }"
                    + ".logo { width: 150px; }"
                    + "a { color: #004080; text-decoration: none; font-weight: bold; }"
                    + "a:hover { text-decoration: underline; }"
                    + ".footer { text-align: center; margin-top: 20px; font-size: 12px; color: #777777; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>"
                    + "<img src='https://empleabilidad.iesrp.edu.pe/wp-content/uploads/2023/07/San-Miguel.jpg' alt='Municipalidad de San Miguel' class='logo' />"
                    + "</div>"
                    + "<h1>Hola,</h1>"
                    + "<p>Haz clic en el siguiente enlace para más información:</p>"
                    + "<a href='" + link + "'>Enlace</a>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "<p>Municipalidad de San Miguel - Lima, Perú</p>"
                    + "<p><a href='https://www.sanmiguel.gob.pe'>www.sanmiguel.gob.pe</a></p>"
                    + "</div>"
                    + "</body>"
                    + "</html>";
            bodyPart.setContent(htmlContent, "text/html");



            MimeMultipart multipart = new MimeMultipart();
            multipart.addBodyPart(bodyPart);

            message.setContent(multipart);
            Transport.send(message);
            System.out.println("sent");
        } catch (MessagingException e) {
            e.printStackTrace();
        } /*catch (IOException e) {
            e.printStackTrace();
            return false;
        }*/
    }

    public void recordatorioEvento(String to, String subject, Evento evento, ArrayList<DiaconHoras> fechasUtilizadas) {
        Properties properties = new Properties();
        String user = "telesoft.iweb@gmail.com";
        String password = "bxbhficpibnizans";

        // SSL
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

        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        for (DiaconHoras fechaHora : fechasUtilizadas) {
            LocalDateTime eventDateTime = LocalDateTime.of(fechaHora.getFecha(), fechaHora.getHoraInicio());
            LocalDateTime reminderTime = eventDateTime.minusMinutes(15);

            long delay = java.time.Duration.between(LocalDateTime.now(), reminderTime).toMillis();

            scheduler.schedule(() -> {
                try {
                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(user));
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                    message.setSubject(subject);

                    MimeBodyPart bodyPart = new MimeBodyPart();
                    String htmlContent = "<h1>Hola,</h1>"
                            + "<p>El evento " + evento.getNombreEvento() + " comenzará en 15 minutos, date prisa.</p>"
                            + "<a href=\"" + "\">Enlace</a>";
                    bodyPart.setContent(htmlContent, "text/html");

                    MimeMultipart multipart = new MimeMultipart();
                    multipart.addBodyPart(bodyPart);

                    message.setContent(multipart);
                    Transport.send(message);
                    System.out.println("sent");
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }, delay, TimeUnit.MILLISECONDS);
        }
    }

    public void aceptarVecino(String correo, String name)  {
        Properties properties = new Properties();
        String user = "telesoft.iweb@gmail.com";
        String password = "bxbhficpibnizans";
        String subject = "Solicitud de registro a SanMi";

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
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
            message.setSubject(subject);

            MimeBodyPart bodyPart = new MimeBodyPart();
            String htmlContent = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + "<style>"
                    + "body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }"
                    + "h1 { color: #004080; }"
                    + "p { font-size: 14px; color: #333333; }"
                    + ".container { background-color: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }"
                    + ".header { text-align: center; }"
                    + ".logo { width: 150px; }"
                    + ".footer { text-align: center; margin-top: 20px; font-size: 12px; color: #777777; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>"
                    + "<img src='https://empleabilidad.iesrp.edu.pe/wp-content/uploads/2023/07/San-Miguel.jpg' alt='Municipalidad de San Miguel' class='logo' />"
                    + "</div>"
                    + "<h1>Hola, " + name + "</h1>"
                    + "<p>Bienvenido a SanMi:</p>"
                    + "<p>Para poder ingresar a la página, debes restablecer tu contraseña y adquirir una nueva.</p>"
                    + "<p>Si necesitas ayuda, no dudes en contactarnos.</p>"
                    + "<p class='signature'>Atentamente,<br>El equipo de SanMi</p>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "<p>Municipalidad de San Miguel - Lima, Perú</p>"
                    + "<p><a href='https://www.sanmiguel.gob.pe'>www.sanmiguel.gob.pe</a></p>"
                    + "</div>"
                    + "</body>"
                    + "</html>";
            bodyPart.setContent(htmlContent, "text/html");




            MimeMultipart multipart = new MimeMultipart();
            multipart.addBodyPart(bodyPart);

            message.setContent(multipart);
            Transport.send(message);
            System.out.println("sent");
        } catch (MessagingException e) {
            e.printStackTrace();
        } /*catch (IOException e) {
            e.printStackTrace();
            return false;
        }*/
    }

    public void rechazarVecino(String correo, String name)  {
        Properties properties = new Properties();
        String user = "telesoft.iweb@gmail.com";
        String password = "bxbhficpibnizans";
        String subject = "Solicitud de registro a SanMi";

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
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(correo));
            message.setSubject(subject);

            MimeBodyPart bodyPart = new MimeBodyPart();
            String htmlContent = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + "<style>"
                    + "body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f4; }"
                    + "h1 { color: #004080; }"
                    + "p { font-size: 14px; color: #333333; }"
                    + ".container { background-color: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }"
                    + ".header { text-align: center; }"
                    + ".logo { width: 150px; }"
                    + ".signature { margin-top: 20px; }"
                    + ".footer { text-align: center; margin-top: 20px; font-size: 12px; color: #777777; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>"
                    + "<img src='https://empleabilidad.iesrp.edu.pe/wp-content/uploads/2023/07/San-Miguel.jpg' alt='Municipalidad de San Miguel' class='logo' />"
                    + "</div>"
                    + "<h1>Estimado/a " + name + ",</h1>"
                    + "<p>Lamentamos informarle que su solicitud de registro no ha sido aprobada debido a que los datos proporcionados no son correctos.</p>"
                    + "<p>Por favor, revise y actualice la información para poder continuar con el proceso.</p>"
                    + "<p>Gracias por su comprensión.</p>"
                    + "<p class='signature'>Atentamente,<br>El equipo de soporte</p>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "<p>Municipalidad de San Miguel - Lima, Perú</p>"
                    + "<p><a href='https://www.sanmiguel.gob.pe'>www.sanmiguel.gob.pe</a></p>"
                    + "</div>"
                    + "</body>"
                    + "</html>";
            bodyPart.setContent(htmlContent, "text/html");



            MimeMultipart multipart = new MimeMultipart();
            multipart.addBodyPart(bodyPart);

            message.setContent(multipart);
            Transport.send(message);
            System.out.println("sent");
        } catch (MessagingException e) {
            e.printStackTrace();
        } /*catch (IOException e) {
            e.printStackTrace();
            return false;
        }*/
    }

}