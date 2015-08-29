<%@ page language="java" pageEncoding="GB18030" %>
<%@ taglib uri="dbfound-tags" prefix="d" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <d:includeLibrary/>
</head>
<script language="javascript">
    function check() {
        if (changeForm.form.isValid()) {
            var objectjson = changeForm.form.getValues();
            if (objectjson.password != objectjson.apassword) {
                alert("您两次输入的管理员密码不一致，请重新输入!");
                return false;
            }
            Ext.Ajax.request({
                url: 'login.execute!updatePassword',
                params: objectjson,
                success: function (response, action) {
                    var obj = Ext.util.JSON.decode(response.responseText);
                    if (obj.success == true) {
                        Ext.Msg.alert('提示', '修改成功！');
                    } else {
                        Ext.Msg.alert('提示', obj.message);
                    }
                },
                failure: function () {
                    Ext.Msg.alert('提示', '修改失败！');
                }
            });
        }
    }
    function reset() {
        changeForm.form.reset();
    }

    function alert(message) {
        Ext.Msg.alert('提示', message);
    }
</script>

<body>
<d:form id="changeForm" width="300" labelWidth="70">
    <d:line columnWidth="1">
        <d:field prompt="原密码" required="true" width="180" name="ypassword" editor="password">
            <d:event name="enter" handle="check"/>
        </d:field>
    </d:line>
    <d:line columnWidth="1">
        <d:field prompt="新密码" required="true" width="180" name="password" editor="password">
            <d:event name="enter" handle="check"/>
        </d:field>
    </d:line>
    <d:line columnWidth="1">
        <d:field prompt="确认密码" required="true" width="180" name="apassword" editor="password">
            <d:event name="enter" handle="check"/>
        </d:field>
    </d:line>
</d:form>
<d:buttonGroup align="center">
    <d:button click="check" title="保存" icon="DBFoundUI/images/save.gif"/>
    <d:button title="重置" click="reset"/>
</d:buttonGroup>
</body>
</html>
