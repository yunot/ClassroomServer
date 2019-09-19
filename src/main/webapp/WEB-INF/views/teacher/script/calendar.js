//[9,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,12,1,1]获取此数组中出现的数字
function everyMonth(Array) {
    var data = [];
    const countOccurences = (arr, value) => arr.reduce((a, v) => v === value ? a + 1 : a + 0, 0);
    for (var i = 0; i < Array.length; i++) {
        var count = countOccurences(Array, Array[i]);
        var str = Array[i] + "-" + count;
        data.push(str);
    }
    var final_data = data.filter(function (ele, index, self) {
        return self.indexOf(ele) === index;
    });

    var result = [];

    for (var i = 0; i < final_data.length; i++) {
        var str1 = final_data[i].split("-");
        var month = parseInt(str1[0]);
        result.push(month);
    }
    return result;
}


//[9,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,12,1,1]获取此数组中数字出现的次数
function countTimes(Array) {
    var data = [];
    const countOccurences = (arr, value) => arr.reduce((a, v) => v === value ? a + 1 : a + 0, 0);
    for (var i = 0; i < Array.length; i++) {
        var count = countOccurences(Array, Array[i]);
        var str = Array[i] + "-" + count;
        data.push(str);
    }
    var final_data = data.filter(function (ele, index, self) {
        return self.indexOf(ele) === index;
    });

    var result = [];

    for (i = 0; i < final_data.length; i++) {
        var str1 = final_data[i].split("-");
        var times = parseInt(str1[1]);
        result.push(times);
    }
    return result;
}

function deleteTable() {//删除表
    var tb = document.getElementById("SchoolCalendar");
    var rowNum = tb.rows.length;
    for (var i = 0; i < rowNum; i++) {
        tb.deleteRow(i);
        rowNum = rowNum - 1;
        i = i - 1;
    }
}

function loadCalendar(Weeks, StartDate,semName) {
    deleteTable();//删除表格
    //日期增加一天
    function addOneDay(startDate) {
        startDate = new Date(startDate);
        startDate = +startDate + 1000 * 60 * 60 * 24;
        startDate = new Date(startDate);
        //var nextDay = startDate.getDate();
        return startDate;
    }


    var weeks = Weeks; //一共20周,需从后端获取
    var start_date = StartDate; //开学日期为2019.08.26，需从后端获取


    var myStr = start_date.split("."); //对日期字符串进行提取
    var y = parseInt(myStr[0]); //获取年
    var m = parseInt(myStr[1]); //获取月
    var d = parseInt(myStr[2]); //获取日
    var changeFormat = y + "/" + m + "/" + d; //IE只能识别2020/02/17格式
    var date = new Date(changeFormat);

    var YYmmdd = []; //存放年月日的数组
    var DateAndMonth = []; //存放日和月的数组
    var allDates = []; //存放日的数组
    var allMonth = []; //存放月的数组
    YYmmdd.push(y + "." + m + "." + d);
    DateAndMonth.push(m + "." + d);
    allDates.push(d);
    allMonth.push(m);

    //获取所有月份的数组,从第一天开始
    for (var i = 1; i < weeks * 7; i++) {
        var newDay = addOneDay(date);

        allDates.push(newDay.getDate());

        DateAndMonth.push(newDay.getMonth() + 1 + "." + newDay.getDate());

        YYmmdd.push(newDay.getFullYear() + "." + (newDay.getMonth() + 1) + "." + newDay.getDate());

        if (allMonth[allMonth.length - 1] === (newDay.getMonth() + 1)) {
            //月份与之前相同，什么都不做
        } else {
            allMonth.push(newDay.getMonth() + 1);
        }
        date = newDay;
    }


    //将数据转换为二维数组

    var Date_Array0 = new Array(Math.ceil(allDates.length / weeks));
    //显示方式为年月日
    for (i = 0; i < Date_Array0.length; i++) {
        Date_Array0[i] = [];
    }
    var Date_Array = new Array(Math.ceil(allDates.length / weeks));

    //显示方式为月日
    for (i = 0; i < Date_Array.length; i++) {
        Date_Array[i] = [];
    }

    var Date_Array1 = new Array(Math.ceil(allDates.length / weeks));
    //显示方式为日
    for (i = 0; i < Date_Array1.length; i++) {
        Date_Array1[i] = [];
    }

    //将日期放到七个数组中，每个数组中的日期之间相差七天
    var ArrayCount = [0, 0, 0, 0, 0, 0, 0];
    for (var j = 0; j < allDates.length; j++) {
        Date_Array0[j % 7][ArrayCount[j % 7]] = YYmmdd[j]; //显示方式为年月日
        Date_Array1[j % 7][ArrayCount[j % 7]] = DateAndMonth[j]; //显示方式为月日
        Date_Array[j % 7][ArrayCount[j % 7]] = allDates[j]; //显示方式为日
        ArrayCount[j % 7]++;
    }

    //获取月份跨列的数组
    var last_row_month = [];
    var month_array = [];
    for (i = 0; i < weeks; i++) {
        last_row_month[i] = Date_Array1[6][i].split(".");
        month_array[i] = parseInt(last_row_month[i][0]);
    }

    var every_month = everyMonth(month_array); //最后一行的所有月份
    var colspan_array = countTimes(month_array); //存放月份需要的跨列数数组


    //填充表格
    var aWeek = ["星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"];
    var monthNum = ["", "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
    var weekNum = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七",
        "十八",
        "十九", "二十", "二十一", "二十二", "二十三", "二十四", "二十五"
    ]; //默认周次不会超过二十五周
    var color = ["#79ffe0", "#FFFACD", "#d3ffd0", "#C1FFC1", "#ffaab1", "#eec9ff", "#FAFAD2", "#FFF68F", "#E5E5E5",
        "#BFEFFF", "#B4EEB4", "#E0FFFF", "#e1ff87"
    ];

    var weekNumber = weeks; //从上面的js中获取周数
    var wsTable = document.getElementById("SchoolCalendar");


    tr = document.createElement("tr");
    var thead = document.createElement("th");
    var th1 = document.createElement("th");
    thead.innerHTML = semName;
    thead.colSpan = weeks + 1;
    tr.appendChild(thead);
    wsTable.appendChild(tr);

    th1.innerHTML = "周次";
    tr = document.createElement("tr");
    tr.appendChild(th1);
    for (i = 1; i <= weekNumber; i++) {
        th = document.createElement("th");
        th.innerHTML = weekNum[i - 1];
        tr.appendChild(th);
    }
    wsTable.appendChild(tr);

    //由于不好按行修改id，不再采用函数形式填充数据
    // function createTableTr(week, day,id) {
    //     var tr = document.createElement("tr");
    //     var th0 = document.createElement("th");
    //     th0.innerHTML = week;
    //     tr.appendChild(th0);
    //
    //     var weekdays = eval(day);
    //
    //     for (var i = 0; i < weekdays.length; i++) {
    //         var td = document.createElement("td");
    //         td.innerHTML = weekdays[i];
    //         td.id = id[i];
    //         tr.appendChild(td);
    //     }
    //     wsTable.appendChild(tr);
    // }


    //一行一行填充表格
    for (i = 0; i < 7; i++) {
        //createTableTr(aWeek[i], Date_Array[i],Date_Array0[i]);

        tr = document.createElement("tr");
        th0 = document.createElement("th");
        th0.innerHTML = aWeek[i];
        tr.appendChild(th0);

        var weekdays = eval(Date_Array[i]);

        for (j = 0; j < weekdays.length; j++) {
            var td = document.createElement("td");
            td.innerHTML = weekdays[j];
            if (i > 4) {
                td.id = Date_Array0[i][j] + ".weekend";
            } else {
                td.id = Date_Array0[i][j];
            }
            tr.appendChild(td);
        }
        wsTable.appendChild(tr);
    }


    //创建一个十二个数的数组，且相邻两数不相等
    //获取0-11之间的随机数
    var num = Math.floor(Math.random() * 12);
    var array = [];
    array.push(num);
    for (i = 0; i < 11; i++) {
        do {
            num = Math.floor(Math.random() * 12);
        } while (num === array[array.length - 1]);
        array.push(num);
    }
    //保证首尾不相等
    if (array[0] === array[array.length - 1]) {
        do {
            num = Math.floor(Math.random() * 12);
        } while (num === array[0]);
        array[array.length - 1] = num;
    }

    //添加月份
    var tr = document.createElement("tr");
    var th0 = document.createElement("th");
    th0.innerHTML = "月份";
    tr.appendChild(th0);

    var k = 0;
    var th;
    for (i = 0; i < every_month.length; i++) {
        th = document.createElement("th");
        th.colSpan = colspan_array[k];
        k++;
        th.innerHTML = monthNum[every_month[i]];
        tr.appendChild(th);

    }
    wsTable.appendChild(tr);


    //获取id中的月份
    function getMonth(id, i) {
        var myStr = id.split(".");
        return myStr[i];
    }

    //给单元格加背景颜色
    var cell = document.getElementsByTagName("td");

    for (i = 0; i <= cell.length - 1; i++) {
        for (j = 1; j <= 12; j++) {
            if (getMonth(cell[i].id, 3) === "weekend") {
                cell[i].style.backgroundColor = color[12];
            } else if (parseInt(getMonth(cell[i].id, 1)) === j) {
                cell[i].style.backgroundColor = color[array[j - 1]];
            }
        }
    }
}
