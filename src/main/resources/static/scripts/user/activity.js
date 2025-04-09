layui.use(['form', 'element','layer'], function () {
    let form = layui.form;
    let element = layui.element;
    let layer = layui.layer;
})
$(document).ready(function() {
    // 点击报名参加按钮
    $(".signup-btn").click(function() {
        const activityName = $(this).data("activity-name");
        $("#signupModal").data("activityName", activityName).show();
    });

    // 关闭模态框
    $(".close").click(function() {
        $("#signupModal").hide();
    });

    // 提交报名
    $("#submitSignup").click(function() {
        const name = $("#name").val();
        const contact = $("#contact").val();
        const activityName = $("#signupModal").data("activityName");

        // 校验联系方式
        if (!/^\d{11}$/.test(contact)) {
            $("#error-message").text("请输入有效的11位联系方式").show();
            return;
        } else {
            $("#error-message").hide();
        }

        // 保存到本地存储
        const registeredActivities = JSON.parse(localStorage.getItem('registeredActivities')) || [];
        registeredActivities.push({
            name: name,
            contact: contact,
            activityName: activityName,
            timestamp: new Date().toLocaleString() // 当前时间
        });
        localStorage.setItem('registeredActivities', JSON.stringify(registeredActivities));

        alert(`报名成功！\n活动：${activityName}\n姓名：${name}\n联系方式：${contact}`);
        $("#signupModal").hide(); // 关闭模态框
        $("#name").val(''); // 清空输入框
        $("#contact").val('');
    });

    // 点击模态框外部也可以关闭模态框
    $(window).click(function(event) {
        if ($(event.target).is("#signupModal")) {
            $("#signupModal").hide();
        }
    });
});
