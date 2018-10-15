package com.kh.hello.payment.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hello.common.Email;
import com.kh.hello.common.EmailSender;
import com.kh.hello.payment.model.service.PaymentService;
import com.kh.hello.payment.model.vo.PayDetail;
import com.kh.hello.payment.model.vo.Payment;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService ps;
	
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
	public String paymentConfirm(HttpServletRequest request, Model model){
		
		int result=-99;

		try{
			// PayPal로부터온 파라미터를 표시한다.
			Enumeration en = request.getParameterNames();
			String readString = "";
			while (en.hasMoreElements()) {
				String paramName = (String) en.nextElement();
				String paramValue = request.getParameter(paramName);
				readString = readString + "&" + paramName + "=" + URLDecoder.decode(paramValue, "UTF-8");
			}
			//logger.info("Received PDT from PayPal:" + readString);

			// 다시 PayPal로 게시하기 위해 파라미터를 구성한다.
			String str = PARAM_CMD + "=" + PARAM_CMD_VALUE;
			en = request.getParameterNames();
			while (en.hasMoreElements()) {
				String paramName = (String) en.nextElement();
				String paramValue = request.getParameter(paramName);
				str = str + "&" + paramName + "=" + URLEncoder.encode(paramValue, "UTF-8");
			}
			str = str + "&" + PARAM_AT + "=" + PARAM_AT_VALUE;
			//logger.info("Sending PDT to PayPal:" + str);

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
			
			int mId=0;

			if (res.equals(RESPONSE_SUCCESS)) {

				logger.info("페이팔서버로 부터 PDT유효성 요청이 성공했습니다.");

				String[] temp;
				HashMap vars = new HashMap();

				while ((res = in.readLine()) != null) {
					temp = res.split("=");
					if (temp.length == 2) {
						vars.put(temp[0], URLDecoder.decode(temp[1], "UTF-8"));
						//logger.info("{}{}{}",new Object[]{temp[0],":",temp[1]});
					}
				}

				//상품명
				String itemName = (String) vars.get(PARAM_ITEM_NAME);
				//상품 번호
				int itemNumber = Integer.parseInt((String) vars.get(PARAM_ITEM_NUMBER));
				//결제 상태
				String paymentStatus = (String) vars.get(PARAM_PAYMENT_STATUS);
				//결제 금액
				double paymentAmount = Double.parseDouble((String) vars.get(PARAM_MC_GROSS));
				//통화
				String paymentCurrency = (String) vars.get(PARAM_MC_CURRENCY);
				//구매자 페이팔 이메일
				String payerEmail = (String) vars.get(PARAM_PAYER_EMAIL);
				//주문자 정보 및 주문 추가정보
				String custom = (String) vars.get(PARAM_CUSTOM);
				//상품 수량
				int quantity = Integer.parseInt((String) vars.get(PARAM_QUANTITY));
				//결제일
				String payDate = (String) vars.get(PARAM_PAYMENT_DATE);
				
				/*System.out.println("itemName : " + itemName);
				System.out.println("itemNumber : " + itemNumber);
				System.out.println("paymentStatus : " + paymentStatus);
				System.out.println("paymentAmount : " + paymentAmount);
				System.out.println("paymentCurrency : " + paymentCurrency);
				System.out.println("payerEmail : " + payerEmail);
				System.out.println("custom : " + custom);
				System.out.println("quantity : " + quantity);
				System.out.println("payDate : " + payDate);*/
				
				String[] orderInfo=custom.split(",");
				
				mId=Integer.parseInt(orderInfo[0]);
				
				/*for(int i=0;i<orderInfo.length;i++){
					System.out.println("orderInfo[" + i + "] : " + orderInfo[i]);
				}*/
				
				Payment p=new Payment();
				p.setmId(Integer.parseInt(orderInfo[0]));
				p.setPaName(orderInfo[1]);
				p.setPaPhone(orderInfo[2]);
				p.setPaEmail(orderInfo[3]);
				
				ArrayList<PayDetail> pdList=new ArrayList<PayDetail>();
				
				if(orderInfo[4].equals("pc")){
					PayDetail pd=new PayDetail();
					pd.setPdType("purchase");
					pd.setPrice(paymentAmount);
					pd.setPdMethod("c");
					
					PayDetail pd2=new PayDetail();
					pd2.setPdType("purchase");
					pd2.setPrice(Double.parseDouble(orderInfo[5]));
					pd2.setPdMethod("p");
					
					pdList.add(pd);
					pdList.add(pd2);
					
				}
				else{
					PayDetail pd=new PayDetail();
					pd.setPdType("purchase");
					pd.setPrice(paymentAmount);
					pd.setPdMethod("c");
					
					pdList.add(pd);
				}
				
				int rInsert=ps.insertAllPayment(p, pdList);
				
				//System.out.println("rInsert : " + rInsert);
				
				if(rInsert > 0){
					int rUpdate=ps.updateReservation(Integer.parseInt(orderInfo[6]));
					
					if(rUpdate > 0){
						result=1;
					}
					else{
						result=0;
					}
				}
				else{
					result=0;
				}
				
			}
			else if (res.equals(RESPONSE_FAIL)) {
				logger.warn("페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res);
				
				result=-88;
			}
			else {
				logger.error("페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res);
				
				result=-77;
			}
			
			if(result > 0){
				Payment p=ps.selectPayInfo(mId);
				ArrayList<PayDetail> pdList=ps.selectPayDetailInfo(p.getPaId());
				
				int orderNum=1;
				String orderDate=pdList.get(0).getPdDate();
				String orderName=p.getPaName();
				String orderPhone=p.getPaPhone();
				String proCName="업체";
				String proRName="객실";
				double proPrice=pdList.get(0).getPrice();
				
				//예약확인 메일 전송
				/*Email email=new Email();
				email.setMailFrom("hellokoreamailservice@gmail.com");
				email.setMailTo(p.getPaEmail());
				email.setMailSubject(p.getPaName() + "님 예약 확인 메일입니다.");
				email.setTemplateName("emailtemplate.vm");
				ApplicationContext context = new FileSystemXmlApplicationContext("D:/git/HelloKorea/src/main/resources/root-context.xml");
				EmailSender es = (EmailSender) context.getBean("mailer");
				
				es.sendMail(email, orderNum, orderDate, orderName, orderPhone, proCName, proRName, proPrice);*/
				
				model.addAttribute("p", p);
				model.addAttribute("pdList", pdList);
				
				return "payment/confirmPayment";
			}
			else{
				String errorMSG="";
				
				if(result == -88){
					errorMSG="페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res;
				}
				else{
					errorMSG="페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태:"+res;
				}
				
				model.addAttribute("msg", errorMSG);
				
				return "common/errorPage";
			}
		}
		catch (Exception e){
			model.addAttribute("msg", e.getMessage());
			
			return "common/errorPage";
		}

	}

}
