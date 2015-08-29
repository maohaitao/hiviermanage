<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib uri="dbfound-tags" prefix="d" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <d:includeLibrary/>
</head>
<script type="text/javascript">

    function query() {
        jobGrid.query();
    }

    function reset() {
        queryForm.form.reset();
    }

    function openAddWindow() {
        url = "${basePath}modules/job/newJob.jsp";
        DBFound.open("update_window", "作业新增", 650, 320, url, function () {
            jobGrid_ds.reload();
        });
    }

    function gotoDetail(value, meta, record) {
        return "<a href = javaScript:openUpdateWindow('" + record.json.header_id + "','" + record.json.line_id + "')>" + value + "</a>";
    }

    function openUpdateWindow(id, line_id) {
        var url = "modules/job/showMyJob.jsp?header_id=" + id + "&line_id=" + line_id;
        url = "${basePath}" + url;
        DBFound.open("history_window", "作业明细", 850, 470, url);
    }

    function upAttuchement(value, meta, record) {
        return "<a href = javaScript:openAttWindow('" + record.json.header_id + "','" + record.json.status_code + "')>附件(" + value + ")</a>";
    }

    function openAttWindow(id, status) {
        var url = "uploadShow.jsp?pk_value=" + id + "&table_name=job_headers";
        DBFound.open("att_window", "附件查看", 685, 360, url);
    }
</script>
<body>
<d:initProcedure>
    <d:dataSet id="course_ds" modelName="fnd/course" queryName="student_combo"/>
    <d:dataSet id="statusStore" modelName="job/jobStatus" queryName="combo"/>
</d:initProcedure>

<d:form id="queryForm" title="我的历史作业" labelWidth="90">
    <d:line columnWidth="0.33">
        <d:field name="title" editor="textfield" prompt="作业题目">
            <d:event name="enter" handle="query"/>
        </d:field>
        <d:field name="course_id" options="course_ds" valueField="course_id" displayField="course_name" editor="combo"
                 prompt="课程选择"/>
        <d:field name="status_code" editor="combo" options="statusStore" displayField="status_name"
                 valueField="status_code" prompt="作业状态"/>
    </d:line>
    <d:line columnWidth="0.33">
        <d:field name="timefrom" editor="datefield" prompt="布置时间从"/>
        <d:field name="timeto" editor="datefield" prompt="布置时间到"/>
    </d:line>
</d:form>
<d:buttonGroup>
    <d:button id="query" title="查询" click="query"/>
    <d:button title="重置" click="reset"/>
</d:buttonGroup>
<d:grid id="jobGrid" title="作业列表" height="350" selectable="true" queryForm="queryForm"
        queryUrl="job/jobLine.query!query_all" autoQuery="true">
    <d:toolBar>
        <d:gridButton type="excel"></d:gridButton>
    </d:toolBar>
    <d:columns>
        <d:column name="title" renderer="gotoDetail" prompt="作业题目" width="130"/>
        <d:column name="line_status_name" align="center" width="70" prompt="完成状态"/>
        <d:column name="class_name" width="120" prompt="班级"/>
        <d:column name="course_name" width="160" prompt="学科选择"/>
        <d:column name="end_time" width="80" prompt="完成时间"/>
        <d:column name="status_name" width="70" prompt="作业状态"/>
        <d:column name="teacher_name" prompt="布置老师" width="70"/>
        <d:column name="create_date" prompt="布置时间" width="80"/>
        <d:column name="att_num" align="center" renderer="upAttuchement" prompt="作业附件" width="70"/>
    </d:columns>
</d:grid>
</body>
</html>
