package util;

import java.io.IOException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class NewLineTag extends SimpleTagSupport{
   //필드
	private int size;
	private String color;
	//setter()메소드
	public void setSize(int size) {	this.size = size;	}
	public void setColor(String color) {this.color = color;	}

	@Override
	public void doTag() throws JspException, IOException {
		 JspContext context = getJspContext();
		 JspWriter out = context.getOut();
		 out.print("<font color="+color+">");
		 for(int cnt=0;cnt<size;cnt++)
			 out.print("*");
		 out.print("</font><br>");
		 return;
	}
}
