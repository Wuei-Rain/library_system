layui.use(['form', 'element','layer'], function () {
    let form = layui.form;
    let element = layui.element;
    let layer = layui.layer;
})
$(document).ready(function() {
    // 从本地存储获取报名的活动
    const registeredActivities = JSON.parse(localStorage.getItem('registeredActivities')) || [];

    if (registeredActivities.length === 0) {
        $("#activityList").html("<p>您还没有报名任何活动。</p>");
    } else {
        registeredActivities.forEach(activity => {
            const activityItem = `
                <div class="activity-item">
                    <h3>${activity.activityName}</h3>
                    <p><strong>姓名:</strong> ${activity.name}</p>
                    <p><strong>联系方式:</strong> ${activity.contact}</p>
                    <p><strong>报名时间:</strong> ${activity.timestamp}</p>
                </div>
            `;
            $("#activityList").append(activityItem);
        });
    }
});
