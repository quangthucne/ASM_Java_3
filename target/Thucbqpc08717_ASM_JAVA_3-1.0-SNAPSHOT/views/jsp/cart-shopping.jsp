<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 30/9/24
  Time: 00:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/cart-shopping.css">
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
<div id="wrapper">
    <div class="table-cart">
        <table id="cart">
            <thead>
            <tr>
                <th>SẢN PHẨM</th>
                <th>ĐƠN GIÁ</th>
                <th>SỐ LƯỢNG</th>
                <th>THÀNH TIỀN</th>
            </tr>
            </thead>
            <tbody>
            <tr class="product">
                <td class="info-produce">
                    <img src="https://product.hstatic.net/200000255805/product/img_5360_0c754306de3747d295870b921b580b51_master.jpg"
                         alt="Giày nike" style="width:50px;">
                    Giày Nike
                </td>
                <td class="price">399,000đ</td>
                <td class="quantity">
                    <button onclick="updateQuantity(this, -1)">-</button>
                    <input type="text" id="quantity" value="1">
                    <button onclick="updateQuantity(this, 1)">+</button>
                </td>
                <td class="total">399,000đ</td>
            </tr>
            <tr class="product">
                <td class="info-produce">
                    <img src="https://bizweb.dktcdn.net/thumb/1024x1024/100/369/522/products/balo-local-brand-di-hoc-dep-chinh-hang-academy-backpack-streetwear-2.jpg?v=1665826436727"
                         alt="Balo" style="width:50px;">
                    Balo
                </td>
                <td class="price">499,000đ</td>
                <td class="quantity">
                    <button onclick="updateQuantity(this, -1)">-</button>
                    <input type="text" id="quantity" value="1">
                    <button onclick="updateQuantity(this, 1)">+</button>
                </td>
                <td class="total">499,000đ</td>
            </tr>
            <tr class="product">
                <td class="info-produce">
                    <img src="https://down-vn.img.susercontent.com/file/ee6f10ad702cbfc724830cbec1690072"
                         alt="Đồng hồ" style="width:50px;">
                    Đồng hồ
                </td>
                <td class="price">299,000đ</td>
                <td class="quantity">
                    <button onclick="updateQuantity(this, -1)">-</button>
                    <input type="text" id="quantity" value="1">
                    <button onclick="updateQuantity(this, 1)">+</button>
                </td>
                <td class="total">299,000đ</td>
            </tr>
            <tr class="product">
                <td class="info-produce">
                    <img src="https://oemgroup.vn/uploads/cac-mon-qua-tang-su-kien-duoc-doanh-nghiep-de-mat-den-khi-danh-tang-den-khach-hang-1693296323.jpg"
                         alt="set quà" style="width:50px;">
                    Set quà
                </td>
                <td class="price">599,000đ</td>
                <td class="quantity">
                    <button onclick="updateQuantity(this, -1)">-</button>
                    <input type="text" id="quantity" value="1">
                    <button onclick="updateQuantity(this, 1)">+</button>
                </td>
                <td class="total">599,000đ</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="total-order">
        <div class="total-order-content">
            <h3>Tổng đơn hàng: <span id="order-total">0đ</span></h3>
        </div>
    </div>
    <div class="btn-pay">
        <button id="btn-pay">Thanh toán</button>
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
<script src="${pageContext.request.contextPath}/views/js/main.js"></script>
</body>
</html>
