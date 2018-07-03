function randomString(len) {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < len; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
}


function zfill(num, size) {
    var s = num+"";
    while (s.length < size)
        s = "0" + s;
    return s;
}

function timestampToDatetime(timestamp) {
    var date = new Date(时间戳); //获取一个时间对象
    var y = date.getFullYear();  // 获取完整的年份(4位,1970)
    var m = date.getMonth();  // 获取月份(0-11,0代表1月,用的时候记得加上1)
    var d = date.getDate();  // 获取日(1-31)
    date.getTime();  // 获取时间(从1970.1.1开始的毫秒数)
    var h = date.getHours();  // 获取小时数(0-23)
    var min = date.getMinutes();  // 获取分钟数(0-59)
    var s = date.getSeconds();  // 获取秒数(0-59)

    return zfill(y) + "-" + zfill(m) + "-" + zfill(d) + " " + h + ":" + min + ":" + s;
}

function postProduceTaskData(formName, tbodyName, modal) {
    var distForm = $("#" + formName);
    var tbody = $("#" + tbodyName);

    var inputs = []
    var trs = [];
    var data = {};

    var tdCount = $("#" + tbodyName + " tr").length;

    trs.push("<td>" + (tdCount + 1) + "</td>");

    $("form#" + formName + " :input").each(function () {
        inputs.push($(this));
    });

    for (var i = 0; i < inputs.length; ++i) {
        var input = inputs[i]; // This is the jquery object of the input, do what you will
        var name = input.attr("name");
        var value = input.val();
        var alt = input.attr("alt");

        if (alt != null && alt.length > 0 && value.length == 0) {
            alert(alt + "不能为空");
            return;
        }

        data[name] = value;
        if (name != 'produceTaskID') {
            trs.push("<td>" + value + "</td>");
        }
        console.log(name + " " + value + " " + alt);
    }


    console.log(tdCount);
    console.log(distForm.attr("action"));
    console.log(data);
    console.log('<tr>' + trs.join("") + '</tr>')


    $.ajax({
        method: 'POST',
        url: distForm.attr("action"),
        data: data,
        dataType: "text",

        success: function (result) {
            console.log(result);
            if (result == "success") {
                tbody.append('<tr>' + trs.join("") + '</tr>');
                $("form#" + formName + " :input").each(function () {
                    if ($(this).attr("name") != "produceTaskID") {
                        $(this).val("");
                    }
                });
                $("#" + modal).modal('hide')
            } else {
                alert(result);
            }
        },
        error: function (result) {
            console.log(result);
            alert("服务器请求出错");
        }
    })
}
