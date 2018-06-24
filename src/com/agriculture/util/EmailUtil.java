package com.agriculture.util;

import com.sun.mail.util.MailSSLSocketFactory;

import java.security.GeneralSecurityException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil
{
    public static boolean sendMail(String[] strAddresses, String subject, String msg) {
        Properties props = new Properties();

        // 开启debug调试
        props.setProperty("mail.debug", "true");
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.qq.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");

        try {
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            props.put("mail.smtp.ssl.enable", "true");
            props.put("mail.smtp.ssl.socketFactory", sf);

            Session session = Session.getInstance(props);

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("xiong-yang@qq.com"));
            message.setSubject(subject);
            message.setContent(msg, "text/html;charset=UTF-8");
            message.setSentDate(new Date());
            message.saveChanges();

            Transport transport = session.getTransport();
            transport.connect("smtp.qq.com", "xiong-yang@qq.com", "aijjesawyrkijaia");

            Address[] addresses = new Address[strAddresses.length];
            for (int i = 0; i < strAddresses.length; i++) {
                System.out.println("==>" + strAddresses[i].trim());
                addresses[i] = new InternetAddress(strAddresses[i].trim());
            }

            transport.sendMessage(message, addresses);
            transport.close();
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
            return false;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}