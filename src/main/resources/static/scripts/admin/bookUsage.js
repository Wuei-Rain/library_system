$(document).ready(function () {
    const ctx = document.getElementById('bookUsageChart').getContext('2d');

    $.ajax({
        type: "GET",
        url: "/api/bookUsage", // 替换为你的后端接口
        success: function (response) {
            const data = {
                labels: response.labels, // 从后端获取的标签
                datasets: [{
                    label: '用户用书情况',
                    data: response.data, // 从后端获取的数据
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)'
                    ],
                    borderWidth: 1
                }]
            };

            // 创建饼状图
            const myPieChart = new Chart(ctx, {
                type: 'pie',
                data: data,
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: '用户用书情况'
                        }
                    }
                }
            });
        },
        error: function () {
            console.error("数据加载失败！");
        }
    });
});
