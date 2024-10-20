<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 19/10/24
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>${product == null ? 'Thêm sản phẩm': 'Chỉnh sửa sản phẩm'}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container mt-5">
    <h1 class="text-center">Quản lý sản phẩm</h1>
    <c:choose>
        <c:when test="${product == null}">
            <!-- Add Product Card -->
            <div class="card mb-4">
                <div class="card-header">
                    <h5>Thêm sản phẩm</h5>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/product-manage" method="post"
                          enctype="multipart/form-data">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="productName" placeholder="Tên sản phẩm">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="shortDesc" placeholder="Mô tả ngắn">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="detail" placeholder="Mô tả chi tiết">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="quantity" placeholder="Số lượng">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="productPrice" placeholder="Giá">
                        </div>
                        <div class="mb-3">
                            <input type="file" name="image" accept="image/png" placeholder="Hình ảnh sản phẩm" multiple>
                        </div>
                        <input type="number" value="1" hidden name="statusProduct">
                        <input type="text" hidden name="typeActive" value="add">
                        <div class="mb-3">
                            <label for="productCategory" class="form-label">Category</label>
                            <select class="form-select" id="productCategory" name="productCategory">
                                <option value="-1">-- Chọn danh mục sản phẩm --</option>
                                <c:forEach items="${categoryList}" var="cate">
                                    <option value="${cate.idCategory}">${cate.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                    </form>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- Edit Product Card -->
            <div class="card">
                <div class="card-header">
                    <h5>Edit Product</h5>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/product-manage" method="post"
                          enctype="multipart/form-data">
                        <input type="hidden" name="productId" id="productId" value="${product.idProduct}">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="productName" id="productName"
                                   placeholder="Tên sản phẩm" value="${product.name}">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="shortDesc" id="editShortDesc"
                                   placeholder="Mô tả ngắn" value="${product.shortDesc}">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="detail" id="editDetail" placeholder="Mô tả" value="${product.detail}">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="productPrice" id="editProductPrice"
                                   placeholder="Giá" value="${product.price}">
                        </div>
                        <div class="mb-3">
                            <input type="file" name="image" accept="image/png" placeholder="Hình ảnh sản phẩm" multiple>
                        </div>
                        <div class="mb-3">
                            <label for="editStatusProduct" class="form-label">Status</label>
                            <select class="form-select" id="editStatusProduct" name="statusProduct">
                                <option value="1">Đang bán</option>
                                <option value="0">Ngừng bán</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="editProductCategory" class="form-label">Category</label>
                            <select class="form-select" id="editProductCategory" name="productCategory">
                                <c:forEach items="${categoryList}" var="cate">
                                    <option value="${cate.idCategory}">${cate.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="text" hidden name="idProduct">
                        <input type="text" hidden name="typeActive" value="edit">
                        <button type="submit" class="btn btn-primary">Chỉnh sửa</button>
                    </form>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Add error messages dynamically
        function setErrorMessage(element, message) {
            let errorElement = element.nextElementSibling;
            if (!errorElement || !errorElement.classList.contains("error-message")) {
                errorElement = document.createElement("div");
                errorElement.classList.add("error-message", "text-danger");
                element.parentNode.appendChild(errorElement);
            }
            errorElement.textContent = message;
        }

        function clearErrorMessage(element) {
            const errorElement = element.nextElementSibling;
            if (errorElement && errorElement.classList.contains("error-message")) {
                errorElement.textContent = "";
            }
        }

        function validateForm(form) {
            let isValid = true;
            const noSpaceNumberRegex = /^[0-9]+$/;

            // Get form values
            const productName = form.querySelector('input[name="productName"]');
            const shortDesc = form.querySelector('input[name="shortDesc"]');
            const detail = form.querySelector('input[name="detail"]');
            const quantity = form.querySelector('input[name="quantity"]');
            const productPrice = form.querySelector('input[name="productPrice"]');
            const image = form.querySelector('input[name="image"]');

            // Validate productName
            if (productName && productName.value.trim() === "") {
                setErrorMessage(productName, "Chưa nhập tên sản phẩm.");
                isValid = false;
            } else {
                clearErrorMessage(productName);
            }

            // Validate shortDesc
            if (shortDesc && shortDesc.value.trim() === "") {
                setErrorMessage(shortDesc, "Chưa nhập mô tả ngắn.");
                isValid = false;
            } else {
                clearErrorMessage(shortDesc);
            }

            // Validate detail
            if (detail && detail.value.trim() === "") {
                setErrorMessage(detail, "Chưa nhập mô tả chi tiết.");
                isValid = false;
            } else {
                clearErrorMessage(detail);
            }

            if (quantity.value.trim() === "") {
                setErrorMessage(quantity, "Chưa nhập số lượng.");
                isValid = false;
            } else if (!noSpaceNumberRegex.test(quantity.value)) {
                setErrorMessage(quantity, "Số lượng phải là số và không được chứa dấu cách.");
                isValid = false;
            } else if (quantity && ( isNaN(quantity.value) || quantity.value <= 0)) {
                setErrorMessage(quantity, "Số lượng phải là số dương và lớn hơn 0.");
                isValid = false;
            } else {
                clearErrorMessage(quantity);
            }

            if (productPrice.value.trim() === ""){
                setErrorMessage(quantity, "Chưa nhập giá");
                isValid = false;
            } else if (!noSpaceNumberRegex.test(productPrice.value)) {
                setErrorMessage(productPrice, "Giá phải là số và không được chứa dấu cách.");
                isValid = false;
            } else if (productPrice && (isNaN(productPrice.value) || productPrice.value <= 0)) {
                setErrorMessage(productPrice, "Giá phải là số dương và lớn hơn 0.");
                isValid = false;
            } else {
                clearErrorMessage(productPrice);
            }
            if (productCategory && productCategory.value === "-1") {
                setErrorMessage(productCategory, "Vui lòng chọn danh mục sản phẩm.");
                isValid = false;
            } else {
                clearErrorMessage(productCategory);
            }

            // Validate image (only for the Add Product form)
            if (image && form.querySelector('input[name="typeActive"]').value === "add" && image.files.length === 0) {
                setErrorMessage(image, "Vui lòng chọn một hình ảnh.");
                isValid = false;
            } else {
                clearErrorMessage(image);
            }

            return isValid;
        }

        // Add validation for Add Product Form
        const addProductForm = document.querySelector('form[action*="product-manage"][method="post"][enctype="multipart/form-data"]');
        addProductForm.addEventListener("submit", function (event) {
            if (!validateForm(addProductForm)) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });

        // Add validation for Edit Product Form
        const editProductForm = document.querySelector('form[action*="product-manage"][method="post"][enctype="multipart/form-data"]:not([hidden])');
        editProductForm.addEventListener("submit", function (event) {
            if (!validateForm(editProductForm)) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
    });
</script>

</script>
</body>

</html>