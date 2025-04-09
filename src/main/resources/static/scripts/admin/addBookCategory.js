layui.use(['layer', 'jquery','element','form'], function() {
    var layer = layui.layer;
    var $ = layui.jquery;
    let element = layui.element;
    let form = layui.form;

    $(function () {
        // 表单提交事件
        $("#addBookCategoryForm").on("submit", function (e) {
            e.preventDefault(); // 防止默认提交
            const formData = $(this).serialize(); // 获取表单数据

            // 验证类别名称是否为空
            const categoryName = $("#categoryName").val().trim();
            if (categoryName === "") {
                layer.msg("类别名称不能为空！", {icon: 2, time: 1500});
                return; // 阻止提交
            }

            addBookCategory(formData);
        });

        // 使用事件代理处理删除类别事件
        $(document).on("click", ".btn_deleteCategory", function () {
            const that = $(this);
            const bookCategoryId = that.val();

            layer.confirm('确认删除?', {
                btn: ['确认', '取消'] // 按钮
            }, function () {
                deleteBookCategoryById(bookCategoryId).then(function (success) {
                    if (success) {
                        that.closest('tr').remove();
                        layer.msg("删除成功", {icon: 1, time: 1000});
                    } else {
                        layer.msg("删除失败", {icon: 2, time: 1500});
                    }
                });
            });
        });
    });

    // AJAX 添加类别
    function addBookCategory(formData) {
        $.ajax({
            type: "POST",
            url: "/addBookCategory",
            data: formData,
            success: function (response) {
                if (response === "true") {
                    layer.msg("添加成功!", {icon: 1, time: 1500});
                    setTimeout(function() {
                        window.location.href = '/addCategoryPage?pageNum=1'; // 替换为实际重定向页面
                    }, 1500);
                } else {
                    layer.msg("添加失败!", {icon: 2, time: 1500});
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("添加请求失败:", textStatus, errorThrown);
                layer.msg("添加请求失败!", {icon: 2, time: 1500});
            }
        });
    }

    // AJAX 删除类别
    function deleteBookCategoryById(bookCategoryId) {
        return new Promise((resolve) => {
            $.ajax({
                type: "POST",
                url: "/deleteCategory",
                data: {bookCategoryId: bookCategoryId},
                success: function (response) {
                    resolve(response === "true"); // 返回布尔值
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error("删除请求失败:", textStatus, errorThrown);
                    layer.msg("删除请求失败!", {icon: 2, time: 1500});
                    resolve(false);
                }
            });
        });
    }
});
