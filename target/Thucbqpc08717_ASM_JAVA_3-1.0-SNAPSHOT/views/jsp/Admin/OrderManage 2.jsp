<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 9/10/24
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Manage</title>
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

        <section id="product-management" class="mb-5">
          <h2>Order Management</h2>
          <table class="table table-striped" id="myTable">
            <thead>
            <tr>
              <th>STT</th>
              <th>Orderer</th>
              <th>Total</th>
              <td>Status</td>
              <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderList}" varStatus="vs" var="order">
            <tr>
              <td>
                ${vs.count}
              </td>
              <td>${order.userModel.fullName}</td>
              <td>${order.totalAmount} VND</td>
              <c:choose>
                <c:when test="${order.status == 1}"><td><span class="badge bg-success">Hoành thành</span></td></c:when>
                <c:when test="${order.status == 0}"><td><span class="badge bg-danger">Đã hủy</span></td></c:when>
                <c:when test="${order.status == 2}"><td><span class="badge bg-warning">Dang xử lý</span></td></c:when>
              </c:choose>
              <td>
                <button class="btn btn-sm btn-warning" title="Edit" data-bs-toggle="modal" data-bs-target="#editOrderModal" onclick="populateModal(${order.idOrder}, ${order.status})">
                  <i class="fa-solid fa-edit"></i>
                </button>
                <button class="btn btn-sm btn-info" title="View" data-bs-toggle="modal" data-bs-target="#viewOrderModal" onclick="showOrderDetails(${order.idOrder})">
                  <i class="fa-solid fa-eye"></i>
                </button>

              </td>
            </tr>
            </c:forEach>


            </tbody>
          </table>
        </section>



    </div>
  </div>



  </main>
</div>
<div class="modal fade" id="editOrderModal" tabindex="-1" aria-labelledby="editOrderModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editOrderModalLabel">Chỉnh sửa trạng thái đơn hàng</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="updateOrderForm" action="${pageContext.request.contextPath}/order-manage" method="post">
          <input type="hidden" id="orderId" name="orderId">
          <div class="mb-3">
            <label for="orderStatus" class="form-label">Trạng thái</label>
            <select class="form-select" id="orderStatus" name="status">
              <option value="2">Đang xử lý</option>
              <option value="1">Hoàn thành</option>
              <option value="0">Đã hủy</option>
            </select>
          </div>
          <button type="submit" class="btn btn-primary">Cập nhật</button>
        </form>
      </div>
    </div>
  </div>
</div>




</div>
</div>
<div class="modal fade" id="viewOrderModal" tabindex="-1" aria-labelledby="viewOrderModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="viewOrderModalLabel">Chi tiết đơn hàng</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p><strong>Orderer:</strong> <span id="viewOrderUser"></span></p>
        <p><strong>Date:</strong> <span id="viewDate"></span></p>
        <p><strong>Address:</strong> <span id="viewOrderAddress"></span></p>
        <p><strong>Product List:</strong></p>
        <ul id="viewOrderProductList">
          <!-- Danh sách sản phẩm sẽ được thêm ở đây -->
        </ul>
        <p><strong>Total Amount:</strong> <span id="viewOrderTotal"></span> VND</p>
        <p><strong>Status:</strong> <span id="viewOrderStatus"></span></p>
      </div>
    </div>
  </div>
</div>



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
<script>
  function populateModal(orderId, currentStatus) {
    document.getElementById('orderId').value = orderId;
    document.getElementById('orderStatus').value = currentStatus;
  }

  // Xử lý khi form được submit
  document.getElementById('updateOrderForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const orderId = document.getElementById('orderId').value;
    const status = document.getElementById('orderStatus').value;

    // Gửi yêu cầu AJAX để cập nhật trạng thái đơn hàng
    $.ajax({
      type: "POST",
      url: "${pageContext.request.contextPath}/order-manage",
      data: { orderId: orderId, status: status },
      success: function(response) {
        // Cập nhật lại bảng sau khi thay đổi
        location.reload();
      },
      error: function() {
        alert("Có lỗi xảy ra. Vui lòng thử lại!");
      }
    });
  });
</script>
<script>
  function fetchOrderDetails(orderId) {
    $.ajax({
      url: '${pageContext.request.contextPath}/order/api' + orderId, // Đường dẫn tới API để lấy thông tin đơn hàng
      method: 'GET',
      dataType: 'json',
      success: function(data) {
        openOrderModal(data); // Gọi hàm mở modal với dữ liệu đơn hàng
      },
      error: function(xhr, status, error) {
        console.error('Lỗi khi lấy thông tin đơn hàng:', error);
      }
    });
  }

  // Gọi hàm khi cần thiết
  fetchOrderDetails(orderId); // orderId là ID của đơn hàng cần lấy thông tin

</script>

</body>

</html>
