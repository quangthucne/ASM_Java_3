<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 9/10/24
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <a href="#">Website Sell Phone</a>
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
          <form class="d-flex float-end" role="search">
            <input class="form-control me-2" type="search" placeholder="Search Order"
                   aria-label="Search" style="width: 300px;">
            <button class="btn btn-outline-primary" type="submit">Search</button>

          </form>
          <table class="table table-striped">
            <thead>
            <tr>
              <th>ID</th>
              <th>Orderer</th>
              <th>Total</th>
              <td>Status</td>
              <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1</td>
              <td>Nguyễn Văn A</td>
              <td>500.000 VND</td>
              <td><span class="badge bg-success">Completed</span></td>
              <td>
                <button class="btn btn-sm btn-info" title="View"><i
                        class="fa-solid fa-eye"></i></button>
                <button class="btn btn-sm btn-warning" title="Edit"><i
                        class="fa-solid fa-edit"></i></button>
                <button class="btn btn-sm btn-danger" title="Delete"><i
                        class="fa-solid fa-trash"></i></button>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td>Trần Thị B</td>
              <td>300.000 VND</td>
              <td><span class="badge bg-warning">Pending</span></td>
              <td>
                <button class="btn btn-sm btn-info" title="View"><i
                        class="fa-solid fa-eye"></i></button>
                <button class="btn btn-sm btn-warning" title="Edit"><i
                        class="fa-solid fa-edit"></i></button>
                <button class="btn btn-sm btn-danger" title="Delete"><i
                        class="fa-solid fa-trash"></i></button>
              </td>
            </tr>
            <tr>
              <td>3</td>
              <td>Phạm Văn C</td>
              <td>750.000 VND</td>
              <td><span class="badge bg-danger">Cancelled</span></td>
              <td>
                <button class="btn btn-sm btn-info" title="View"><i
                        class="fa-solid fa-eye"></i></button>
                <button class="btn btn-sm btn-warning" title="Edit"><i
                        class="fa-solid fa-edit"></i></button>
                <button class="btn btn-sm btn-danger" title="Delete"><i
                        class="fa-solid fa-trash"></i></button>
              </td>
            </tr>

            </tbody>
          </table>
        </section>



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

</body>

</html>
