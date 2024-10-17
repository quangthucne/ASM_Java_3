<%--
  Created by IntelliJ IDEA.
  User: buiquangthuc
  Date: 9/10/24
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Manage</title>
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

          <table class="table table-striped" id="myTable">
            <thead>
            <tr>
              <th>STT</th>
              <th>Full Name</th>
              <th>Gender</th>
              <td>Email</td>
              <td>Phone</td>
              <td>Date Created</td>
              <td>Status</td>
              <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="user" varStatus="vs">
              <tr>
                <td>${vs.count}</td>
                <td>${user.fullName}</td>
                <td>${user.gender == 1 ? 'Nam' : 'Nữ'}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.dateCreated}</td>
                <td style=" color: ${user.status == 1 ? 'green':'red'}">${user.status == 1 ? 'Hoạt động':'không hoạt động'}</td>
                <td style="display: flex">
                  <a href="#" class="btn btn-sm btn-warning edit-btn"
                     data-id="${user.idUser}"
                     data-name="${user.fullName}"
                     data-gender="${user.gender}"
                     data-email="${user.email}"
                     data-phone="${user.phone}"
                     data-status="${user.status}"
                     data-bs-toggle="modal"
                     data-bs-target="#editUserModal">
                    Edit
                  </a>
                  <button type="button" class="btn btn-sm btn-danger delete-btn" data-id="${user.idUser}" style="margin-left: 15px;">Delete</button>
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

<!-- Edit User Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editUserModalLabel">Edit User Information</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="editUserForm" action="${pageContext.request.contextPath}/user-manage" method="post">
          <input type="hidden" id="userId" name="userId" value="">
          <div class="mb-3">
            <label for="fullName" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="fullName" name="fullName" required>
          </div>
          <div class="mb-3">
            <label for="gender" class="form-label">Gender</label>
            <select class="form-select" id="gender" name="gender">
              <option value="1">Nam</option>
              <option value="0">Nữ</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
            <input type="text" hidden="hidden" name="typeActive" value="edit">
            <input type="text" hidden="hidden" name="userId" id="userId">
          </div>
          <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status">
              <option value="1">Hoạt động</option>
              <option value="0">Không hoạt động</option>
            </select>
          </div>
          <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div>
  </div>
</div>



</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/views/js/Admin.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script>
  $(document).ready(function () {
    $('#myTable').DataTable({
      paging: true,
      ordering: true,
      info: true,
      language: {
        url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/vi.json"
      }
    });
  });

  document.addEventListener("DOMContentLoaded", function () {
    const editButtons = document.querySelectorAll(".edit-btn");

    editButtons.forEach(button => {
      button.addEventListener("click", function (event) {
        event.preventDefault();

        // Retrieve userId from data-id attribute
        const userId = this.getAttribute("data-id");
        const userFullName = this.getAttribute("data-name");
        const userGender = this.getAttribute("data-gender");
        const userEmail = this.getAttribute("data-email");
        const userPhone = this.getAttribute("data-phone");
        const userStatus = this.getAttribute("data-status");
        document.querySelector("#editUserForm #userId").value = userId;
        document.querySelector("#editUserForm #fullName").value = userFullName;
        document.querySelector("#editUserForm #gender").value = userGender;
        document.querySelector("#editUserForm #email").value = userEmail;
        document.querySelector("#editUserForm #phone").value = userPhone;
        document.querySelector("#editUserForm #status").value = userStatus;

        // Send a request to the server to get user details by userId
        fetch(`${pageContext.request.contextPath}/getUserDetails?id=${userId}`)
                .then(response => response.json())
                .then(data => {
                  // Populate the form fields in the modal with the fetched user data
                  document.querySelector("#editUserForm #userId").value = data.idUser;
                  document.querySelector("#editUserForm #fullName").value = data.fullName;
                  document.querySelector("#editUserForm #gender").value = data.gender;
                  document.querySelector("#editUserForm #email").value = data.email;
                  document.querySelector("#editUserForm #phone").value = data.phone;
                  document.querySelector("#editUserForm #status").value = data.status;

                  // Display the Edit User Modal
                  const editUserModal = new bootstrap.Modal(document.getElementById("editUserModal"));
                  editUserModal.show();
                })
                .catch(error => console.error("Error fetching user details:", error));
      });
    });
  });

  document.addEventListener("DOMContentLoaded", function () {
    const deleteButtons = document.querySelectorAll(".delete-btn");

    deleteButtons.forEach(button => {
      button.addEventListener("click", function (event) {
        event.preventDefault();

        const userId = this.getAttribute("data-id");
        const confirmation = confirm("Bạn chắc chắn xóa người dùng này chứ?");

        if (confirmation) {
          fetch(`${pageContext.request.contextPath}/user-manage`, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
              'userId': userId,
              'typeActive': 'delete'
            })
          })
                  .then(response => {
                    if (response.ok) {
                      this.closest('tr').remove();
                    } else {
                      alert("Error deleting user.");
                    }
                  })
                  .catch(error => console.error("Error deleting user:", error));
        }
      });
    });
  });




</script>


</body>

</html>
