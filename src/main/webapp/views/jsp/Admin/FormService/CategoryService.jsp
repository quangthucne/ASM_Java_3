<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 19/10/24
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>${category == null ? 'Thêm danh mục' : 'Chỉnh sửa danh mục'}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/27e6f9e8b6.js" crossorigin="anonymous"></script>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/Admin.css">
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
                        <a href="#" class="sidebar-link">
                            <i class="fa-solid fa-chart-pie"></i>
                            <span>Analytics</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="fa-solid fa-message"></i>
                            <span>Message</span>
                        </a>
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
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Category</h1>
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
                <c:choose>
                    <c:when test="${category == null}">
                    <%--                Add category--%>
                        <div class="card-header px-md-2">
                            <h2>Thêm danh mục</h2>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/category-manage" method="post" onsubmit="return validateAddForm()">
                                    <div class="mb-3">
                                        <input type="text" class="form-control" name="categoryName" id="categoryNameAdd" placeholder="Tên danh mục">
                                        <input type="number" value="1" name="categoryStatus" hidden="hidden">
                                        <input type="text" value="add" hidden="hidden" name="typeActive">
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary ">Thêm danh mục</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                    <%--                Edit Category--%>
                        <div class="container mt-5">
                            <h2>Chỉnh sửa danh mục</h2>
                            <!-- Edit Category Form -->
                            <div class="card">
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/category-manage" method="post" onsubmit="return validateEditForm()">
                                        <!-- Hidden fields to identify the action and category -->
                                        <input type="text" name="typeActive" value="edit" hidden="hidden">
                                        <input type="text" name="categoryId" hidden="hidden" value="${category.idCategory}">

                                        <!-- Category Name Input -->
                                        <div class="mb-3">
                                            <label for="categoryNameEdit" class="form-label">Tên danh mục</label>
                                            <input type="text" id="categoryNameEdit" placeholder="Category name" class="form-control" name="categoryName"
                                                   value="${category.name}">
                                        </div>

                                        <!-- Category Status Dropdown -->
                                        <div class="mb-3">
                                            <label for="categoryStatusEdit" class="form-label">Trạng thái danh mục</label>
                                            <select class="form-control" id="categoryStatusEdit" name="categoryStatus">
                                                <option value="-1">-Chọn trạng thái-</option>
                                                <option value="1" ${category.status == 1 ? 'selected' : ''}>Đang kinh doanh</option>
                                                <option value="0" ${category.status == 0 ? 'selected' : ''}>Ngưng kinh doanh</option>
                                            </select>
                                        </div>

                                        <!-- Save Button -->
                                        <button type="submit" class="btn btn-primary w-100">Chỉnh sửa</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>


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
    function validateAddForm() {
        const categoryName = document.getElementById("categoryNameAdd").value.trim();
        let isValid = true;
        if (categoryName === "") {
            alert("Vui lòng nhập tên danh mục.");
            isValid = false
        }
        return isValid;
    }
    function validateEditForm() {
        const categoryName = document.getElementById("categoryNameEdit").value.trim();
        const categoryStatus = document.getElementById("categoryStatusEdit").value;
        let isValid = true;

        if (categoryName === "") {
            alert("Vui lòng nhập tên danh mục.");
            isValid = false;
        }
        if (categoryStatus === "-1") {
            alert("Vui lòng chọn trạng thái danh mục.");
            isValid = false;
        }
        return isValid;
    }
</script>
</body>
</html>