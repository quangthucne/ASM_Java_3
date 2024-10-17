<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 29/9/24
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/Login.css" type="text/css">
  </head>
  <body>
  <div class="container" id="container">
    <div class="form-container sign-up-container">
      <form action="${pageContext.request.contextPath}/register" method="post">
        <h1>Đăng ký</h1>
        <input type="text" placeholder="Họ và Tên" name="fullName" required />
        <input type="text" placeholder="Tên đăng nhập" name="userName" required />
        <input type="password" placeholder="Mật khẩu" name="password" required />
        <input type="password" placeholder="Nhập lại mật khẩu" name="confirmPassword" required />
        <select name="gender" id="gender">
          <option value="-1">Chọn giới tính</option>
          <option value="1">Nam</option>
          <option value="0">Nữ</option>
        </select>
        <input type="email" placeholder="Email" name="email" required />
        <input type="tel" placeholder="Số điện thoại" name="phone" pattern="[0-9]{10,12}" required />
        <input type="text" value="1" hidden="hidden" name="status">
        <input type="text" value="0" hidden="hidden" name="role">
        <button type="submit">Đăng ký</button>
      </form>

    </div>
    <div class="form-container sign-in-container">
      <form action="${pageContext.request.contextPath}/login" method="post">
        <h1>Đăng nhập</h1>
        <input type="text" placeholder="Tên đăng nhập" name="username"/>
        <input type="password" placeholder="Mật Khẩu" name="password" />
        <a href="#">Quên mật khẩu?</a>
        <button>Đăng nhập</button>
      </form>
    </div>
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-left">
          <h1>Chào mừng trở lại!</h1>
          <p>Đăng nhập để tiếp tục</p>
          <button class="ghost" id="signIn">Đăng nhập</button>
        </div>
        <div class="overlay-panel overlay-right">
          <h1>Xin chào!</h1>
          <p>Tạo tài khoản để gia nhập với chúng tôi </p>
          <button class="ghost" id="signUp">Đăng ký</button>
        </div>
      </div>
    </div>
  </div>
  
  <script src="${pageContext.request.contextPath}/views/js/Login.js"></script>
  </body>
</html>
