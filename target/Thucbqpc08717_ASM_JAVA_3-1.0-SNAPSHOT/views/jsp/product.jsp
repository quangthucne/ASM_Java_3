<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 24/9/24
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8”>
    <title>Product</title>
    <script src="https://kit.fontawesome.com/27e6f9e8b6.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/slide.css">

</head>

<body>
<div class="container">
    <div class="header">
        <div class="header-bar">
            <ul class="main-menu">
                <li><a href="#">HỆ THỐNG CỬA HÀNG</a></li>
                <li><a href="chinh-sach-doi-tra.html">CSKH</a></li>
                <li>
                    <a href="#" style="width: 50px; display:flex; justify-content: center;align-items: center;"><i class="fa-solid fa-user" id="user"></i></a>
                    <ul class="submenu">
                        <li><a href="login.html">ĐĂNG NHẬP</a></li>
                        <li><a href="register.html">ĐĂNG KÝ</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="header-search">
            <div class="logo">
                <a href="home"><img src="${pageContext.request.contextPath}/views/img/logo.jpg" alt="Dino Store"></a>
            </div>
            <div class="input">
                <input type="text" id="input-search" placeholder="Tìm kiếm sản phẩm?">
                <button type="submit">Tìm kiếm <i class="fa-solid fa-magnifying-glass"></i></button>
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
    <div class="category-container">
        <h2 id="helloText" onplay="startRainbowText()">DANH MỤC</h2>
        <div class="category-grid">
            <div class="category-item">
                <a href="#">
                    <img src="https://product.hstatic.net/200000255805/product/img_5360_0c754306de3747d295870b921b580b51_master.jpg"
                         alt="Giày">
                    <p>Giày</p>
                </a>
            </div>
            <div class="category-item">
                <a href="#">
                    <img src="https://bizweb.dktcdn.net/thumb/1024x1024/100/369/522/products/balo-local-brand-di-hoc-dep-chinh-hang-academy-backpack-streetwear-2.jpg?v=1665826436727"
                         alt="balo">
                    <p>Balo</p>
                </a>
            </div>
            <div class="category-item">
                <a href="#">
                    <img src="https://down-vn.img.susercontent.com/file/ee6f10ad702cbfc724830cbec1690072" alt="Đồng hồ">
                    <p>Đồng hồ</p>
                </a>
            </div>
            <div class="category-item">
                <a href="#">
                    <img src="https://oemgroup.vn/uploads/cac-mon-qua-tang-su-kien-duoc-doanh-nghiep-de-mat-den-khi-danh-tang-den-khach-hang-1693296323.jpg"
                         alt="Set quà tặng">
                    <p>Set quà tặng</p>
                </a>
            </div>

        </div>
    </div>
    <div class="product-listing-container">
        <c:forEach items="${list}" var="product">
            <div class="product-card">
                <img src="https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lt9bh2f6czh5ef" alt="Product 1">
                <div class="product-info">
                    <h3 class="product-name">${product.name}</h3>
                    <div class="product-price">
                        <span class="current-price">${product.price}</span>
                        <span class="original-price">${product.price}</span>
                        <span class="discount">-44%</span>
                    </div>
                    <div class="product-stats">
                        <span class="sold">Số lượng ${product.quantity}</span>
                        <span class="location">Hà Nội</span>
                    </div>
                    <div class="product-action">
                        <button class="them-gio-hang">Thêm giỏ hàng</button>
                        <button class="buy-now">Mua Ngay</button>
                    </div>
                </div>
            </div>

        </c:forEach>
        <div class="page-action">
            <ul class="listPage">
            </ul>
        </div>

    </div>
        <div class="product-details" id="product-details" style="display: none;">
            <h2 id="detail-name">Tên sản phẩm</h2>
            <div class="container-detail-product">
                <div class="img-detail">
                    <img id="detail-image" src="" alt="Chi tiết sản phẩm">
                </div>
                <div class="info-product">
                    <p id="detail-price">Giá sản phẩm</p>
                    <p id="detail-description">Mô tả sản phẩm</p>
                    <div class="product-action">
                        <button class="them-gio-hang">Thêm giỏ hàng</button>
                        <button class="buy-now">Mua Ngay</button>
                    </div>
                </div>

            </div>

            <button onclick="closeDetails()" class="close-product">Đóng</button>
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
</footer>
</div>
<script src="${pageContext.request.contextPath}/views/js/main.js"></script>
<script src="${pageContext.request.contextPath}/views/js/page_product.js"></script>

<script src="https://uhchat.net/code.php?f=fbba65"></script>
</body>

</html>