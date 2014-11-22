// 動作確認用折れ線グラフ
function test_basic_line(container) {
    var data = [];
    var i;

    for (i = 0; i < 10; i++) {
        data.push([i, i])
    }

    graph = Flotr.draw(container, [data], {
        xaxis: {
            minorTickFreq: 4,
            tickDecimals: 0
        },
        grid: {
            minorVerticalLines: true
        }
    });
}

// 温湿度推移グラフ
function basic_line_time_vs_temp_and_hum(container, data_date, data_time, data_temp, data_hum) {
    var data_t = [];
    var data_h = [];
    var i;

    // 時間と温度の数を取得し、小さい方をデータの数とする
    var time_length = data_time.length;
    var temp_length = data_temp.length;
    var data_length = time_length;
    if (temp_length < time_length) {
        data_length = temp_length;
    }

    // データ整形
    for (i = 0; i < data_length; i++) {
        data_t.push([ new Date(data_date + ' ' + data_time[i]).getTime() , data_temp[i]]);
        data_h.push([ new Date(data_date + ' ' + data_time[i]).getTime() , data_hum[i]]);
    }

    // x軸の最大値と最小値を調整
    var xaxis_min = new Date(data_date + ' 00:00').getTime();
    var xaxis_max = new Date(data_date + ' 00:00');
    xaxis_max.setDate(xaxis_max.getDate() + 1);
    xaxis_max = xaxis_max.getTime();

    graph = Flotr.draw(container, [
        {data: data_t, label: '温度'},
        {data: data_h, label: '湿度'}
    ], {
        xaxis: {
            mode: 'time',
            timeFormat: '%H:%M',
            timeMode: 'JST',
            min: xaxis_min,
            max: xaxis_max,
            noTicks: 10
        },
        grid: {
            minorVerticalLines: true
        },
        mouse: {
            track: true,
            trackFormatter: function (obj) {
                var mouse_date = new Date(parseInt(obj.x));
                var h = mouse_date.getHours();
                if (h < 10) {
                    h = '0' + h;
                }
                var m = mouse_date.getMinutes();
                if (m < 10) {
                    m = '0' + m;
                }
                return h + ':' + m + ' ' + obj.y;
            }
        }
    });
}

// 温度推移グラフ
function basic_line_time_vs_temp(container, data_date, data_time, data_temp) {
    var data = [];
    var i;

    // 時間と温度の数を取得し、小さい方をデータの数とする
    var time_length = data_time.length;
    var temp_length = data_temp.length;
    var data_length = time_length;
    if (temp_length < time_length) {
        data_length = temp_length;
    }

    // データ整形
    for (i = 0; i < data_length; i++) {
        data.push([ new Date(data_date + ' ' + data_time[i]).getTime() , data_temp[i]]);
    }

    // x軸の最大値と最小値を調整
    var xaxis_min = new Date(data_date + ' 00:00').getTime();
    var xaxis_max = new Date(data_date + ' 00:00');
    xaxis_max.setDate(xaxis_max.getDate() + 1);
    xaxis_max = xaxis_max.getTime();

    graph = Flotr.draw(container, [data], {
        xaxis: {
            mode: 'time',
            timeFormat: '%H:%M',
            timeMode: 'JST',
            min: xaxis_min,
            max: xaxis_max,
            noTicks: 10
        },
        grid: {
            minorVerticalLines: true
        },
        mouse: {
            track: true,
            trackFormatter: function (obj) {
                var mouse_date = new Date(parseInt(obj.x));
                var h = mouse_date.getHours();
                if (h < 10) {
                    h = '0' + h;
                }
                var m = mouse_date.getMinutes();
                if (m < 10) {
                    m = '0' + m;
                }
                return h + ':' + m + ' ' + obj.y;
            }
        }
    });
}

// 湿度推移グラフ
function basic_line_time_vs_hum(container, data_date, data_time, data_hum) {
    var data = [];
    var i;

    // 時間と湿度の数を取得し、小さい方をデータの数とする
    var time_length = data_time.length;
    var temp_length = data_hum.length;
    var data_length = time_length;
    if (temp_length < time_length) {
        data_length = temp_length;
    }

    // データ整形
    for (i = 0; i < data_length; i++) {
        data.push([ new Date(data_date + ' ' + data_time[i]).getTime() , data_hum[i]]);
    }

    // x軸の最大値と最小値を調整
    var xaxis_min = new Date(data_date + ' 00:00').getTime();
    var xaxis_max = new Date(data_date + ' 00:00');
    xaxis_max.setDate(xaxis_max.getDate() + 1);
    xaxis_max = xaxis_max.getTime();

    graph = Flotr.draw(container, [data], {
        xaxis: {
            mode: 'time',
            timeFormat: '%H:%M',
            timeMode: 'JST',
            min: xaxis_min,
            max: xaxis_max,
            noTicks: 10
        },
        grid: {
            minorVerticalLines: true
        },
        mouse: {
            track: true,
            trackFormatter: function (obj) {
                var mouse_date = new Date(parseInt(obj.x));
                var h = mouse_date.getHours();
                if (h < 10) {
                    h = '0' + h;
                }
                var m = mouse_date.getMinutes();
                if (m < 10) {
                    m = '0' + m;
                }
                return h + ':' + m + ' ' + obj.y;
            }
        }
    });
}

function basic_line_time_vs_disease(container, data_date, data_time) {
    var data_t = [];
    var data_h = [];
    var i;

    // 時間と温度の数を取得し、小さい方をデータの数とする
    var time_length = data_time.length;
//    var temp_length = data_temp.length;
    var data_length = time_length;
//    if (temp_length < time_length) {
//        data_length = temp_length;
//    }

    // データ整形
    for (i = 0; i < data_length; i++) {
//        data_t.push([ new Date(data_date + ' ' + data_time[i]).getTime() , data_temp[i]]);
        data_t.push([ new Date(data_date + ' ' + data_time[i]).getTime() , i%2]);
//        data_h.push([ new Date(data_date + ' ' + data_time[i]).getTime() , data_hum[i]]);
        data_h.push([ new Date(data_date + ' ' + data_time[i]).getTime() , i%2]);
    }

    // x軸の最大値と最小値を調整
    var xaxis_min = new Date(data_date + ' 00:00').getTime();
    var xaxis_max = new Date(data_date + ' 00:00');
    xaxis_max.setDate(xaxis_max.getDate() + 1);
    xaxis_max = xaxis_max.getTime();

    graph = Flotr.draw(container, [
        {data: data_t, label: '温度'},
        {data: data_h, label: '湿度'}
    ], {
        lines: {
            show: true,
            fill: true,
            stacked: true
        },
        xaxis: {
            mode: 'time',
            timeFormat: '%H:%M',
            timeMode: 'JST',
            min: xaxis_min,
            max: xaxis_max,
            noTicks: 10
        },
        yaxis:{
          min:0,
            max:2
        },
        grid: {
            minorVerticalLines: true
        },
        mouse: {
            track: true,
            trackFormatter: function (obj) {
                var mouse_date = new Date(parseInt(obj.x));
                var h = mouse_date.getHours();
                if (h < 10) {
                    h = '0' + h;
                }
                var m = mouse_date.getMinutes();
                if (m < 10) {
                    m = '0' + m;
                }
                return h + ':' + m + ' ' + obj.y;
            }
        }
    });
}

// マンスリーデータ折れ線グラフ
function monthly_data(container) {

    var data = [];
    var i;

    for (i = 0; i < 10; i++) {
        data.push([i, i])
    }

    graph = Flotr.draw(container, [data], {
        xaxis: {
            minorTickFreq: 4,
            tickDecimals: 0
        },
        grid: {
            minorVerticalLines: true
        }
    });
}
