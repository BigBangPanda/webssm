<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: elephant
  Date: 2018/3/20
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" >

        function submitFunc() {
            $("#myForm").submit();
        }


        function ajaxSubmit() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "text",//预期服务器返回的数据类型
                url: "http://localhost:8080/getUser" ,//url
                data: $('#myForm').serialize(),
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result.resultCode === 200) {
                        alert("SUCCESS");
                    }
                },
                error : function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }
            });
        }
    </script>
</head>
<body>
    <form id="myForm">
        <table>
            <tr><td colspan="2">id <input id="selectId" name="selectId" value="${selectId }" /><button type="button" onclick="submitFunc()" id="submitBtn">提交</button></td></tr>
            <tr>
                <td>用户id</td><td>用户名</td>
            </tr>
            <c:forEach items="${userList }" var="user">
                <tr>
                    <td>${user.id}</td><td>${user.username}</td>
                </tr>
            </c:forEach>
        </table>
    </form>
</body>
</html>
