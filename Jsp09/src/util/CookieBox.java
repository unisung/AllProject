package util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
  private Map<String, Cookie> cookieMap =new HashMap<>();
  
  public CookieBox(HttpServletRequest request) {
	  Cookie[] cookies = request.getCookies();
	  if(cookies!=null) {
		  for(int i=0;i<cookies.length;i++) {
			  cookieMap.put(cookies[i].getName(), cookies[i]);
		  }
	  }
  }
  
  public static Cookie createCookie(String name, String value)
		                           throws UnsupportedEncodingException {
	  return new Cookie(URLEncoder.encode(name,"utf-8")
			           ,URLEncoder.encode(value, "utf-8"));
  }
  
  public static Cookie createCookie(String name, String value, int maxAge)
          throws UnsupportedEncodingException {
     Cookie cookie = new Cookie(URLEncoder.encode(name,"utf-8")
			                   ,URLEncoder.encode(value, "utf-8"));
     cookie.setMaxAge(maxAge);
     return cookie;
  }
  public static Cookie createCookie(String name, String value, String domain, int maxAge)
		  throws UnsupportedEncodingException {
	  Cookie cookie = new Cookie(URLEncoder.encode(name,"utf-8")
			  ,URLEncoder.encode(value, "utf-8"));
	  cookie.setDomain(domain);
	  cookie.setMaxAge(maxAge);
	  return cookie;
  }
  
  public Cookie getCookie(String name) {
	  return cookieMap.get(name);
  }
  
  public String getValue(String name) throws UnsupportedEncodingException {
	  Cookie cookie = cookieMap.get(URLDecoder.decode(name, "utf-8"));
	  if(cookie==null)
		  return null;
	  
	  return URLDecoder.decode(cookie.getValue(), "utf-8");
  }
  
  public boolean exists(String name) {
	  return cookieMap.get(name)!=null;//cookieMap에 해당이름으로 쿠키가 존재하면 true;
  }
  
  
}
