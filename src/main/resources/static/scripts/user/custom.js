$(document).ready(function () {
    // 表单提交事件
    $('.layui-form').on('submit', function (e) {
        e.preventDefault(); // 防止默认提交

        // 收集表单数据
        const formData = {
            name: $('input[name="name"]').val(),
            email: $('input[name="email"]').val(),
            message: $('textarea[name="message"]').val(),
        };

        // 发送AJAX请求
        $.ajax({
            url: '/submitContact', // 后端提交的URL
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function (response) {
                // 成功回调
                alert('反馈提交成功！');
                // 可以重置表单
                $('.layui-form')[0].reset();
            },
            error: function (error) {
                // 错误回调
                alert('提交失败，请稍后再试。');
            }
        });
    });
});
