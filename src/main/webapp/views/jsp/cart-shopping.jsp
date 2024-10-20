<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <table id="myTable" class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>STT</th>
                <th>SẢN PHẨM</th>
                <th>ĐƠN GIÁ</th>
                <th>SỐ LƯỢNG</th>
                <th>THÀNH TIỀN</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cartDetail}" var="cart" varStatus="vs">
                    <c:forEach items="${cart.productModelList}" var="pro">
                        <tr>
                            <td>${vs.count}</td>
                            <td class="info-produce">
                                <img src="${pageContext.request.contextPath}/assets/img/${pro.image.nameImage}"
                                     alt="${pro.name}" style="width:50px;">
                                <p>${pro.name}</p>
                            </td>
                            <td class="price" ><span class="formatted-price">${pro.price}</span></td>
                            <td class="quantity">
                                <button onclick="updateQuantity(this, -1)">-</button>
                                <input type="text" class="quantity-input" value="${cart.quantityProduct}" />
                                <button onclick="updateQuantity(this, 1)">+</button>
                            </td>
                            <td class="total">0đ</td>

                        </tr>
                    </c:forEach>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="total-order">
        <div class="total-order-content">
            <h3>Tổng đơn hàng: <span id="order-total"> VND </span></h3>
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
<script>

    $(document).ready(function() {
        const table = $('#myTable').DataTable({
            paging: true,
            ordering: true,
            info: true,
            language: {
                url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
            },
            columnDefs: [
                {
                    targets: 4, // Assuming index 4 is the "Thành Tiền" column
                    render: function(data, type, row, meta) {
                        const price = parseFloat(row[2].replace(/\./g, "").replace(" VNĐ", "").trim());
                        const quantity = parseInt(row[3]);
                        const total = price * quantity;

                        // Format and return total with currency
                        return total.toLocaleString('vi-VN') + "VND";
                    }
                }
            ]
        });

        // Initialize total prices on page load
        $('#myTable tbody tr').each(function() {
            const tr = $(this);
            const price = parseFloat(tr.find('.price').text().replace(/\./g, "").replace(" VNĐ", "").trim());
            const quantity = parseInt(tr.find('.quantity-input').val());
            const total = price * quantity;
            tr.find('.total').text(total.toLocaleString('vi-VN') + "VND");
        });
    });




    function updateQuantity(button, change) {
        const input = button.parentElement.querySelector('.quantity-input');
        let quantity = parseInt(input.value);
        quantity += change;

        if (quantity < 0) {
            quantity = 0;
        }

        input.value = quantity;

        const row = button.closest('tr');
        const priceText = row.querySelector('.price').textContent;

        // Parse the price correctly (ensure you're removing currency format)
        const price = parseFloat(priceText.replace(/\./g, "").replace(" VNĐ", "").trim());

        const total = price * quantity;

        const totalCell = row.querySelector('.total');
        // Format total correctly with thousands separator and currency
        totalCell.textContent = total.toLocaleString('vi-VN') + "VND";

        updateOrderTotal();
    }



    function updateOrderTotal() {
        let grandTotal = 0;
        document.querySelectorAll('.total').forEach(totalCell => {
            const totalText = totalCell.textContent;
            const totalValue = parseFloat(totalText.replace("VND", "").replace(/\./g, "").replace(",", "").trim());
            grandTotal += totalValue;
        });


        grandTotal = grandTotal;

        document.getElementById('order-total').textContent = grandTotal.toLocaleString('vi-VN') + " VND"; // Update grand total
    }




</script>
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
