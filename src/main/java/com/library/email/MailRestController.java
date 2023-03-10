package com.library.email;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.RestController;

import com.library.email.mail.MailService;
import com.library.email.model.Addressee;
import com.library.email.model.ReservedMail;
import com.library.main.bo.BookBO;
import com.library.main.model.Book;
import com.library.main.model.BookStatus;
import com.library.user.bo.UserBO;
import com.library.user.model.User;

@RestController
public class MailRestController {
	@Autowired
	private BookBO bookBO;
	@Autowired
	private UserBO userBO;
	@Autowired
	private MailService ms;

	@Scheduled(cron = "0 0 6 * * *")
	//at 6am everyday, the admin is going to inform the users to return their books.
	public void sendMail() {
		List<Book> bl = bookBO.getBookByBookId3(); // book1 book2 book3 ...
		List<User> ul = userBO.getUserByUserId2().stream().distinct().collect(Collectors.toList()); // got rid of overlapping users(to decrease the number of mails)

		for (int i = 0; i < ul.size(); i++) {
			Addressee mail = new Addressee();
			List<BookStatus> bs = bookBO.getNotReturnedBookStatusByUserId(ul.get(i).getId()); // gets bookstatus of all the books that user has not returned
			if (bs.get(0) != null) {
				mail.setBook1(bookBO.getBookByBookId(Integer.valueOf(bs.get(i).getBookId())));
			} else if (bs.get(1) != null) {
				mail.setBook2(bookBO.getBookByBookId(Integer.valueOf(bs.get(i).getBookId())));
			} else if (bs.get(2) != null) {
				mail.setBook3(bookBO.getBookByBookId(Integer.valueOf(bs.get(i).getBookId())));
			}
			mail.setAddress(ul.get(i).getEmail());
			mail.setTitle("Books to return: ");
			ms.sendMail(mail);
		}
	}

	@Scheduled(cron = "0 10 6 * * *")
	// sending an alert email to the user that he/she has a week left to return the book.
	public void sendAlertMailOneWeek() {
		List<BookStatus> bsl = bookBO.getBookStatus1Week();
		for (int i = 0; i < bsl.size(); i++) {
			int userId = bsl.get(i).getUserId();
			int bookId = Integer.valueOf(bsl.get(i).getBookId());
			ReservedMail lrm = new ReservedMail();
			lrm.setAddress(userBO.getUserInfoById(userId).getEmail());
			lrm.setTitle("You have one week left to return your borrowed book: " + bookBO.getBookByBookId(bookId).getTitle() + " - " + bookBO.getBookByBookId(bookId).getAuthor());
			lrm.setContent("You have one week left to return your borrowed book: " + bookBO.getBookByBookId(bookId).getTitle() + " - " + bookBO.getBookByBookId(bookId).getAuthor()
					+ "\n\nPlease return your book on time.");
			ms.sendAlertMail1Week(lrm);
		}
	}
}