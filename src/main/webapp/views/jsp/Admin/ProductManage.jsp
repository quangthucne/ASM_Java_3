<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 9/10/24
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Manage</title>
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
<div class="container-fluid">
  <div class="row">
    <div class="wrapper">
      <aside id="sidebar">
        <div class="d-flex">
          <button class="toggle-btn" type="button">
            <i class="lni lni-grid-alt"></i>
          </button>
          <div class="sidebar-logo">
            <a href="#">Dino store</a>
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
          <h2 class="text-center">Thống kê sản phẩm bán chạy</h2>
          <canvas id="topProductsChart" width="400" height="200"></canvas>
        </div>


        <section id="product-management" class="mb-5">
          <h2>Product Management</h2>
          <button class="btn btn-primary mb-3" data-bs-toggle="modal"
                  data-bs-target="#addProductModal">Add New Product</button>
          <table id="myTable" class="table table-striped table-bordered">
            <thead>
            <tr>
              <th>STT</th>
              <th>Image</th>
              <th>Name</th>
              <th>Short desception</th>
              <th>Price</th>
              <th>Quantity</th>
              <td>Status</td>
              <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productList}" var="pro" varStatus="vs">
              <tr>
                <td>${vs.count}</td>
                <td style="margin: 0 auto"><img src="${pageContext.request.contextPath}/assets/img/${pro.image.nameImage}" alt="" style="width: 40px; height: 40px"></td>
                <td>${pro.name}</td>
                <td>${pro.shortDesc}</td>
                <td><span class="formatted-price">${pro.price}</span></td>
                <td>${pro.quantity}</td>
                <td style="color: ${pro.status == 1 ? 'green':'red'};">${pro.status == 1 ? 'Đang bán':'Ngừng bán'}</td>
                <td>
                  <a href="#" class="btn btn-sm btn-warning edit-btn" data-id="${pro.idProduct}" data-name="${pro.name}" data-shortDesc="${pro.shortDesc}" data-price="${pro.price}" data-detail="${pro.detail}" data-status="${pro.status}" data-category="${pro.idCategory}" data-bs-toggle="modal" data-bs-target="#editProductModal">
                    Edit
                  </a>
                  <button type="button" class="btn btn-sm btn-danger delete-btn" data-id="${pro.idProduct}" style="margin-left: 15px;">Delete</button>
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
<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel"
     aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath}/product-manage" method="post" enctype="multipart/form-data">
          <div class="mb-3">
            <input type="text" class="form-control" name="productName" placeholder="Product name" required>
          </div>
          <div class="mb-3">
            <input type="text" class="form-control" name="shortDesc" placeholder="Short desception" required>
          </div>
          <div class="mb-3">
            <input type="text" class="form-control" name="detail" placeholder="Detail" required>
          </div>
          <div class="mb-3">
            <input type="number" class="form-control" name="quantity" placeholder="Quantity" required>
          </div>
          <div class="mb-3">
            <input type="number" class="form-control" id="productPrice" name="productPrice" placeholder="Price" required>
          </div>
          <div class="mb-3">
            <input type="file" name="image" id="img" accept="png" multiple>
          </div>
          <input type="number" value="1" hidden="hidden" name="statusProduct">
          <input type="text" hidden="hidden" name="typeActive" value="add">
          <div class="mb-3">
            <label for="productCategory" class="form-label">Category</label>
            <select class="form-select" id="productCategory" name="productCategory" required>
              <c:forEach items="${categoryList}" var="cate">
                <option value="${cate.idCategory}">${cate.name}</option>
              </c:forEach>
            </select>
          </div>

          <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
      </div>
    </div>
  </div>
</div>

<%--Edit Product Model--%>
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath}/product-manage" method="post" enctype="multipart/form-data">
          <input type="hidden" name="productId" id="productId">

          <div class="mb-3">
            <input type="text" class="form-control" name="productName" id="productName" placeholder="Product name" required>
          </div>
          <div class="mb-3">
            <input type="text" class="form-control" name="shortDesc" id="editShortDesc" placeholder="Short description" required>
          </div>
          <div class="mb-3">
            <input type="text" class="form-control" name="detail" id="editDetail" placeholder="Detail" required>
          </div>
          <div class="mb-3">
            <input type="number" class="form-control" name="productPrice" id="editProductPrice" placeholder="Price" required>
          </div>
          <div class="mb-3">
            <input type="file" name="image" id="img" accept="png" multiple>
          </div>
          <div class="mb-3">
            <label for="editStatusProduct" class="form-label">Status</label>
            <select class="form-select" id="editStatusProduct" name="statusProduct" required>
              <option value="1">Đang bán</option>
              <option value="0">Ngừng bán</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="editProductCategory" class="form-label">Category</label>
            <select class="form-select" id="editProductCategory" name="productCategory" required>
              <c:forEach items="${categoryList}" var="cate">
                <option value="${cate.idCategory}">${cate.name}</option>
              </c:forEach>
            </select>
          </div>
          <input type="text" hidden="hidden" name="idProduct" >
          <input type="text" hidden="hidden" name="typeActive" value="edit">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/views/js/Admin.js"></script>

<!-- data chart product -->
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

  document.querySelectorAll('.edit-btn').forEach(button => {
    button.addEventListener('click', function () {
      const productId = this.getAttribute('data-id');
      const productName = this.getAttribute('data-name');
      const shortDesc = this.getAttribute('data-shortdesc');
      const detail = this.getAttribute('data-detail');
      const price = this.getAttribute('data-price');
      const quantity = this.getAttribute('data-quantity');
      const status = this.getAttribute('data-status');
      const categoryId = this.getAttribute("data-category")

      // Gán giá trị vào modal
      document.getElementById('editProductId').value = productId;
      document.getElementById('editProductName').value = productName;
      document.getElementById('editShortDesc').value = shortDesc;
      document.getElementById('editDetail').value = detail;
      document.getElementById('editQuantity').value = quantity;
      document.getElementById('editProductPrice').value = price;
      document.getElementById('editStatusProduct').value = status;
      document.getElementById('editCategoryModal').value = categoryId;
    });
  });

  document.addEventListener("DOMContentLoaded", function () {
    // Select all edit buttons
    const editButtons = document.querySelectorAll('.edit-btn');

    // Attach click event listener to each edit button
    editButtons.forEach(button => {
      button.addEventListener('click', function (event) {
        event.preventDefault(); // Prevent the default behavior

        // Retrieve data attributes from the button
        const productId = this.getAttribute('data-id');
        const productName = this.getAttribute('data-name');
        const shortDesc = this.getAttribute('data-shortdesc');
        const detail = this.getAttribute('data-detail');
        const price = this.getAttribute('data-price');
        const quantity = this.getAttribute('data-quantity');
        const status = this.getAttribute('data-status');

        // Set the values in the edit form fields
        document.getElementById('productId').value = productId;
        document.getElementById('productName').value = productName;
        document.getElementById('editShortDesc').value = shortDesc;
        document.getElementById('editDetail').value = detail;
        document.getElementById('editProductPrice').value = price;
        document.getElementById('editStatusProduct').value = status;
        document.getElementById('editProductCategory').value = this.getAttribute('data-category');

        // Show the modal programmatically if required
        const editModal = new bootstrap.Modal(document.getElementById('editProductModal'));
        editModal.show();
      });
    });
  });

  document.addEventListener("DOMContentLoaded", function () {
    const deleteButtons = document.querySelectorAll(".delete-btn");

    deleteButtons.forEach(button => {
      button.addEventListener("click", function (event) {
        event.preventDefault();

        const productId = this.getAttribute("data-id");
        const confirmation = confirm("Bạn chắc chắn xóa sản phẩm này chứ?");
        if (confirmation) {
          // Gửi yêu cầu xóa đến server
          fetch(`${pageContext.request.contextPath}/product-manage`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
              'productId': productId,
              'typeActive': 'delete'
            })
          })
                  .then(response => {
                    if (response.ok) {
                      // Xóa dòng tương ứng khỏi bảng
                      this.closest('tr').remove(); // Xóa hàng bảng
                    } else {
                      alert("Xóa thất bại");
                    }
                  })
                  .catch(error => console.error("Error deleting category:", error));
        }
      });
    });
  });

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
