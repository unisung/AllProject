package util;

import java.io.IOException;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class StartLineTag extends SimpleTagSupport{
	@Override
	public void doTag() throws JspException, IOException {
          JspContext context =getJspContext();
          JspWriter out =context.getOut();
          out.print("****************************<br>");
          return;
	}
}
