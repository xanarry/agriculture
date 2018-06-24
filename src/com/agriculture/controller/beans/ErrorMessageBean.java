package com.agriculture.controller.beans;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class ErrorMessageBean {
    private String title;
    private String head;
    private String message;
    private String url;
    private String linkText;

    public ErrorMessageBean() {
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = (title == null ? "错误" : title);
    }

    public String getHead() {
        return head;
    }

    public void setHeader(String head) {
        this.head = (head == null ? "发生错误" : head);
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = (message == null ? "发生错误" : message);
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = (url == null ? "/" : url);
    }

    public String getLinkText() {
        return linkText;
    }

    public void setLinkText(String linkText) {
        this.linkText = (linkText == null ? "返回首页" : linkText);
    }

    @Override
    public String toString() {
        return "ErrorMessageBean{" +
                "title='" + title + '\'' +
                ", head='" + head + '\'' +
                ", message='" + message + '\'' +
                ", url='" + url + '\'' +
                ", linkText='" + linkText + '\'' +
                '}';
    }

    public String toURLParamDecode() {
        try {
             return String.format("title=%s&header=%s&message=%s&url=%s&linkText=%s",
                    URLEncoder.encode(this.title, "utf8"),
                    URLEncoder.encode(this.head, "utf8"),
                    URLEncoder.encode(this.message, "utf8"),
                    this.url,
                    URLEncoder.encode(this.linkText, "utf8"));

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }
}
