//map data
// const profile = {
//     name: "",
//     email: "",
//     phone: "",
//     picture: ""
// };

const purchaseHistory = [
    { orderId: "ORD001", date: "2023-09-01", product: "Nike Shoes", total: "1,500,000đ" }
];

// Function to display profile information
function loadProfile() {
    document.getElementById('profile-name').textContent = profile.name;
    document.getElementById('profile-email').textContent = profile.email;
    document.getElementById('profile-phone').textContent = profile.phone;
    document.getElementById('profile-picture').src = profile.picture;
}

// Function to display purchase history
function loadPurchaseHistory() {
    const tableBody = document.getElementById('purchase-history').getElementsByTagName('tbody')[0];
    purchaseHistory.forEach(order => {
        const row = document.createElement('tr');

        const orderIdCell = document.createElement('td');
        orderIdCell.textContent = order.orderId;

        const dateCell = document.createElement('td');
        dateCell.textContent = order.date;

        const productCell = document.createElement('td');
        productCell.textContent = order.product;

        const totalCell = document.createElement('td');
        totalCell.textContent = order.total;

        row.appendChild(orderIdCell);
        row.appendChild(dateCell);
        row.appendChild(productCell);
        row.appendChild(totalCell);

        tableBody.appendChild(row);
    });
}

document.addEventListener('DOMContentLoaded', function () {
    loadProfile();
    loadPurchaseHistory();
});
