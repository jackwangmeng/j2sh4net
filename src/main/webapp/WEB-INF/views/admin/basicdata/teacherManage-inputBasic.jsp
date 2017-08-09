<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑教师信息</title>
</head>
<body>
<form:form class="form-horizontal form-bordered form-label-stripped form-validation"
           action="${ctx}/admin/basicdata/teacherManage/edit" method="post" modelAttribute="entity"
           data-editrulesurl="${ctx}/admin/util/validate?clazz=${clazz}">
    <form:hidden path="id" />
    <div class="form-actions">
        <button class="btn green" type="submit" data-grid-reload="#grid-basicdata-teacher-manage-index" data-post-dismiss="modal">保存</button>
        <button class="btn default" type="button" data-dismiss="modal">取消</button>
    </div>
    <div class="form-body">
        <div class="row">
            <div class="col-md-5">
                <div class="form-group">
                    <label class="control-label">工号</label>
                    <div class="controls">
                        <form:input path="teacherCode" class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">姓名</label>
                    <div class="controls">
                        <form:input path="name" class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">用户名</label>
                    <div class="controls">
                        <form:input path="userName" class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">密码</label>
                    <div class="controls">
                        <form:input path="password" class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">所属院系</label>
                    <div class="controls">
                        <form:input path="platform" class="form-control" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label">电子邮件</label>
                    <div class="controls">
                        <form:input path="email" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">性别</label>
                    <div class="controls">
                        <form:select path="sex" items="${sexType}" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">入职时间</label>
                    <div class="controls">
                        <form:input path="time" class="form-control" data-picker="date-time" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-actions right">
        <button class="btn green" type="submit" data-grid-reload="#grid-basicdata-teacher-manage-index" data-post-dismiss="modal">保存</button>
        <button class="btn default" type="button" data-dismiss="modal">取消</button>
    </div>
</form:form>
</body>
</html>
