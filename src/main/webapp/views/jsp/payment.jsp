<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 29/9/24
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thanh toán</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/payment.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/style.css">
    <script src="https://kit.fontawesome.com/27e6f9e8b6.js" crossorigin="anonymous"></script>


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
<div id="warper">
    <div class="info">
        <div class="billing-info">
            <form action="">

                <div class="title-info">
                    <h3 style="margin-bottom: 10px;">THÔNG TIN THANH TOÁN</h3>

                </div>
                <div class="input-name">
                    <span>Họ và tên</span> <span class="star">(*)</span>
                    <input type="text" placeholder="">
                </div>
                <div class="input-address">
                    <div class="input-payment">
                        <span>Số điện thoại</span> <span class="star">(*)</span>
                        <input type="text" placeholder="">
                        <br>
                        <br>
                        <br>
                        <span>Tỉnh/Thành phố</span> <span class="star">(*)</span>
                        <select name="" id="city" placeholder="Chọn Tỉnh/Thành Phố">
                            <option value="">Chọn Tỉnh/Thành Phố</option>
                        </select>
                        <br>
                        <br>
                        <br>
                        <span>Xã/Phường/Thị trấn</span> <span class="star">(*)</span>
                        <select name="" id="ward" placeholder="Chọn Quận/Huyện">
                            <option value="">Chọn Quận/Huyện</option>
                        </select>
                    </div>
                    <div class="input-payment2">

                    </div>
                    <div class="input-payment">
                        <span>Địa chỉ Email</span> <span class="star">(*)</span>
                        <input type="text" placeholder="">
                        <br>
                        <br>
                        <br>
                        <span>Quận/Huyện</span> <span class="star">(*)</span>
                        <select name="" id="district" placeholder="Chọn Xã/Phường/Thị trấn">
                            <option value="">Chọn Xã/Phường/Thị trấn </option>
                        </select>
                        <br>
                        <br>
                        <br>
                        <span>Địa chỉ</span> <span class="star">(*)</span>
                        <input type="text" placeholder="Số nhà, đường...">
                    </div>
                </div>
                <br>
                <br>
                <div class="add">
                    <span>Ghi chú đơn hàng (tùy chọn)</span>
                    <textarea name="" id=""
                              placeholder="Ghi chú về đơn hàng, ví dụ: thời gian chi tiết và địa chỉ chi tiết hơn "></textarea>
                </div>
        </div>

        </form>
        <div class="oder-info">
            <br>
            <div class="s1">
                <div class="title-oder">
                    <h3>ĐƠN HÀNG CỦA BẠN</h3>
                    <br>
                    <table class="tb-pay">
                        <tr>
                            <td>Sản phẩm</td>
                            <td>
                                <div>Tạm tính</div>
                            </td>
                        </tr>
                        <tr>
                            <td>Tên sản phẩm</td>

                            <td>
                                <div id="" style="color: red;"><select id="myCombobox">
                                    <option value="" disabled selected>Danh sách tên sản phẩm</option>
                                </select></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Khuyến mãi</td>
                            <td>
                                <div style="color: red;">0</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;">Tổng</td>
                            <td>
                                <div style="color: red;">Số tiền</div>
                            </td>
                        </tr>
                    </table>
                    <div class="ck">
                        <p><input type="radio" name="bank" value="1" id="bank"> Chuyển khoản ngân hàng</p>
                        <!-- <br> -->
                        <p><input type="radio" name="bank" value="3" id="live"> Thanh toán khi nhận hàng</p>
                    </div>
                    <div class="text-btn">
                        <p>Dữ liệu cá nhân của bạn sẽ được sử dụng để sử lý đơn hàng của bạn, hổ trợ trải nghiêm của
                            bạn trên toàn bộ trang web này và cho các mục đích khác được mô tả trong <span>chính
                                    sách riêng</span> của chúng tôi.</p>
                        <br>
                    </div>
                    <div class="btn">

                        <button onclick="clickradio()">ĐẶT HÀNG</button>

                    </div>
                    <br>


                </div>
            </div>

        </div>
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
<script src="${pageContext.request.contextPath}/views/js/payment.js"></script>
</body>
</html>
