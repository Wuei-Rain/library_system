layui.use(['form', 'element', 'layer'], function () {
    let form = layui.form;
    let element = layui.element;
    let layer = layui.layer;

    form.on('submit(btn_addUser)', function (data) {
        addUser();
        return false;
    })
})


//添加用户的ajax方法
function addUser() {
    $.ajax({
        async: false,
        type: 'post',
        url: '/addUser',
        data: $('#addUserForm').serialize(),
        success: function (data) {
            layer.msg("添加成功", {icon: 1, time: 1500});

            // 添加成功后重新加载页面
            setTimeout(function () {
                location.reload();
            }, 1500)
        },
        error: function (data) {
            layer.msg("添加失败", {icon: 2});
        }
    })
}