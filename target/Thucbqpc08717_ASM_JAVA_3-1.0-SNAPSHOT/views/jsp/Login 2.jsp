<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 29/9/24
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
  <head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/Login.css" type="text/css">
  </head>
  <body>
  <div class="container" id="container">
    <div class="form-container sign-up-container">
      <form action="${pageContext.request.contextPath}/register" onsubmit="return validateForm()" method="post" >
        <h1>Đăng ký</h1>
        <input type="text" placeholder="Họ và Tên" name="fullName" />
        <input type="text" placeholder="Tên đăng nhập" name="userName"/>
        <input type="password" placeholder="Mật khẩu" name="password"/>
        <input type="password" placeholder="Nhập lại mật khẩu" name="confirmPassword"/>
        <select name="gender" id="gender">
          <option value="-1">Chọn giới tính</option>
          <option value="1">Nam</option>
          <option value="0">Nữ</option>
        </select>
        <input type="text" placeholder="Email" name="email"/>
        <input type="text" placeholder="Số điện thoại" name="phone" />
        <input type="text" value="1" hidden="hidden" name="status">
        <input type="text" value="0" hidden="hidden" name="role">
        <button type="submit">Đăng ký</button>
      </form>

    </div>
    <div class="form-container sign-in-container">
      <form action="${pageContext.request.contextPath}/login" method="post" onsubmit="return validateLoginForm()">
        <h1>Đăng nhập</h1>
        <input type="text" placeholder="Tên đăng nhập" name="username"/>
        <input type="password" placeholder="Mật Khẩu" name="password" id="password"/>
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
    <c:if test="${alert != null}">
      <div class="${alert[1] ? 'notification-pass': 'notification-fail'}">
        <span class="close">&times;</span>
        <strong>Thông báo:</strong> ${alert[0]}
      </div>
    </c:if>

    <c:if test="${error != null}">
      <div class="notification-fail">
        <span class="close">&times;</span>
        <strong>Thông báo:</strong> ${error}
      </div>
    </c:if>
  </div>
  <script>
    async function validateForm() {
      // Lấy các giá trị từ form
      const fullName = document.getElementsByName('fullName')[0].value;
      const username = document.getElementsByName('userName')[0].value;
      const password = document.getElementsByName('password')[0].value;
      const confirmPassword = document.getElementsByName('confirmPassword')[0].value;
      const gender = document.getElementById('gender').value;
      const email = document.getElementsByName('email')[0].value;
      const phone = document.getElementsByName('phone')[0].value;

      // Hàm kiểm tra xem chuỗi có chỉ chứa chữ cái và khoảng trắng không
      function isAlphaNumeric(str) {
        return /^[a-zA-ZÀ-ỹ\s]+$/.test(str);
      }

      // Hàm kiểm tra định dạng email
      function validateEmail(email) {
        const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
      }

      // Kiểm tra các điều kiện
      let isValid = true;

      // Kiểm tra nếu các trường cần thiết bị bỏ trống
      if (fullName === '' && username === '' && password === '' && confirmPassword === '' && email === '' && phone === '' && gender === '-1') {
        alert('Vui lòng nhập đầy đủ thông tin');
        isValid = false;
      }

      // Kiểm tra từng điều kiện cụ thể
      else if (fullName === '') {
        alert('Họ và tên không được để trống.');
        isValid = false;
      }
      else if (!isAlphaNumeric(fullName)) {
        alert('Họ và tên chỉ được chứa chữ cái và khoảng trắng.');
        isValid = false;
      }

      else if (username === '') {
        alert('Tên đăng nhập không được để trống.');
        isValid = false;
      }

      else if (password === '') {
        alert('Mật khẩu không được để trống.');
        isValid = false;
      } else if (password.includes(' ') || password.length < 8) {
        alert('Mật khẩu không hợp lệ. Mật khẩu phải có ít nhất 8 ký tự và không chứa dấu cách hoặc dấu.');
        isValid = false;
      }

      else if (confirmPassword === '') {
        alert('Xác nhận mật khẩu không được để trống.');
        isValid = false;
      } else if (confirmPassword !== password) {
        alert('Xác nhận mật khẩu không trùng khớp.');
        isValid = false;
      }

      else if (gender === '-1') {
        alert('Vui lòng chọn giới tính.');
        isValid = false;
      }

      else if (email === '') {
        alert('Email không được để trống.');
        isValid = false;
      } else if (!validateEmail(email)) {
        alert('Email không hợp lệ.');
        isValid = false;
      }

      else if (phone === '') {
        alert('Số điện thoại không được để trống.');
        isValid = false;
      } else if (!phone.match(/^[0-9]{10,12}$/)) {
        alert('Số điện thoại phải là chuỗi số từ 10 đến 12 chữ số.');
        isValid = false;
      }
      if (isValid) {

      }

      return isValid;
    }

    function validateLoginForm() {
      // Get references to form elements
      const username = document.querySelector('input[name="username"]').value;
      const password = document.getElementById('password').value;

      console.log(password)

      let isValid = true;
      let errorMessage = "";
      if (username === '' && password ==='') {
        errorMessage = 'Vui lòng nhập tên đăng nhập và mật khẩu!'
        isValid = false;
      }
      else if (username === '') {
        errorMessage = 'Vui lòng nhập tên đăng nhập.\n';
        isValid = false;
      }
      else if (password ==='') {
        errorMessage = 'Vui lòng nhập mật khẩu.\n';
        isValid = false;
      }

      // Show error message if any
      if (!isValid) {
        alert(errorMessage);
      }

      return isValid;
    }

    <%--function checkUnique(email, phone) {--%>
    <%--  const encodedEmail = encodeURIComponent(email);--%>
    <%--  const encodedPhone = encodeURIComponent(phone);--%>

    <%--  console.log(encodedEmail)--%>
    <%--  console.log(encodedPhone)--%>
    <%--  const url = `${pageContext.request.contextPath}/checkUnique?email=${encodedEmail}&phoneNumber=${encodedPhone}`;--%>

    <%--  return fetch(url)--%>
    <%--          .then(response => response.json())--%>
    <%--          .then(data => {--%>
    <%--            if (!data.isEmailUnique) {--%>
    <%--              console.log(data.isEmailUnique)--%>
    <%--              alert('Email đã tồn tại.');--%>
    <%--              return false;--%>
    <%--            }--%>
    <%--            if (!data.isPhoneUnique) {--%>
    <%--              alert('Số điện thoại đã tồn tại.');--%>
    <%--              return false;--%>
    <%--            }--%>
    <%--            return true;  // Nếu tất cả đều hợp lệ--%>
    <%--          })--%>
    <%--          .catch(error => {--%>
    <%--            console.error('Error:', error);--%>
    <%--            return false;  // Trả về false nếu có lỗi trong quá trình fetch--%>
    <%--          });--%>
    <%--}--%>


  </script>
  <script>
    const notification = document.querySelector('.notification-pass');
  const closeBtn = document.querySelector('.close');
  notification.style.display = 'block'
  closeBtn.addEventListener('click', () => {
    notification.style.display = 'none'
  });
  setTimeout(() => {
    notification.style.display = 'none'
  }, 3000);

  const notificationFail = document.querySelector('.notification-fail');
  notificationFail.style.display = 'block'
  closeBtn.addEventListener('click', () => {
    notificationFail.style.display = 'none'
  });
  setTimeout(() => {
    notificationFail.style.display = 'none'
  }, 3000);</script>
  <script src="${pageContext.request.contextPath}/views/js/Login.js"></script>
  </body>
</html>
