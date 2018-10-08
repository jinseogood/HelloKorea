package com.kh.hello.payment.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {
	
	 private Logger logger = LoggerFactory.getLogger(getClass());

	 private static String URL_PAYPAL_VALIDATE; // PDT데이터를 페이팔로 보낼 서버주소

	 // PDT 첫번째 응답 변수 선언
	 private static final String PARAM_TX = "tx";
	 private static final String PARAM_CMD = "cmd";
	 private static final String PARAM_CMD_VALUE = "_notify-synch";
	 private static final String PARAM_AT = "at";
	 private static String PARAM_AT_VALUE;

	 private static final String RESPONSE_SUCCESS = "SUCCESS";
	 private static final String RESPONSE_FAIL = "FAIL";

	 static
	 {
		 URL_PAYPAL_VALIDATE = "https://www.sandbox.paypal.com/cgi-bin/webscr";
		 PARAM_AT_VALUE = "p7Hy0ZXi_EUdtMCi0MwQG8PTrbJUnK4KbhtazB7r9RPniS9YsBQZ0nlI5Sm";
	 }

	 private static final String PARAM_ITEM_NAME = "item_name";    // 상품이름
	 private static final String PARAM_ITEM_NUMBER = "item_number";   // 상품번호
	 private static final String PARAM_PAYMENT_STATUS = "payment_status";       // 결제 상태
	 private static final String PARAM_MC_GROSS = "mc_gross";    // 페이팔 결제금액
	 private static final String PARAM_MC_CURRENCY = "mc_currency";   // 화폐
	 private static final String PARAM_TXN_ID = "txn_id";     // 거래번호
	 private static final String PARAM_PAYER_EMAIL = "payer_email";   // 페이팔 구매자계정 이메일
	 private static final String PARAM_QUANTITY = "quantity";	// 수량
	 private static final String PARAM_PAYMENT_DATE = "payment_date";	// 결제일
	 private static final String PARAM_CUSTOM = "custom";     // 주문자 정보
	
	@RequestMapping(value="paymentDetailView.pay")
	public String paymentDetailView(){
		return "payment/detailPayment";
	}
	
	@RequestMapping(value="paymentConfirm.pay")
	public String paymentConfirm(HttpServletRequest request){

		try{
			// PayPal로부터온 파라미터를 표시한다.
			Enumeration en = request.getParameterNames();
			String readString = "";
			while (en.hasMoreElements()) {
				String paramName = (String) en.nextElement();
				String paramValue = request.getParameter(paramName);
				readString = readString + "&" + paramName + "=" + URLDecoder.decode(paramValue, "UTF-8");
			}
			logger.info("Received PDT from PayPal:" + readString);

			// 다시 PayPal로 게시하기 위해 파라미터를 구성한다.
			String str = PARAM_CMD + "=" + PARAM_CMD_VALUE;
			en = request.getParameterNames();
			while (en.hasMoreElements()) {
				String paramName = (String) en.nextElement();
				String paramValue = request.getParameter(paramName);
				str = str + "&" + paramName + "=" + URLEncoder.encode(paramValue, "UTF-8");
			}
			str = str + "&" + PARAM_AT + "=" + PARAM_AT_VALUE;
			logger.info("Sending PDT to PayPal:" + str);

			// 유효성을 검사하기 위해 PayPal로 다시 전송시작.
			URL u = new URL(URL_PAYPAL_VALIDATE);
			HttpURLConnection uc = (HttpURLConnection) u.openConnection();
			uc.setDoOutput(true);
			uc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			PrintWriter pw = new PrintWriter(uc.getOutputStream());
			pw.println(str);
			pw.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));

			String res = in.readLine();

			if (res.equals(RESPONSE_SUCCESS)) {

				logger.info("페이팔서버로 부터 PDT유효성 요청이 성공했습니다.");

				String[] temp;
				HashMap vars = new HashMap();

				while ((res = in.readLine()) != null) {
					System.out.println("res : " + res);
					temp = res.split("=");
					System.out.println("temp : " + temp);
					System.out.println("temp length : " + temp.length);
					if (temp.length == 2) {
						vars.put(temp[0], URLDecoder.decode(temp[1], "UTF-8"));
						logger.info("{}{}{}",new Object[]{temp[0],":",temp[1]});
					}
				}

				String itemName = (String) vars.get(PARAM_ITEM_NAME);
				int itemNumber = Integer.parseInt((String) vars.get(PARAM_ITEM_NUMBER));
				String paymentStatus = (String) vars.get(PARAM_PAYMENT_STATUS);
				double paymentAmount = Double.parseDouble((String) vars.get(PARAM_MC_GROSS));
				String paymentCurrency = (String) vars.get(PARAM_MC_CURRENCY);
				String payerEmail = (String) vars.get(PARAM_PAYER_EMAIL);
				String custom = (String) vars.get(PARAM_CUSTOM);
				int quantity = Integer.parseInt((String) vars.get(PARAM_QUANTITY));
				String payDate = (String) vars.get(PARAM_PAYMENT_DATE);
				
				System.out.println("itemName : " + itemName);
				System.out.println("itemNumber : " + itemNumber);
				System.out.println("paymentStatus : " + paymentStatus);
				System.out.println("paymentAmount : " + paymentAmount);
				System.out.println("paymentCurrency : " + paymentCurrency);
				System.out.println("payerEmail : " + payerEmail);
				System.out.println("custom : " + custom);
				System.out.println("quantity : " + quantity);
				System.out.println("payDate : " + payDate);
				
				/*payment
				결제아이디
				회원아이디
				투숙자명
				투숙자전화번호
				투숙자이메일
				
				pay_detail
				결제상세아이디
				결제일
				결제구분
				금액
				수단
				결제아이디*/

				//.. DB 작업 및 응답페이지 호출 등등 작업을 한다..

			} else if (res.equals(RESPONSE_FAIL)) {
				logger.warn("페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res);
			} else {
				logger.error("페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res);
			}
		}
		catch (Exception e){
			e.printStackTrace();
		}

		return "payment/confirmPayment";
	}

}
