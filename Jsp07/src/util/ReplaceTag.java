package util;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ReplaceTag extends SimpleTagSupport{
	//필드
	private String oldWord,newWord;

	public void setOldWord(String oldWord) {this.oldWord = oldWord;	}

	public void setNewWord(String newWord) {this.newWord = newWord;	}

	@Override
	public void doTag() throws JspException, IOException {
		JspContext context = getJspContext();
		JspWriter out = context.getOut();
		JspFragment body = getJspBody();
		StringWriter writer = new StringWriter();
		body.invoke(writer);//메소드 실행
		String str = writer.toString();
		String newStr = str.replaceAll(oldWord, newWord);
		out.print(newStr);
		return;
	}
}
