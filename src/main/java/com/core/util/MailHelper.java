package com.core.util;

import java.net.InetAddress;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailHelper {
	
	private static String host = "smtp.163.com";
	private static String email = "18373362592@163.com";
	private static String username = "18373362592";
	private static String password = "limin123";
	
	public static void send(String email, String code) {
		new Thread() {
			@Override
			public void run() {
				sendMail(email, code);
			}
		}.start();
	}
	
	private static void sendMail(String email, String code) {
		try {
			Properties prop = new Properties();
			prop.setProperty("mail.transport.protocol", "smtp");
			prop.setProperty("mail.smtp.auth", "true");
			Session session = Session.getInstance(prop);
			session.setDebug(true);

			Message message = createMessage(session, email, code);

			Transport ts = session.getTransport();
			ts.connect(host, username, password);
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	private static Message createMessage(Session session, String mail, String code) {
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(mail));
			message.setSubject("镜子博客用户注册邮件");
			String content = "恭喜您注册成功，请点击下面的超链接激活账号<br />";
			content += "<a href='http://" + InetAddress.getLocalHost().getHostAddress()
					+ ":8080/shop-ssh/user_auth?code=" + code + "'>"
					+ "http://" + InetAddress.getLocalHost().getHostAddress()
					+ ":8080/shop-ssh/user_auth?code=" + code
					+ "</a>";
			message.setContent(content, "text/html;charset=UTF-8");
			message.saveChanges();

			return message;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}