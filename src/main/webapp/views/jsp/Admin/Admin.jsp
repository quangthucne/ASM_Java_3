<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 6/10/24
  Time: 00:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
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
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div
                        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Dashboard</h1>
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

                <!-- Dashboard Overview -->
                <div class="row">
                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-primary">
                            <div class="card-body">
                                <h5 class="card-title">Total Sales</h5>
                                <p class="card-text display-6">$25,430</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-success">
                            <div class="card-body">
                                <h5 class="card-title">Number of Orders</h5>
                                <p class="card-text display-6">324</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-info">
                            <div class="card-body">
                                <h5 class="card-title">Revenue</h5>
                                <p class="card-text display-6">$18,230</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-warning">
                            <div class="card-body">
                                <h5 class="card-title">Products Sold</h5>
                                <p class="card-text display-6">542</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Charts -->
                <div class="row mb-4">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">Sales Overview</div>
                            <div class="card-body">
                                <canvas id="salesChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">Top Selling Products</div>
                            <div class="card-body">
                                <canvas id="productChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Management -->
                <h2>Product Management</h2>
                <div class="table-responsive mb-4">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>iPhone 13 Pro</td>
                            <td>$999</td>
                            <td>50</td>
                            <td>
                                <button class="btn btn-sm btn-primary">Edit</button>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Samsung Galaxy S21</td>
                            <td>$799</td>
                            <td>75</td>
                            <td>
                                <button class="btn btn-sm btn-primary">Edit</button>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Order Management -->
                <h2>Order Management</h2>
                <div class="table-responsive mb-4">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Total</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>#12345</td>
                            <td>John Doe</td>
                            <td>2023-05-15</td>
                            <td><span class="badge bg-success">Completed</span></td>
                            <td>$1,299</td>
                            <td>
                                <button class="btn btn-sm btn-info">View</button>
                                <button class="btn btn-sm btn-warning">Update</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#12346</td>
                            <td>Jane Smith</td>
                            <td>2023-05-16</td>
                            <td><span class="badge bg-warning">Processing</span></td>
                            <td>$899</td>
                            <td>
                                <button class="btn btn-sm btn-info">View</button>
                                <button class="btn btn-sm btn-warning">Update</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <!-- User Management -->
                <h2>User Management</h2>
                <div class="table-responsive mb-4">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>Admin User</td>
                            <td>admin@example.com</td>
                            <td>Administrator</td>
                            <td>
                                <button class="btn btn-sm btn-primary">Edit</button>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Customer Support</td>
                            <td>support@example.com</td>
                            <td>Support</td>
                            <td>
                                <button class="btn btn-sm btn-primary">Edit</button>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>




    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/views/js/Admin.js"></script>
</body>
</html>
