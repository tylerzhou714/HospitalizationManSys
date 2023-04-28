<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>医生排班</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center my-4">医生排班</h2>
    <form id="scheduleForm">
        <div class="form-group">
            <label for="select_keshi">科室：</label>
            <select class="form-control" id="select_keshi" name="select_keshi">
                <option value="">请选择科室</option>
            </select>
        </div>
        <div class="form-group">
            <label for="select_zhicheng">职称：</label>
            <select class="form-control" id="select_zhicheng" name="select_zhicheng">
                <option value="">请选择</option>
            </select>
        </div>
        <div class="form-group">
            <label for="select_doctorName">医生姓名：</label>
            <select class="form-control" id="select_doctorName" name="select_doctorName">
                <option value="">请选择</option>
            </select>
        </div>
        <div class="form-group">
            <label for="date">排班日期：</label>
            <input type="date" class="form-control" id="date" name="date" required>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="morning_schedule">上午时段：</label>
                <select class="form-control" id="morning_schedule" name="morning_schedule" required>
                    <option value="">请选择</option>
                    <option value="8:00-8:40">8:00-8:40</option>
                    <option value="8:50-9:30">8:50-9:30</option>
                    <option value="9:40-10:20">9:40-10:20</option>
                    <option value="10:30-11:10">10:30-11:10</option>
                    <option value="11:20-12:00">11:20-12:00</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="morning_quota">上午号数：</label>
                <input type="number" class="form-control" id="morning_quota" name="morning_quota" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="afternoon_schedule">下午时段：</label>
                <select class="form-control" id="afternoon_schedule" name="afternoon_schedule" required>
                    <option value="">请选择</option>
                    <option value="13:30-14:10">13:30-14:10</option>
                    <option value="14:20-15:00">14:20-15:00</option>
                    <option value="15:10-15:50">15:10-15:50</option>
                    <option value="16:00-16:40">16:00-16:40</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="afternoon_quota">下午号数：</label>
                <input type="number" class="form-control" id="afternoon_quota" name="afternoon_quota" required>
            </div>
        </div>
        <button type="button" class="btn btn-primary" id="save">保存</button>
        <button type="button" class="btn btn-secondary" id="reset">重置</button>
    </form>
    <h3 class="text-center my-4">医生排班信息</h3>
    <table class="table table-bordered table-striped" id="scheduleList">
        <thead>
        <tr>
            <th>日期</th>
            <th>上午时段</th>
            <th>上午号数</th>
            <th>下午时段</th>
            <th>下午号数</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    var listTitle;
    var listDepartment;
    var listDoctors;
    var $tbody = $("#scheduleList tbody");

    $(function() {
        $("#select").click(loadSchedules);
        $("#reset").click(reset);
        loadDepartments();
        loadTitle();
        loadDoctors();
        $("#select_keshi").change(loadTitle);
        $("#select_zhicheng").change(loadDoctors);
    });

    // 加载科室信息
    function loadDepartments() {
        $.ajax({
            url: 'common/list.do',
            type: 'post',
            data: {
                "name": "科室"
            },
            dataType: 'JSON',
            success: function(result) {
                if (result.state == 0) {
                    listDepartment = result.data;
                    var $select_keshi = $("#select_keshi");
                    $select_keshi.empty();
                    if (listDepartment.length > 0) {
                        for (var i = 0; i < listDepartment.length; i++) {
                            var common = listDepartment[i];
                            var $option = "<option value='" + common.value + "'>" + common.name + "</option>";
                            $select_keshi.append($option);
                        }
                    }
                }
            }
        });
    }

    // 加载医生职称信息
    function loadTitle() {
        $.ajax({
            url: 'common/list.do',
            type: 'post',
            data: {
                "name": "职称"
            },
            dataType: 'JSON',
            success: function(result) {
                if (result.state == 0) {
                    listTitle = result.data;
                    var $select_zhicheng = $("#select_zhicheng");
                    $select_zhicheng.empty();
                    if (listTitle.length > 0) {
                        for (var i = 0; i < listTitle.length; i++) {
                            var common = listTitle[i];
                            var $option = "<option value='" + common.value + "'>" + common.name + "</option>";
                            $select_zhicheng.append($option);
                        }
                    }
                }
            }
        });
    }

    // 加载医生信息
    function loadDoctors() {
        var department = $("#select_keshi").val();
        var title = $("#select_zhicheng").val();

        var data = {
            "department": department,
            "title": title
        };

        $.ajax({
            url: 'doctor/doctorQuery.do',
            type: 'post',
            data: data,
            dataType: 'JSON',
            success: function(result) {
                if (result.state == 0) {
                    var doctors = result.data;
                    var $select_doctorName = $("#select_doctorName");
                    $select_doctorName.empty();
                    if (doctors.length > 0) {
                        for (var i = 0; i < doctors.length; i++) {
                            var doctor = doctors[i];
                            var $option = "<option value='" + doctor.id + "'>" + doctor.name + "</option>";
                            $select_doctorName.append($option);
                        }
                    } else {
                        $select_doctorName.append("<option value=''>未找到医生</option>");
                    }
                }
            }
        });
    }

    // 加载排班信息
    function loadSchedules() {
        var department = $("#select_keshi").val();
        var title = $("#select_zhicheng").val();

        var data = {
            "department": department,
            "title": title
        };

        $.ajax({
            url: 'schedule/scheduleQuery.do',
            type: 'post',
            data: data,
            dataType: 'JSON',
            success: function(result) {
                if (result.state == 0) {
                    var schedules = result.data;
                    $tbody.empty();
                    if (schedules.length > 0) {
                        for (var i = 0; i < schedules.length; i++) {
                            var schedule = schedules[i];
                            var $tr = $("<tr>" +
                                "<td>" + schedule.date + "</td>" +
                                "<td>" + schedule.morningPeriod + "</td>" +
                                "<td>" + schedule.morningNumber + "</td>" +
                                "<td>" + schedule.afternoonPeriod + "</td>" +
                                "<td>" + schedule.afternoonNumber + "</td>" +
                                "</tr>");
                            $tbody.append($tr);
                        }
                    } else {
                        alert("未找到排班信息！");
                    }
                }
            }
        });
    }

    function reset() {
        $("#select_keshi").val("");
        $("#select_zhicheng").val("");
    }
</script>
</html>
