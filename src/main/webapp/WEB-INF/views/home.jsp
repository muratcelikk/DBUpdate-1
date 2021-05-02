<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <h1>Kişi Ekle</h1>
                <form action='<s:url value="cartInsert"></s:url>' method="post">
                    <div class="form-group">
                        <input name="cname" type="text" required="required" class="form-control" placeholder="Adı">
                    </div>
                    <div class="form-group">
                        <input name="csurname" type="text" required="required" class="form-control" placeholder="Soyadı">
                    </div>
                    <div class="form-group">
                        <input name="cphone" type="tel" required="required" class="form-control" pattern='[0-9]{3}[0-9]{3}[0-9]{4}' maxlength="10" title="Telefon No : 5556540455">
                    </div>
                    <div class="form-group">
                        <select name="cid" class="form-control">
                            <c:if test="${ not empty cartData }">
                                <c:forEach items="${cartData }"  var="item" >
                                    <option value="${item.cid }">${item.ctitle }</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-danger">Kaydet</button>
                </form>
            </div>
            <div class="col-sm-8"></div>
        </div>
    </div>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</html>
