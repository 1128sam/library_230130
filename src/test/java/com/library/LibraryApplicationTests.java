package com.library;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.ObjectUtils;

@SpringBootTest
class LibraryApplicationTests {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	// 단축키 alt + Lshift + x , t
	@Test
	void contextLoads() {
		logger.info("######## logger test");
	}

	@Test
	void 더하기테스트() {
		logger.info("$$$$$$$$$$ 더하기 테스트 시작");
		int a = 10, b = 20;

		assertEquals(30, a + b);
	}
	
	@Test
	void nullCheck() {
		String a = null;
//		if (a == null != a.isEmpty()) {
//			
//		}
		// 대신
		if (ObjectUtils.isEmpty(a)) {
			logger.info("비어있다.");
		} else {
			logger.info("비어있지 않다.");
		}

		List<String> list = null;
		logger.info(ObjectUtils.isEmpty(list) + "");
	}
	
//	단위 테스트
//	JUnit
//
//	TDD 테스트 주도 개발
//
//
//	String a = null;
//	a.isEmpty();
//
//	=>
//	npe
}