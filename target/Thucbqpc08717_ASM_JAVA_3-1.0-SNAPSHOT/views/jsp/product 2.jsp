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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product</title>
    <script src="https://kit.fontawesome.com/27e6f9e8b6.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/slide.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/27e6f9e8b6.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <style>
        /* Table styles */
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th,
        .table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .table thead th {
            background-color: #f2f2f2;

        }
        .table img {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
        .formatted-price {
            font-weight: bold;
        }
    </style>
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

    <div class="category-container">
        <h2 id="helloText" onplay="startRainbowText()">DANH MỤC</h2>
        <div class="category-grid">
            <c:forEach items="${category}" var="cate">
                <div class="category-item">
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/assets/img/${cate.name}.jpg"
                             alt="Giày">
                        <p>${cate.name}</p>
                    </a>
                </div>
            </c:forEach>

        </div>
    </div>
    <div class="container">
        <div class="row">
            <c:forEach items="${list}" var="product">
                <div class="col-md-3 mb-4">
                    <a href="product/detail?id=${product.idProduct}" class="text-decoration-none">
                        <div class="card product-card h-100 shadow-sm">
                            <img src="${pageContext.request.contextPath}/assets/img/${product.image.nameImage}" class="card-img-top img-fluid" alt="${product.name}">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${product.name}</h5>
                                <p class="card-text text-danger">Giá bán <span class="formatted-price">${product.price}</span></p>
                                <p class="card-text text-muted">Số lượng ${product.quantity}</p>
                                <div class="mt-auto">
                                    <button class="btn btn-outline-warning w-100 mb-2" data-idCart="idCart">Thêm giỏ hàng</button>
                                    <button class="btn btn-warning w-100">Mua Ngay</button>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="page-action">
        <ul class="listPage">
        </ul>
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
<script>
    document.querySelectorAll('.formatted-price').forEach(el => {
        const amount = el.textContent;
        el.textContent = formatCurrencyVND(amount);
    });

    function formatCurrencyVND(amount) {
        return new Intl.NumberFormat('vi-VN').format(amount) + ' VND';
    }
</script>



</body>

</html>