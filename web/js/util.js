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
