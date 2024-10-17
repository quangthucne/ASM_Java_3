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
    timeout = setTimeout(showSlides, 1500);
}