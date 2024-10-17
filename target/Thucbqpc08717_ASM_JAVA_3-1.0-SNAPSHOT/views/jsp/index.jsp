<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 24/9/24
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Home</title>
    <script src="https://kit.fontawesome.com/27e6f9e8b6.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/style.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/slide.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/product.css" type="text/css">

</head>
<body>
<div class="container">
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
</div>
<div class="slideshow-container">
    <div class="mySlides fade">
        <div class="img-slide"><img src="https://intphcm.com/data/upload/banner-thoi-trang-tuoi.jpg"></div>
    </div>

    <div class="mySlides fade">
        <div class="img-slide"><img
                src="https://cdn-kvweb.kiotviet.vn/kiotviet-website/wp-content/uploads/2017/10/4-nguon-hang-giúp-cua-hang-phu-kien-thoi-trang-dat-khach-4.jpg"
                alt="Image 1">
        </div>
    </div>

    <div class="mySlides fade">
        <div class="img-slide"><img
                src="https://img.freepik.com/premium-photo/photocomposition-horizontal-shopping-banner-with-woman-big-smartphone_23-2151201773.jpg"
                alt="Image 2"></div>
    </div>

    <div class="mySlides fade">
        <div class="img-slide"><img src="https://blog.dktcdn.net/files/mo-hinh-shop-phu-kien-thoi-trang-5.jpeg"
                                    alt="Image 2"></div>
    </div>

    <a class="prev" onclick="changeSlide(-1)">&#10094;</a>
    <a class="next" onclick="changeSlide(1)">&#10095;</a>
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
<div class="flash-sale-container">
    <div class="flash-sale-header">
        <h2 id="textSale">FLASH SALE</h2>
        <a href="#" class="view-all">Xem tất cả ></a>
    </div>
    <div class="flash-sale-items">
        <div class="sale-item">
            <img src="https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lmm2z1zyy9jze9" alt="Item 1">
            <div class="discount-badge">-66%</div>
            <p class="price">₫185.000</p>
            <p class="status">ĐANG BÁN CHẠY</p>
        </div>
        <div class="sale-item">
            <img src="https://product.hstatic.net/1000281824/product/7cbf5801-3f66-492c-8d91-873beb45b013_5a2650170c724d6ba2071164754afa55.jpeg"
                 alt="Item 2">
            <div class="discount-badge">-31%</div>
            <p class="price">₫104.000</p>
            <p class="status">ĐANG BÁN 68</p>
        </div>
        <div class="sale-item">
            <img src="https://img.lazcdn.com/g/p/c995f31bd292a9f35ccc1d878636f961.jpg_720x720q80.jpg" alt="Item 3">
            <div class="discount-badge">-11%</div>
            <p class="price">₫496.000</p>
            <p class="status">ĐANG BÁN CHẠY</p>
        </div>
        <div class="sale-item">
            <img src="https://beesweetbee.com/upload/product-img/md/2022/09/2022-09-c81e728d9d4c2f636f067f89cc14862c-cd7b2eac1894794816b8befa1d545cb5.jpg"
                 alt="Item 4">
            <div class="discount-badge">-56%</div>
            <p class="price">₫419.000</p>
            <p class="status">ĐANG BÁN CHẠY</p>
        </div>
        <div class="sale-item">
            <img src="https://product.hstatic.net/200000117085/product/vang_32x145x315cm_1_cfc212ca5b7c401885be714d9c5deb0b_088377352d704899b26537a98d58e6a8_master.jpg"
                 alt="Item 5">
            <div class="discount-badge">-50%</div>
            <p class="price">₫9.000</p>
            <p class="status">ĐANG BÁN CHẠY</p>
        </div>
        <div class="sale-item">
            <img src="https://giaydino.com/wp-content/uploads/2021/02/Giay-Nike-Air-Jordan-1-Low-Black-Toe-Do-Den-1.jpg"
                 alt="Item 6">
            <div class="discount-badge">-41%</div>
            <p class="price">₫342.000</p>
            <p class="status">ĐANG BÁN CHẠY</p>
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
</div>
<script src="${pageContext.request.contextPath}/views/js/main.js"></script>
<script src="${pageContext.request.contextPath}/views/js/slide.js"></script>
<script src="${pageContext.request.contextPath}/views/js/page_product.js"></script>
<script src="https://uhchat.net/code.php?f=fbba65"></script>
</body>

</html>