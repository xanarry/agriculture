<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-8
  Time: 上午10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<footer class="footer">
    <div class="text-center" style="margin-bottom: 1%">
        <%--<ul class="list-inline">
            <li class="list-inline-item"><a href="/judge-server">评测机</a></li>
            <li class="list-inline-item"><a href="/contact-me">联系我</a></li>
            <li class="list-inline-item"><a href="/about">关于</a></li>
            <li class="list-inline-item"><a href="/faq">FAQ</a></li>
        </ul>--%>
        <jsp:useBean id="now" class="java.util.Date"/>
        <span class="text-muted">Copyright©<fmt:formatDate value="${now}" pattern="yyyy"/> Xanarry. All rights reserved.</span>
    </div>
</footer>
