<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>配置属性管理</title>
</head>
<body>
<div class="row search-form-default">
    <div class="col-md-12">
        <form method="get" class="form-inline form-validation form-search-init control-label-sm"
              data-grid-search="#grid-basicdata-teacher-manage-index">
            <div class="form-group">
                <div class="controls controls-clearfix">
                    <input type="text" name="search['CN_teacherCode_OR_trueName_OR_authGuid']" class="form-control input-large"
                           placeholder="工号，姓名，用户名...">
                </div>
            </div>
            <div class="form-group search-group-btn">
                <button class="btn green" type="submmit">
                    <i class="m-icon-swapright m-icon-white"></i>&nbsp; 查&nbsp;询
                </button>
                <button class="btn default" type="reset">
                    <i class="fa fa-undo"></i>&nbsp; 重&nbsp;置
                </button>
            </div>
        </form>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <table id="grid-basicdata-teacher-manage-index"></table>
    </div>
</div>

<script type="text/javascript">
    $(function() {
        $("#grid-basicdata-teacher-manage-index").data("gridOptions", {
            url : WEB_ROOT + '/admin/basicdata/teacherManage/list',
            colModel : [ {
                label : '工号',
                name : 'teacherCode',
                width : 60,
                fixed : true,
                align : 'center'
            }, {
                label : '姓名',
                name : 'name',
                width : 80,
                editable : true,
                align : 'left'
            }, {
                label : '用户名',
                name : 'userName',
                width : 60,
                align : 'left'
            }, {
                label : '密码',
                name : 'password',
                width : 60
            }, {
                label : '所属院系',
                name : 'platform',
                width : 100
            }, {
                label : '电子邮箱',
                name : 'email',
                width : 60
            }, {
                label : '性别',
                name : 'sex',
                width : 60,
                editable : true
            }, {
                label : '入职时间',
                name : 'time',
                formatter : 'timestamp',
                editable : true,
                editoptions : {
                    time : true
                },
                formatoptions : {
                    srcformat : 'Y-m-d H:i',
                    newformat : 'Y-m-d H:i'
                },
                align : 'center'
            }],
            editurl : WEB_ROOT + '/admin/basicdata/teacherManage/edit',
            inlineNav : {
                add : false
            },
            multiselect : false,
            editrulesurl : WEB_ROOT + '/admin/util/validate?clazz=${clazz}',
            fullediturl : WEB_ROOT + "/admin/basicdata/teacherManage/edit",
            delurl : WEB_ROOT + '/admin/basicdata/teacherManage/delete'
        });
    });
</script>
</body>
</html>