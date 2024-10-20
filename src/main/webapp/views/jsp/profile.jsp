<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 30/9/24
  Time: 02:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Thông tin cá nhân</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/profile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/27e6f9e8b6.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

</head>
<body>
<div class="header">
    <div class="header-bar">
        <ul class="main-menu">
            <li><a href="#">
                <p>HỆ THỐNG CỬA HÀNG</p>
            </a></li>
            <li><a href="chinh-sach-bao-hanh.html">
                <p>CSKH</p>
            </a></li>
            <%--                profile--%>
            <c:choose>
                <c:when test="${user == null}">
                    <li>
                        <a href="#">
                            <a href="#" style="width: 50px; display:flex; justify-content: center;align-items: center;"><i class="fa-solid fa-user" id="user"></i></a>
                        </a>
                        <ul class="submenu">
                            <li><a href="login">
                                <p>ĐĂNG NHẬP</p>
                            </a></li>
                        </ul>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="#">
                            <a href="#" style="width: 150px;" class="user-name">${user.fullName}</a>
                        </a>
                        <ul class="submenu">
                            <li><a href="profile">
                                <p>Thông tin</p>
                            </a></li>
                            <li>
                                <a href="">
                                    <p>Dăng xuất</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>
    <div class="header-search">
        <div class="logo">
            <a href=""><img src="${pageContext.request.contextPath}/views/img/logo.jpg" alt="Dino Store"></a>
        </div>
        <div class="input">
            <input type="text" id="input-search" placeholder="Tìm kiếm sản phẩm?">
            <button type="submit">Tìm kiếm <i class="fa-solid fa-magnifying-glass" id="giohang"></i></button>
        </div>
        <div class="cat-shopping">
            <a href="cart"><i class="fa-solid fa-cart-shopping"></i></a>
        </div>
    </div>
    <div class="header-menu">
        <ul class="menu">
            <li>
                <a href="#" class="text-decoration-none">DANH MỤC</a>
                <ul class="menu-sub">
                    <c:forEach items="${category}" var="cate">
                        <li><a href="product" data-id="${cate.idCategory}">${cate.name}</a></li>
                    </c:forEach>
                </ul>
            </li>
            <li>
                <a href="#" class="text-decoration-none">FLASH SALE</a>
            </li>
            <li>
                <a href="product" class="text-decoration-none">SẢN PHẨM</a>
            </li>
            <li>
                <a href="contact.html" class="text-decoration-none">LIÊN HỆ</a>
            </li>
            <li>
                <a href="#" class="text-decoration-none">THƯƠNG HIỆU</a>
                <ul class="menu-sub">
                    <li><a href="#">Mike</a></li>
                    <li><a href="#">Gucci</a></li>
                    <li><a href="#">Hublot</a></li>
                    <li><a href="#">Balenceaga</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<div class="container">
    <div class="profile-section">
        <h2>Hồ sơ cá nhân</h2>
        <div class="profile-info">
            <img src="${pageContext.request.contextPath}/views/img/logo.jpg" alt="Profile Picture" id="profile-picture">
            <div class="details">
                <p><strong>Name:</strong> <span id="profile-name">${user.fullName}</span></p>
                <p><strong>Email:</strong> <span id="profile-email">${user.email}</span></p>
                <p><strong>Phone:</strong> <span id="profile-phone">${user.phone}</span></p>
            </div>
        </div>
    </div>

    <div class="history-section">
        <h2>Lịch sử mua hàng</h2>
        <table class="table table-striped" id="myTable">
        <thead>
            <tr>
                <th>Mã đơn hàng</th>
                <th>Ngày</th>
                <th>Sản phẩm</th>
                <th>Thành tiền</th>
            </tr>
            <tr>
                <td>ORD001</td>
                <td>2023-09-01</td>
                <td>Nike Shoes</td>
                <td>1,500,000đ</td>
            </tr>
            </thead>

            <tbody>
            </tbody>
        </table>
    </div>
</div>
<footer class="container-fluid">
    <div class="footer-content">
        <div class="newsletter">
            <h4>Đăng ký nhận bản tin</h4>
            <p>Đừng bỏ lỡ hàng ngàn sản phẩm và chương trình siêu hấp dẫn</p>
            <div class="form-group">
                <input class="form-control" type="email" placeholder="Địa chỉ email của bạn">
                <button class="btn btn-primary">Đăng Ký</button>
            </div>
        </div>
        <div class="contact-info">
            <a href="contact.html" style="text-decoration: none; color: white;">
                <h4>Thông tin liên hệ</h4>
            </a>
            <p>Hotline: 0917988192</p>
            <p>Email: thucbqpc087172gmail.com</p>
            <p>Địa chỉ: 123 Đường ABC, Quận XYZ, TP. Hà Nội</p>
        </div>
        <div class="footer-section payment-methods">
            <h2>Phương thức thanh toán</h2>
            <ul>
                <li><img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQuxbSRnTGdcyj7dUTmTVmi63ZTB2qjYZOpTvG9Ys3Ln-gNtALKFmi93XhRCkk-"
                         alt="Visa"></li>
                <li><img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTDmzcX3E_GaumAGI1XQNKYoMHOHUFp-WU6ZEcPaCpkTUDBfJnGIaOWzNvz4qh7"
                         alt="MasterCard"></li>
                <li><img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTtEcYWbGD3HvEEoJFWRT-uDx70KijzPlbPZcbCP0ddTnzIMm6g9yHlShIXbaT7"
                         alt="PayPal"></li>
                <li><img src="https://vnpay.vn/s1/statics.vnpay.vn/2023/9/06ncktiwd6dc1694418196384.png"
                         alt="VN Pay"></li>
            </ul>
        </div>
    </div>
    <div class="social-media">
        <h4>Kết nối với chúng tôi</h4>
        <a href="#"><i class="fa-brands fa-facebook" id="icon-contact"></i></a>
        <a href="#"><i class="fa-brands fa-instagram" id="icon-contact"></i></a>
        <a href="#"><i class="fa-brands fa-discord" id="icon-contact"></i></a>
    </div>
    <div class="footer-bottom">
        <p>&copy; DINO STORE</p>
    </div>
    <button id="backToTopBtn"><i class="fa-solid fa-arrow-up"></i></button>
    <script>
        //back to top
        let backToTopBtn = document.getElementById("backToTopBtn");
        window.onscroll = function () { scrollFunction() };
        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                backToTopBtn.style.display = "block";
            } else {
                backToTopBtn.style.display = "none";
            }
        }
        backToTopBtn.addEventListener("click", function () {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop= 0;
        });
    </script>
</footer>
<%--<script src="${pageContext.request.contextPath}/views/js/profile.js"></script>--%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $('#myTable').DataTable({
            paging: true,
            ordering: true,
            info: true,
            language: {
                url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
            }
        });
    });
</script>
</body>
</html>
