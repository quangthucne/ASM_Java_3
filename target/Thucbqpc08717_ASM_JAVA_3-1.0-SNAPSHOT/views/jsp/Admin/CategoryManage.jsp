<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 9/10/24
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Manage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/27e6f9e8b6.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/Admin.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="wrapper">
            <aside id="sidebar">
                <div class="d-flex">
                    <button class="toggle-btn" type="button">
                        <i class="lni lni-grid-alt"></i>
                    </button>
                    <div class="sidebar-logo">
                        <a href="#">Dino Store</a>
                    </div>
                </div>

                <ul class="sidebar-nav">
                    <li class="sidebar-item">
                        <a href="admin.html" class="sidebar-link">
                            <i class="fa-solid fa-gauge"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="MyStore.html" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                           data-bs-target="#subMenu" aria-expanded="false" aria-controls="subMenu">
                            <i class="fa-solid fa-store"></i>
                            <span>My store</span>
                        </a>
                        <ul id="subMenu" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li>
                                <a href="product-manage" class="sidebar-link ms-3">
                                    <i class="fa-solid fa-box"></i>
                                    <span>Product</span>
                                </a>
                            </li>
                            <li>
                                <a href="category-manage" class="sidebar-link ms-3">
                                    <i class="fa-solid fa-tags"></i>
                                    <span>Category</span>
                                </a>
                            </li>
                            <li>
                                <a href="order-manage" class="sidebar-link ms-3">
                                    <i class="fa-solid fa-shopping-cart"></i>
                                    <span>Order</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <a href="user-manage" class="sidebar-link">
                            <i class="fa-solid fa-people-group"></i>
                            <span>User</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="fa-solid fa-gear"></i>
                            <span>Setting</span>
                        </a>
                    </li>
                </ul>
                <div class="sidebar-footer">
                    <a href="#" class="sidebar-link">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <span>Log out</span>
                    </a>
                </div>
            </aside>
            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-5">
                <div
                        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">My store</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group me-2">
                            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
                        </div>
                        <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                            <i class="bi bi-calendar"></i> This week
                        </button>
                    </div>
                </div>

                <div class="container-fluid mt-5">
                    <h2 class="text-center">Thống kê danh mục bán chạy</h2>
                    <canvas id="topProductsChart" width="400" height="200"></canvas>
                </div>


                <section id="product-management" class="mb-5">
                    <h2>Category Management</h2>

                    <button class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#addProductModal">Add New Category</button>
                    <table class="table table-striped" id="myTable">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${categoryList}" var="cate" varStatus="vs">
                                <tr>
                                    <td>${vs.count}</td>
                                    <td>${cate.name}</td>
                                    <td style="color: ${cate.status == 1 ?'green': 'red'};">${cate.status == 1 ? 'Đang kinh doanh':'Ngưng kinh doanh'}</td>
                                    <td style="display: flex; justify-content: center; align-items: center;">
                                        <a href="#" class="btn btn-sm btn-warning edit-btn" data-id="${cate.idCategory}" data-name="${cate.name}" data-bs-toggle="modal" data-bs-target="#editCategoryModal">
                                            Edit
                                        </a>
                                        <button type="button" class="btn btn-sm btn-danger delete-btn" data-id="${cate.idCategory}" style="margin-left: 15px;">Delete</button>
                                    </td>

                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>
                </section>
            </main>
        </div>
    </div>
</div>

<!-- Modals for Adding Product and Category -->

<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add New Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/category-manage" method="post">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="categoryName" placeholder="Category name" required>
                        <input type="number" value="1" name="categoryStatus" hidden="hidden">
                        <input type="text" value="add" hidden="hidden" name="typeActive">
                    </div>
                    <button type="submit" class="btn btn-primary">Add Category</button>
                </form>
            </div>
        </div>
    </div>
</div>

<%--    Chỉnh sửa category--%>
<!-- Edit Category Modal -->
<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCategoryModalLabel">Edit Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/category-manage" method="post">
                    <input type="text" name="typeActive" value="edit" hidden="hidden">
                    <input type="text" name="categoryId" hidden="hidden">
                    <div class="mb-3">
                        <input type="text" placeholder="Category name" class="form-control" name="categoryName" required>
                    </div>
                    <div class="mb-3">
                        <select class="form-control" id="categoryStatus" name="categoryStatus">
                            <option value="-1">-Select Status-</option>
                            <option value="1">Đang kinh doanh</option>
                            <option value="0">Ngưng kinh doanh</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
</div>
</main>
</div>




</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/views/js/Admin.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const ctx = document.getElementById("topProductsChart").getContext("2d");

        // Dữ liệu ví dụ về tên sản phẩm và số lượng bán
        const productNames = ["Iphone 14", "Samsung s23"];
        const salesData = [150, 100]; // số lượng bán của mỗi sản phẩm

        // Tạo biểu đồ thanh
        const topProductsChart = new Chart(ctx, {
            type: "bar",
            data: {
                labels: productNames,
                datasets: [
                    {
                        label: "Số lượng bán",
                        data: salesData,
                        backgroundColor: "rgba(54, 162, 235, 0.6)", // màu nền thanh biểu đồ
                        borderColor: "rgba(54, 162, 235, 1)", // màu viền thanh biểu đồ
                        borderWidth: 1,
                    },
                ],
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: "Số lượng",
                        },
                    },
                    x: {
                        title: {
                            display: true,
                            text: "Tên sản phẩm",
                        },
                    },
                },
            },
        });
    });

    document.addEventListener("DOMContentLoaded", function () {
        const editButtons = document.querySelectorAll(".edit-btn");
        const categoryIdInput = document.querySelector("#editCategoryModal input[name='categoryId']");
        const categoryNameInput = document.querySelector("#editCategoryModal input[name='categoryName']");
        const categoryStatusSelect = document.querySelector("#editCategoryModal select[name='categoryStatus']");

        editButtons.forEach(button => {
            button.addEventListener("click", function (event) {
                event.preventDefault(); // Ngăn không tải lại trang

                // Lấy giá trị id từ thuộc tính data-id
                const categoryId = this.getAttribute("data-id");
                const categoryName = this.getAttribute("data-name")
                categoryIdInput.value = categoryId;
                categoryNameInput.value = categoryName;

                // Gửi request đến server để lấy chi tiết category
                fetch(`${pageContext.request.contextPath}/getIdCategory?id=${categoryId}`)
                    .then(response => response.json())
                    .then(data => {
                        // Cập nhật các trường trong form modal
                        console.log(data.name)
                        categoryNameInput.value = data.name;
                        categoryStatusSelect.value = data.status;
                    })
                    .catch(error => console.error("Error fetching category details:", error));

                // Hiển thị modal chỉnh sửa
                const editCategoryModal = new bootstrap.Modal(document.getElementById("editCategoryModal"));
                editCategoryModal.show();
            });
        });
    });

    document.addEventListener("DOMContentLoaded", function () {
        const deleteButtons = document.querySelectorAll(".delete-btn");

        deleteButtons.forEach(button => {
            button.addEventListener("click", function (event) {
                event.preventDefault(); // Ngăn không tải lại trang

                const categoryId = this.getAttribute("data-id");
                const confirmation = confirm("Bạn chắc chắn xóa danh mục này chứ?");
                if (confirmation) {
                    // Gửi yêu cầu xóa đến server
                    fetch(`${pageContext.request.contextPath}/category-manage`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: new URLSearchParams({
                            'categoryId': categoryId,
                            'typeActive': 'delete'
                        })
                    })
                        .then(response => {
                            if (response.ok) {
                                // Xóa dòng tương ứng khỏi bảng
                                this.closest('tr').remove(); // Xóa hàng bảng
                            } else {
                                alert("Error deleting category.");
                            }
                        })
                        .catch(error => console.error("Error deleting category:", error));
                }
            });
        });
    });



</script>
<script>
    $(document).ready(function() {
        $('#myTable').DataTable({
            paging: true,
            ordering: true,
            info: true,
            language: {
                url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
            }
        });
    });
</script>

</body>

</html>
