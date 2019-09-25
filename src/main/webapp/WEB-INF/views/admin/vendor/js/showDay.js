       window.onload=function(){
            show1();
            show2();
        }
        function show1() {
            //当前年月日ID
            var fulldate = document.getElementById("fulldate");
            //当前日  ID
            var nowdate = document.getElementById("nowdate");
            //当前星期几 Weeky
            var weeky = document.getElementById("weeky");
            var weekyEn = document.getElementById("weekyEn");
            //倒计时ID
            var time = document.getElementById("time");
            //问候语ID
            var hllo = document.getElementById("hllo");
            //获取现在的年月日小时
            var fullTime = new Date();
            var year = fullTime.getFullYear();//年
            var month = fullTime.getMonth();//月
            var date = fullTime.getDate();//日
            var hours = fullTime.getHours();//小时
            var dayArr = [ "星期日","星期一","星期二","星期三","星期四","星期五","星期六"];//星期几
            var dayEnArr =[ "SUN","MON","TUE","WED","THU","FRI","SAT"];//英文星期几
            //设置年月
            fulldate.innerHTML = year+" 年 "+(month+1)+" 月 ";
            //设置当前日
            nowdate.innerHTML = date;
            //设置当前星期(中英)
            weeky.innerHTML= dayArr[fullTime.getDay()];
            weekyEn.innerHTML= dayEnArr[fullTime.getDay()];
            //名言数组
            var hlloarr = [
                "只有登上山顶，才能看到那边的风光",
                "山路曲折盘旋，但毕竟朝着顶峰延伸",
                "莫道前路无知己，天下谁人不识君",
                "左右一个人成功的，不是能力，而是选择",
                "没有天生的信心，只有不断培养的信心",
                "每一发奋努力的背后，必有加倍的赏赐",
                "不要等待机会，而要创造机会",
                "含泪播种的人一定能含笑收获",
                "让信念坚持下去，梦想就会实现",
                "不要给自己的失败找借口",
                "要不断进步，就必须放低自己的姿势"
            ];
            //当前时间段默认的名言
            hllo.innerHTML = hlloarr[parseInt(hours/2)];


            var endTime = new Date(year,month,date,23,59,59);//获取未来结束的时间
            setInterval(fun,1000);//开启定时器
            function fun() {
                var newTime = new Date();//得到最新的时间
                var ms = parseInt((endTime - newTime) / 1000); //得到毫秒，并取整
                var s = parseInt(ms % 60);//秒
                var m = parseInt((ms / 60) % 60); //分
                var h = parseInt((ms / 3600) % 24);//小时
                //var d = parseInt((ms / 3600) / 24);//天

                s<10? s="0"+s:s;
                m<10? m="0"+m:m;
                h<10? h="0"+h:h;
                //d<10? d="0"+d:d;
                /*time.innerHTML = h +" 时 "+m+" 分 "+s+" 秒 ";*/
                //每60秒切换一次名言
                if(s == 0 ){
                    hllo.innerHTML = hlloarr[parseInt(m%12)];
                }


            }
        }

        function show2(){
            var lunaryear = document.getElementById("lunaryear");
            var lunardate = document.getElementById("lunardate");
            var nongli = new Date();
            var yy=nongli.getFullYear();
            var mm=nongli.getMonth()+1;
            var dd=nongli.getDate();
            if (yy<100) yy="19"+yy;
            lunaryear.innerHTML = GetLunarYear(yy,mm,dd);
            lunardate.innerHTML = GetLunarDate(yy,mm,dd);
        }

        //全局变量
        var CalendarData = new Array(100);
        var madd = new Array(12);
        var tgString = "甲乙丙丁戊己庚辛壬癸";
        var dzString = "子丑寅卯辰巳午未申酉戌亥";
        var numString = "一二三四五六七八九十";
        var monString = "正二三四五六七八九十冬腊";
        var weekString = "日一二三四五六";
        var sx = "鼠牛虎兔龙蛇马羊猴鸡狗猪";
        var cYear, cMonth, cDay, TheDate;
        CalendarData = new Array(0xA4B, 0x5164B, 0x6A5, 0x6D4, 0x415B5, 0x2B6, 0x957, 0x2092F, 0x497, 0x60C96, 0xD4A, 0xEA5, 0x50DA9, 0x5AD, 0x2B6, 0x3126E, 0x92E, 0x7192D, 0xC95, 0xD4A, 0x61B4A, 0xB55, 0x56A, 0x4155B, 0x25D, 0x92D, 0x2192B, 0xA95, 0x71695, 0x6CA, 0xB55, 0x50AB5, 0x4DA, 0xA5B, 0x30A57, 0x52B, 0x8152A, 0xE95, 0x6AA, 0x615AA, 0xAB5, 0x4B6, 0x414AE, 0xA57, 0x526, 0x31D26, 0xD95, 0x70B55, 0x56A, 0x96D, 0x5095D, 0x4AD, 0xA4D, 0x41A4D, 0xD25, 0x81AA5, 0xB54, 0xB6A, 0x612DA, 0x95B, 0x49B, 0x41497, 0xA4B, 0xA164B, 0x6A5, 0x6D4, 0x615B4, 0xAB6, 0x957, 0x5092F, 0x497, 0x64B, 0x30D4A, 0xEA5, 0x80D65, 0x5AC, 0xAB6, 0x5126D, 0x92E, 0xC96, 0x41A95, 0xD4A, 0xDA5, 0x20B55, 0x56A, 0x7155B, 0x25D, 0x92D, 0x5192B, 0xA95, 0xB4A, 0x416AA, 0xAD5, 0x90AB5, 0x4BA, 0xA5B, 0x60A57, 0x52B, 0xA93, 0x40E95);
        madd[0] = 0;
        madd[1] = 31;
        madd[2] = 59;
        madd[3] = 90;
        madd[4] = 120;
        madd[5] = 151;
        madd[6] = 181;
        madd[7] = 212;
        madd[8] = 243;
        madd[9] = 273;
        madd[10] = 304;
        madd[11] = 334;


        function GetBit(m,n){
            return (m>>n)&1;
        }
        function e2c(){
            TheDate= (arguments.length!=3) ? new Date() : new Date(arguments[0],arguments[1],arguments[2]);
            var total,m,n,k;
            var isEnd=false;
            var tmp=TheDate.getYear();
            if(tmp<1900){
                tmp+=1900;
            }
            total=(tmp-1921)*365+Math.floor((tmp-1921)/4)+madd[TheDate.getMonth()]+TheDate.getDate()-38;
             
            if(TheDate.getYear()%4==0&&TheDate.getMonth()>1) {
                total++;
            }
            for(m=0;;m++){
                k=(CalendarData[m]<0xfff)?11:12;
                for(n=k;n>=0;n--){
                    if(total<=29+GetBit(CalendarData[m],n)){
                        isEnd=true; break;
                    }
                    total=total-29-GetBit(CalendarData[m],n);
                }
                if(isEnd) break;
            }
            cYear=1921 + m;
            cMonth=k-n+1;
            cDay=total;
            if(k==12){
                if(cMonth==Math.floor(CalendarData[m]/0x10000)+1){
                    cMonth=1-cMonth;
                }
                if(cMonth>Math.floor(CalendarData[m]/0x10000)+1){
                    cMonth--;
                }
            }
        }
         
        function GetcYearString(){
            var tmp="";
            tmp+=tgString.charAt((cYear-4)%10);
            tmp+=dzString.charAt((cYear-4)%12);
            tmp+="(";
            tmp+=sx.charAt((cYear-4)%12);
            tmp+=")年 ";
            
            return tmp;
        }

        function GetcDateString(){
            var tmp="";
            if(cMonth<1){
                    tmp+="(闰)";
                    tmp+=monString.charAt(-cMonth-1);
                }else{
                    tmp+=monString.charAt(cMonth-1);
                }
                tmp+="月";
                tmp+=(cDay<11)?"初":((cDay<20)?"十":((cDay<30)?"廿":"三十"));
                if (cDay%10!=0||cDay==10){
                    tmp+=numString.charAt((cDay-1)%10);
                }
                return tmp;
        }
         
        function GetLunarYear(solarYear,solarMonth,solarDay){
            //solarYear = solarYear<1900?(1900+solarYear):solarYear;
            if(solarYear<1921 || solarYear>2020){
                return "";
            }else{
                solarMonth = (parseInt(solarMonth)>0) ? (solarMonth-1) : 11;
                e2c(solarYear,solarMonth,solarDay);
                return GetcYearString();
            }
        }

        function GetLunarDate(solarYear,solarMonth,solarDay){
            //solarYear = solarYear<1900?(1900+solarYear):solarYear;
            if(solarYear<1921 || solarYear>2020){
                return "";
            }else{
                solarMonth = (parseInt(solarMonth)>0) ? (solarMonth-1) : 11;
                e2c(solarYear,solarMonth,solarDay);
                return GetcDateString();
            }
        }

