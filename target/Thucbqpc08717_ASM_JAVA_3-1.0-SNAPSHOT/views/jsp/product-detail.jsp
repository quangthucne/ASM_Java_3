<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 29/9/24
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/product-detail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/style.css" type="text/css">

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
            <li>
                <a href="#">
                    <a href="#" style="width: 50px; display:flex; justify-content: center;align-items: center;"><i class="fa-solid fa-user" id="user"></i></a>


                </a>
                <ul class="submenu">
                    <li><a href="login.html">
                        <p>ĐĂNG NHẬP</p>
                    </a></li>
                    <li><a href="register.html">
                        <p>ĐĂNG KÝ</p>
                    </a></li>
                </ul>
            </li>
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
            <a href="cat-shopping.html"><i class="fa-solid fa-cart-shopping"></i></a>
        </div>
    </div>
    <div class="header-menu">
        <ul class="menu">
            <li>
                <a href="#">DANH MỤC</a>
                <ul class="menu-sub">
                    <li><a href="#">Giày</a></li>
                    <li><a href="#">Balo</a></li>
                    <li><a href="#">Đồng hồ</a></li>
                    <li><a href="#">Set quà</a></li>
                </ul>
            </li>
            <li>
                <a href="#">FLASH SALE</a>
            </li>
            <li>
                <a href="product">SẢN PHẨM</a>
            </li>
            <li>
                <a href="contact.html">LIÊN HỆ</a>
            </li>
            <li>
                <a href="#">THƯƠNG HIỆU</a>
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
<div id="all-details">
    <div class="img-all-details">
        <div class="img-details-product">
            <img src="https://giaydino.com/wp-content/uploads/2021/02/Giay-Nike-Air-Jordan-1-Low-Black-Toe-Do-Den-1.jpg"
                 alt="Item 6">
        </div>
    </div>
    <div class="infor-details">
        <div class="title-big-details">
            Giày Sneaker Nike Air Force 1
        </div>
        <div class="icon-star-details">
            4.9
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
            <i class="fa-solid fa-star"></i>
        </div>
        <div class="price-details">
            625.000 VNĐ
        </div>
        <div class="product-details-title">
            Chi Tiết Sản Phẩm
        </div>
        <div class="product-details">
            Ra mắt từ năm 1982, Nike Air Force 1 đã trở thành một trong những đôi giày sneaker kinh điển nhất mọi thời đại. Với thiết kế đơn giản, tinh tế và chất liệu cao cấp, Air Force 1 không chỉ là một đôi giày, mà còn là biểu tượng của phong cách đường phố.
        </div>
        <div class="quantity-details">
            <div class="title-quantity-details">
                Số Lượng
            </div>
            <div class="btn-minus" onclick="minus()">-</div>
            <div class="number-quatity-details">1</div>
            <div class="btn-plus" onclick="plus()">+</div>
        </div>
        <div class="btn-details">
            <div class="cart-details" onclick="add()">Thêm Vào Giỏ Hàng</div>
            <div class="buy-details" onclick="bought()">MUA NGAY</div>
        </div>
        <div id="cart">
            <div id="cart-icon" onclick="cart()"><i class='bx bxs-cart-alt'></i></div>
            <div id="count-products">0</div>
        </div>
    </div>
</div>



<div id="popup" class="popup">
    <div class="popup-content">
        <span class="close-btn" onclick="closePopup()">&times;</span>
        <p id="popup-message"></p>
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

<script src="${pageContext.request.contextPath}/views/js/product-detail.js"></script>

</body>
</html>
