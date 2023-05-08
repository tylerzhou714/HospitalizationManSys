var $tbody = $("#show");
var start = 0;
var end = 15;
$(function() {
    $("#find").click(confirm);
    $("#cle").click(qingkong);
});

$(function() {
    /*
     * 读取cookie值，判断是什么类型的用户。 如果是患者，则把身份证号设置为只读， 并把数据回显出来
     */
    // cookie内容：{user:用户ID#用户姓名#用户类型描述}
    var cookie = getCookie('user');
    var userid = cookie.split("#")[0].substring(0);
    var usertype = cookie.split("#")[2].substring(0);
    // alert(usertype);
    if (usertype == 0) {// 是患者类型的用户，设置身份证为只读
        $("#cerificateNo").val(userid);
        document.getElementById("cerificateNo").setAttribute("readOnly", false);
        $.ajax({// 通过身份证查询patient表的患者信息
            url : "LabOrder/labOrderQueryById.do",
            data : {
                "cerificateNo" : userid
            },
            type : "post",
            dataType : "JSON",
            success : function(result) {
                if (result.state == 0) {
                    var lists = result.data;
                    $tbody.empty();
                    // 分页
                    if (lists.length > 0) {
                        $('.pagination').pagination(lists.length, {
                            callback : function(page) {
                                start = page * this.items_per_page;
                                end = (page + 1) * this.items_per_page;
                                $tbody.empty();
                                showList(lists, start, end);
                                return true;
                            },
                            display_msg : true, // 是否显示记录信息
                            setPageNo : true
                            // 是否显示跳转第几页
                        });
                    } else {
                        alert("未找到信息！");
                        $("#cle").click();
                    }
                    showList(lists, start, end);
                }
            }
        });
    }
});


function formatDate(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');
    var hours = date.getHours().toString().padStart(2, '0');
    var minutes = date.getMinutes().toString().padStart(2, '0');
    var seconds = date.getSeconds().toString().padStart(2, '0');

    return year + '-' + month + '-' + day;
}


function showList(lists, start, end) {
    if (lists.length > 0) {
        for (var i = start; i < end; i++) {
            var patient = lists[i];
            trStyle = "<tr style='background-color:#eff6fa' >";
            var createTimeFormatted = formatDate(patient.create_time.time);
            var $tr = trStyle + "<td class='num'>" + (i + 1) + "</a></td>"
                + "<td class='name'>" + patient.patient_id + "</td>"
                + "<td class='name'>" + patient.patient_name + "</td>"
                + "<td class='node'>" + patient.bed_no + "</td>"
                + "<td class='node'>" + patient.items + "</td>"
                + "<td class='node'>" + patient.doctor_name + "</td>"
                + "<td class='time'>" + createTimeFormatted + "</td>" + "</tr>";
            $tbody.append($tr);
        }
    }
}

// 清空条件按钮
function qingkong() {
    window.location.reload(true);
}