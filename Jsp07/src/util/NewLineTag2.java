package util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class NewLineTag2 extends SimpleTagSupport implements DynamicAttributes{
   //필드
	private Map<String, Object> attrs =new HashMap<>();
	
	@Override// 동정으로 속성 받아서 처리메소드
	public void setDynamicAttribute(String uri, String localName, Object value)
			     throws JspException {
		attrs.put(localName,value);	
	}

	@Override
	public void doTag() throws JspException, IOException {
		String color = (String)attrs.get("color");
		int size = Integer.parseInt((String)attrs.get("size"));
		//출력객체
		JspContext context = getJspContext();
		JspWriter out = context.getOut();
		out.print("<font color="+color+">");
		for(int i=0;i<size;i++)
			out.print("*");
		out.print("</font><br>");
		return;
	}
}
