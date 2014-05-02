$(document).ready(function () {
    //  カレンダー表示 、カレンダークリック時に日付データをコントローラに送りshow_data.html.erbに置き換える
    $('#calendar').fullCalendar({
        monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        columnFormat: {day: 'yyyy'},
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
            var newDate = y + "-" + m + '-' + d
            $.get(
                '/data_reference/show_data',
                {
                    date: newDate
                },
                function(data){
                    $('body').html(data)
                }
            );
        }
    });
});