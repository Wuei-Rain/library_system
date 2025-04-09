$(document).ready(function () {
    layui.use(['form', 'element', 'layer'], function () {
        let form = layui.form;
        let layer = layui.layer;

        $("#searchBtn").click(function () {
            console.log("搜索按钮被点击");
            let searchValue = $("#searchInput").val().toString().trim();

            if (!searchValue) {
                layer.alert("请输入书籍编号或名称");
                return false;
            }

            console.log("搜索值:", searchValue);
            searchBooks(searchValue);
        });
    });
});

function searchBooks(searchValue) {
    $.ajax({
        type: "GET",
        url: "/searchBooks",
        dataType: "json",
        data: { query: searchValue },
        success: function (data) {
            console.log("搜索结果:", data);
            displayResults(data);
        },
        error: function (xhr, status, error) {
            console.error("请求失败:", status, error);
            layer.alert("搜索失败，请稍后再试。");
        }
    });
}

function displayResults(books) {
    let resultsDiv = $("#results");
    resultsDiv.empty(); // 清空之前的结果

    if (!books || books.length === 0) {
        resultsDiv.append("<p>未找到相关书籍。</p>");
        return;
    }

    let html = "<ul class='layui-timeline'>";
    books.forEach(book => {
        html += `<li class='layui-timeline-item'>
                    <div class='layui-timeline-content layui-text'>
                        <h3 class='layui-timeline-title'>${book.bookName} (ID: ${book.bookId})</h3>
                        <p>作者: ${book.bookAuthor}</p>
                        <p>出版社: ${book.bookPublish}</p>
                        <button class='layui-btn layui-bg-blue borrowBtn' data-id='${book.bookId}'>借书</button>
                    </div>
                </li>`;
    });
    html += "</ul>";
    resultsDiv.append(html);

    // 添加借书按钮的点击事件
    $(".borrowBtn").click(function () {
        let bookId = $(this).data('id');
        borrowingBook(bookId);
    });
}

function borrowingBook(bookId) {
    $.ajax({
        async: false,
        type: "POST",
        url: "/userBorrowingBook",
        dataType: "json",
        data: { bookId: bookId },
        success: function (data) {
            if (data.toString() === "true") {
                layer.msg('借书成功!', { icon: 6, time: 2000 });
            } else {
                layer.msg('借书失败!', { icon: 7, time: 2000 });
            }
        },
        error: function () {
            layer.alert("借书请求失败，请稍后再试。");
        }
    });
}

