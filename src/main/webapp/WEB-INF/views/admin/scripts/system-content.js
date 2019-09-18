/**
 * Created by Vic_Hoo on 2019/5/4.
 * system function and utils
 */

function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return(localhostPaht + projectName);
}

function getProjectName(){
    var pathName = window.document.location.pathname;
    return pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
}

<!-- Message Dialog -->
<!-- id: msgDialog & msgBody & msgBtn-->
function goQuit(){
    console.log("goQuit");
    showMsgDialog("要退出了吗？");
    var msgBtn = document.getElementById("msgBtn").onclick  = Quit;
}
function Quit(){
    window.location.href = getProjectName() + "/Quit";
}

function showMsgDialog(str){
    var msgBody = document.getElementById("msgBody");
    document.getElementById("msgBtn").onclick = function(){};//解绑
    msgBody.innerHTML = str;
    $('#msgDialog').modal('show');
}

//解析JsonDate
function getDate(jsonDate){
    var date = new Date(parseInt(jsonDate, 10));
    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
    return date.getFullYear() + "年" + month + "月" + currentDate + "日"
}

//解析JsonTime
function getTime(jsonTime){
    var Time = new Date(parseInt(jsonTime, 10));
    var result = Time.getHours() + "时" + Time.getMinutes() + "分" + Time.getSeconds() + "秒";
    return result;
}

//解析JsonDateTime
function getDateTime(jsonDate){
    var date = new Date(parseInt(jsonDate, 10));
    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
    return date.getFullYear() + "年" + month + "月" + currentDate + "日 "
        + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
}

//判断字符串是否有效
function isInvalid(str){
    var str1 = String(str);
    str1 = str1.replace(/\s*/g,"");
    if(str1 == "" ||
        str1 == null ||
        str1 == undefined ||
        str1 == "null" ||
        str1 == "undefined")
        return true;
    else return false;
}

//判断是否是数字
function isNotNumber(input){
    if(isInvalid(input)) return true;
    if(isNaN(input)) return true;
    return false;
}

//字符串去除空格
function removeBlank(str){
    return str.replace(/\s*/g,"");
}


//////////////////  布局  /////////////////////////

(function($) {

    $(document).ready(function() {
        $(window).resize(function() {
            ResetComponentsHeight();
        });
        ResetComponentsHeight();
    });

})(jQuery);

function ResetComponentsHeight() {
    $('.row.col-components-same-height').each(function() {

        // find all columns
        var $cols = $(this).children('[class*="col-"]');
        // auto height for content
        $cols.css('height', 'auto');

        var $divs = $();
        var offsetHeight = new Array();
        $cols.each(function(){
            //get components in cols
            $divs = $divs.add($(this).children('*'));
        });
        if($divs.length > 1){
            // auto height for content
            $divs.css('height', 'auto');
            $divs.each(function(){
                var offsetTop = $(this).offset().top;
                //console.log(offsetTop);
                if( offsetHeight.indexOf(offsetTop) < 0 ){
                    offsetHeight.push(offsetTop);
                }
            });
            for( var i in offsetHeight){
                var $inline = $();
                $divs.each(function(){
                    if($(this).offset().top == offsetHeight[i]){
                        $inline = $inline.add($(this));
                    }
                });

                if($inline.length > 1){
                    var maxHeight = 0;
                    $inline.each(function(){
                        //find the maxHeight
                        if($(this).height() > maxHeight) maxHeight = $(this).height();
                    });
                    $inline.css('height', maxHeight);
                }
            }

        }
    });
}
