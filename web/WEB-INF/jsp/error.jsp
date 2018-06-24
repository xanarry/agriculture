<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-21
  Time: 下午2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${title}</title>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
</head>
<body>

<div class="container">

    <div class="row" style="padding-top: 15%">
        <div class="col-md-6 offset-3">
            <div class="card">
                <h4 class="card-header text-center">${head}</h4>
                <div class="card-body">
                    <div class="form-group row">
                        <p>${message}</p>
                    </div>
                    <div class="text-center">
                        <a href="${url}" class="btn btn-primary">${linkText}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
