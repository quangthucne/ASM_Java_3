



    const products = [];
    const productsPerPage = 8; // Số sản phẩm trên mỗi trang
    let currentPage = 1; // Trang hiện tại

    // Hàm lấy dữ liệu sản phẩm từ máy chủ (có thể thay đổi theo cách bạn lấy dữ liệu)
    async function fetchProducts() {
    try {
    const response = await fetch('/api/products'); // Thay đổi đường dẫn API theo yêu cầu của bạn
    const data = await response.json();
    products.push(...data); // Thêm tất cả sản phẩm vào mảng
    renderProducts();
    renderPagination();
} catch (error) {
    console.error('Error fetching products:', error);
}
}

    // Hàm hiển thị sản phẩm cho trang hiện tại
    function renderProducts() {
    const start = (currentPage - 1) * productsPerPage;
    const end = Math.min(start + productsPerPage, products.length);
    const productList = document.getElementById('product-list');
    productList.innerHTML = ''; // Xóa danh sách sản phẩm hiện tại

    for (let i = start; i < end; i++) {
    const product = products[i];
    const productCard = `
                <div class="col-md-3 mb-4">
                    <div class="card product-card h-100 shadow-sm">
                        <img src="${product.image}" class="card-img-top img-fluid" alt="${product.name}">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text text-danger">Giá bán <span class="formatted-price">${formatCurrencyVND(product.price)}</span></p>
                            <p class="card-text text-muted">Số lượng ${product.quantity}</p>
                            <div class="mt-auto">
                                <button class="btn btn-outline-warning w-100 mb-2" data-idCart="idCart">Thêm giỏ hàng</button>
                                <button class="btn btn-warning w-100">Mua Ngay</button>
                            </div>
                        </div>
                    </div>
                </div>`;
    productList.innerHTML += productCard;
}
}

    // Hàm hiển thị phân trang
    function renderPagination() {
    const paginationList = document.getElementById('pagination');
    paginationList.innerHTML = ''; // Xóa danh sách phân trang hiện tại
    const totalPages = Math.ceil(products.length / productsPerPage);

    if (currentPage > 1) {
    paginationList.innerHTML += `<li><a href="#" onclick="changePage(${currentPage - 1})">« Previous</a></li>`;
}

    for (let i = 1; i <= totalPages; i++) {
    paginationList.innerHTML += `
                <li><a href="#" onclick="changePage(${i})" class="${i == currentPage ? 'active' : ''}">${i}</a></li>`;
}

    if (currentPage < totalPages) {
    paginationList.innerHTML += `<li><a href="#" onclick="changePage(${currentPage + 1})">Next »</a></li>`;
}
}

    // Hàm thay đổi trang
    function changePage(page) {
    currentPage = page;
    renderProducts(); // Hiển thị lại sản phẩm cho trang mới
    renderPagination(); // Cập nhật phân trang
}


    // Khởi động ứng dụng
    fetchProducts();
