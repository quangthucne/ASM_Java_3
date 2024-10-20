let slideIndex = 0;
let isVali = false;
showSlides();

function showSlides() {
    let slides = document.getElementsByClassName("mySlides");
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1;
    }
    slides[slideIndex - 1].style.display = "block";
    setTimeout(showSlides, 3000); // Thay đổi ảnh sau mỗi 3 giây
}

function changeSlide(n) {
    slideIndex += n;
    let slides = document.getElementsByClassName("mySlides");
    if (slideIndex > slides.length) {
        slideIndex = 1;
    }
    if (slideIndex < 1) {
        slideIndex = slides.length;
    }
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex - 1].style.display = "block";
    clearTimeout(timeout);
    timeout = setTimeout(showSlides, 1500); // Khởi động lại thời gian tự động chuyển ảnh
}



// Initial calculation on page load
document.addEventListener("DOMContentLoaded", calculateTotalOrder);

//chi tiet sam phẩm
function showDetails(name, image, price, description) {
    document.getElementById("detail-name").innerText = name;
    document.getElementById("detail-image").src = image;
    document.getElementById("detail-price").innerText = price;
    document.getElementById("detail-description").innerText = description;
    document.getElementById("product-details").style.display = "block";
}

function closeDetails() {
    document.getElementById("product-details").style.display = "none";
}
function showProduct() {
    document.querySelectorAll(".product-card").forEach((card) => {
        card.addEventListener("click", function () {
            const name = this.querySelector(".product-name").innerText;
            const image = this.querySelector("img").src;
            const price = this.querySelector(".current-price").innerText;
            const description = "Mô tả sản phẩm"; // Bạn có thể thêm mô tả chi tiết hơn nếu có
            showDetails(name, image, price, description);
        });
    });
}

// biến vào giỏ hàng

// Lấy các nút "Thêm giỏ hàng"
const addToCartButtons = document.querySelectorAll(".them-gio-hang");

addToCartButtons.forEach((button) => {
    button.addEventListener("click", function (event) {
        const productImage = event.target
            .closest(".product-card")
            .querySelector("img")
            .cloneNode();
        productImage.classList.add("flying-product");

        const buttonRect = button.getBoundingClientRect();
        const cartIcon = document.getElementById("giohang");
        const cartRect = cartIcon.getBoundingClientRect();
        console.log(cartRect);
        // Đặt vị trí ban đầu của ảnh sản phẩm bay
        productImage.style.top = buttonRect.top + "px";
        productImage.style.left = buttonRect.left + "px";
        document.body.appendChild(productImage);

        // Tạo hiệu ứng bay
        setTimeout(() => {
            productImage.style.top = cartRect.top + "px";
            productImage.style.left = cartRect.left + "px";
            productImage.style.transform = "scale(0.2)"; // Thu nhỏ ảnh khi đến giỏ hàng
        }, 0);

        // Xóa ảnh sản phẩm bay sau khi hiệu ứng kết thúc
        setTimeout(() => {
            productImage.remove();
        }, 1500); // Thời gian hiệu ứng (0.5 giây)
    });
});

const textElement = document.getElementById("helloText");
const colors = ["red", "yellow"];
let currentColorIndex = 0;

setInterval(() => {
    textElement.style.color = colors[currentColorIndex];
    currentColorIndex = (currentColorIndex + 1) % colors.length;
}, 500);

const textElement2 = document.getElementById("textSale");
const colors2 = ["red", "yellow"];
let currentColorIndex2 = 0;

setInterval(() => {
    textElement2.style.color = color2[currentColorIndex2];
    currentColorIndex2 = (currentColorIndex2 + 1) % colors2.length;
}, 500);


