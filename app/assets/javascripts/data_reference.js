$(document).ready(function () {
    //  カレンダー表示 、カレンダークリック時に日付データをコントローラに送りshow_data.html.erbに置き換える
    $('#calendar').fullCalendar({
        monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        columnFormat: {day: 'yyyy'},
        events: '/events.json',
        editable: false,
        // 日をクリックしたときの処理
        dayClick: function (date) {
            var tempDate = new Date(date);
            var y = tempDate.getFullYear();
            var m = tempDate.getMonth() + 1;
            if (m < 10) {
                m = '0' + m;
            }
            var d = tempDate.getDate()
            if (d < 10) {
                d = '0' + d;
            }
            var newDate = y + "/" + m + '/' + d
//            $.get(
//                '/data_reference/show_data',
//                {
//                    date: newDate
//                },
//                function (data) {
//                    $('body').html(data)
//                }
//            );
            window.location.href = '/data_reference/show_data?date=' + newDate;
        }
    });
});
$(function () {
    // 日付データ取得
    var data_date = $("#graph-data-log-date").html();
    // 時間データ取得
    var data_time = eval("(" + $("#graph-data-log-time").html() + ")");
    // 温度データ取得
    var data_temp = eval("(" + $("#graph-data-temperature").html() + ")");
    // 湿度データ取得
    var data_hum = eval("(" + $("#graph-data-humidity").html() + ")");
    basic_line_time_vs_temp(document.getElementById("graph-time-vs-temperature"), data_date, data_time, data_temp)
    basic_line_time_vs_hum(document.getElementById("graph-time-vs-humidity"), data_date, data_time, data_hum)
    basic_line_time_vs_temp_and_hum(document.getElementById("graph-time-vs-temperature-and-humidity"), data_date, data_time, data_temp, data_hum)
    basic_line_time_vs_disease(document.getElementById("graph-time-vs-disease"), data_date, data_time, data_temp)
});


$(function () {
    monthly_data(document.getElementById("monthly-data-graph"));
});
