package com.library.email.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.library.email.model.Addressee;
import com.library.email.model.ReservedMail;
import com.library.main.model.Book;

@Component
public class MailService {
	@Autowired
	private JavaMailSender mailSender;

	public void sendMail(Addressee mail) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("digitallibalert@gmail.com");
		message.setTo(mail.getAddress());

		String title1 = "", author1 = "", title2 = "", author2 = "", title3 = "", author3 = "", link2 = "", link3 = "";

		Book book1 = mail.getBook1();
		Book book2 = mail.getBook2();
		Book book3 = mail.getBook3();

		if (book1 != null) {
			title1 = book1.getTitle();
			author1 = book1.getAuthor();
		} else if (book2 != null) {
			title2 = book2.getTitle();
			author2 = book2.getAuthor();
			link2 = " - ";
		} else if (book3 != null) {
			title3 = book3.getTitle();
			author3 = book3.getAuthor();
			link3 = " - ";
		}

		message.setSubject(mail.getTitle()
				+ title1 + " " + title2 + " " + title3
				);
		message.setText(
				"You have books to return: \n"
				+ title1 + " - " + author1 + "\n"
				+ title2 + link2 + author2 + "\n"
				+ title3 + link3 + author3
				);

		mailSender.send(message);
	}

	public void sendMailToReserved(ReservedMail rm) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("digitallibalert@gmail.com");
		message.setTo(rm.getAddress());
		message.setSubject(rm.getTitle());
		message.setText(rm.getContent());

		mailSender.send(message);
	}

	public void sendAlertMail1Week(ReservedMail rm) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("digitallibalert@gmail.com");
		message.setTo(rm.getAddress());
		message.setSubject(rm.getTitle());
		message.setText(rm.getContent());
		
		mailSender.send(message);
	}
}