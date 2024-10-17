const hamBurger = document.querySelector(".toggle-btn");

hamBurger.addEventListener("click", function () {
    document.querySelector("#sidebar").classList.toggle("expand");
});

// data chart
const salesCtx = document.getElementById("salesChart").getContext("2d");
new Chart(salesCtx, {
    type: "line",
    data: {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
        datasets: [
            {
                label: "Sales",
                data: [12, 19, 3, 5, 2, 3],
                borderColor: "rgb(75, 192, 192)",
                tension: 0.1,
            },
        ],
    },
});

const productCtx = document.getElementById("productChart").getContext("2d");
new Chart(productCtx, {
    type: "doughnut",
    data: {
        labels: ["iPhone 13", "Galaxy S21", "Pixel 6"],
        datasets: [
            {
                label: "Top Selling Products",
                data: [300, 50, 100],
                backgroundColor: [
                    "rgb(255, 99, 132)",
                    "rgb(54, 162, 235)",
                    "rgb(255, 205, 86)",
                ],
            },
        ],
    },
});
document.getElementById("sidebarToggle").addEventListener("click", function () {
    document.getElementById("sidebar").classList.toggle("active");
    document.querySelector(".content").classList.toggle("active");
});









