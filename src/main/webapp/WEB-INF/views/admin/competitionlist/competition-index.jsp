<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        $(function(){
            $("#grid-competitionlist-competititon-list-index").jqGrid({
                url: WEB_ROOT + '/admin/competitionlist/competition/list' ,
                datatype: "json",
                mtype : "get",
             /*   原有的*/
               /* mtype : "post",*/
                height: 250,
                colNames:['competitionName','petitioner', 'applyTime', 'startTime','overTime','checkState'],
                colModel:[{
                    label : '竞赛名称',
                    name : 'competitionName',
                    width : 200,
                    fixed : true,
                    align : 'center'//这个表示填到里边的字居中
                },  {
                    label : '申请人',
                    name : 'petitioner',
                    width : 200,
                    fixed : true,
                    align : 'center'
                }],
                sortname:'id',
                sortorder:'asc',
                viewrecords:true,
                rowNum:10,
                rowList:[10,20,30],
                prmNames : {
                    search : "search"
                },
                jsonReader : {
                    root : "rows",
                    page: "page",
                    total: "total",
                    records : "records",
                    repeatitems : false
                },
                pager:"#gridPager",
                caption: "jqgrid CRUD demo",
                hidegrid : false
            });

            $('#grid-competitionlist-competititon-list-index').jqGrid('navGrid','#gridPager',{
                refresh:true,
                edit:true,
                add:true,
                del:true,
                search:false,
                addfunc:openDialog4Adding,
                editfunc:openDialog4Updating,
                delfunc:openDialog4Deleting
            });

            //配置对话框
            $("#consoleDlg").dialog({
                autoOpen:false,
                modal:true      //设置对话框为模态对话框

            });

        });

        var openDialog4Adding = function() {
            var consoleDlg = $("#consoleDlg");
            consoleDlg.find("input").removeAttr("disabled").val("");
            consoleDlg.dialog({
                title:"新增",
                resizable:false,
                width:480,
                buttons:{
                    "取消":function(){
                        $("#consoleDlg").dialog("close");
                    },
                    "新增":addItem
                }
            });
            consoleDlg.dialog("open");
        };

        var openDialog4Updating = function() {
            var consoleDlg = $("#consoleDlg");
            consoleDlg.find("input").removeAttr("disabled");
            consoleDlg.dialog({
                title:"修改",
                resizable:false,
                width:480,
                buttons:{
                    "取消":function(){
                        $("#consoleDlg").dialog("close");
                    },
                    "修改":editItem
                }
            });

            loadSelectedRowData();
            consoleDlg.dialog("open");

        };

        var openDialog4Deleting = function() {
            var consoleDlg = $("#consoleDlg");
            consoleDlg.find("input").attr("disabled", true);
            consoleDlg.dialog({
                title:"删除",
                resizable:false,
                width:480,
                buttons:{
                    "取消":function(){
                        $("#consoleDlg").dialog("close");
                    },
                    "删除":deleteItem
                }
            });
            loadSelectedRowData();
            consoleDlg.dialog("open");
        };

        var loadSelectedRowData = function(){
            var selectedRowId = $("#grid-competitionlist-competititon-list-index").jqGrid("getGridParam", "selrow");
            //获得当前行各项属性
            var rowData = $("#grid-competitionlist-competititon-list-index").jqGrid("getRowData",selectedRowId);

            if (!selectedRowId) {
                alert("请先选择需要编辑的行!");
                return false;
            } else {
                var consoleDlg = $("#consoleDlg");
                consoleDlg.find("#invdate").val(rowData.competitionName);
                consoleDlg.find("#name").val(rowData.petitioner);

            }
        };

        var openDialog4Deleting = function() {
            var consoleDlg = $("#consoleDlg");
            consoleDlg.find("input").attr("disabled", true);

            consoleDlg.dialog({
                title:"删除",
                resizable:false,
                width:480,
                buttons:{
                    "取消":function(){
                        $("#consoleDlg").dialog("close");
                    },
                    "删除":deleteItem
                }
            });
            loadSelectedRowData();
            consoleDlg.dialog("open");
        };

        var addItem = function(){
            var consoleDlg = $("#consoleDlg");

            var competitionName = $.trim(consoleDlg.find("#competitionName").val());
            var petitioner = $.trim(consoleDlg.find("#petitioner").val());

            var params = {
                "competitionName" : competitionName,
                "petitioner" : petitioner
            };

            $.ajax({
                url:WEB_ROOT + '/admin/competitionlist/competition/add',
                data : params,
                dataType : "json",
                cache : false,
                success : function(response, textStatus) {
                    if (response.message == true) {
                        var dataRow = {
                            competitionName : competitionName,
                            petitioner : petitioner
                        };

                        /*
                         var srcrowid = $("#gridTable").jqGrid("getGridParam",
                         "selrow");
                         */

                        $("#grid-competitionlist-competititon-list-index").jqGrid("addRowData",
                            response.id, dataRow, "last");    //将新行插入到末尾

                        consoleDlg.dialog("close");
                        alert("添加成功!");
                    }else{
                        alert("添加失败!");
                    }
                },
                error : function(textStatus, e) {
                    alert("系统ajax交互错误: " + textStatus);
                }
            });
        };

        var editItem = function(){
            var consoleDlg = $("#consoleDlg");
            var competitionName = $.trim(consoleDlg.find("#competitionName").val());
            var petitioner = $.trim(consoleDlg.find("#petitioner").val());

            var params = {
                "competitionName" : competitionName,
                "petitioner" : petitioner
            };

            $.ajax({
                url:WEB_ROOT + '/admin/competitionlist/competition/edit',
                data : params,
                dataType : "json",
                cache : false,
                success : function(response, textStatus) {
//          alert("id-->" + response.id + "; message-->" + response.message);
                    if (response.message == true) {
                        var dataRow = {
                            "competitionName" : competitionName,
                            "petitioner" : petitioner
                        };

                        /*
                         var srcrowid = $("#gridTable").jqGrid("getGridParam",
                         "selrow");
                         */

                        //将表格中对应记录更新一下
                        $("#grid-competitionlist-competititon-list-index").jqGrid("setRowData", id, dataRow);

                        consoleDlg.dialog("close");
                        alert("修改成功!");
                    }else{
                        alert("修改失败!");
                    }
                },
                error : function(textStatus, e) {
                    alert("系统ajax交互错误: " + textStatus);
                }
            });
        }

        var deleteItem = function(){
            var consoleDlg = $("#consoleDlg");
            var competitionName = $.trim(consoleDlg.find("#competitionName").val());
            var petitioner = $.trim(consoleDlg.find("#petitioner").val());

            var params = {
                "competitionName" : competitionName,
                "petitioner" : petitioner
            };

            $.ajax({
                url : WEB_ROOT + '/admin/competitionlist/competition/delete',
                data : params,
                dataType : "json",
                cache : false,
                success : function(response, textStatus) {
//          alert("id-->" + response.id + "; message-->" + response.message);
                    if (response.message == true) {
                        $("#gridTable").jqGrid("delRowData", id);

                        consoleDlg.dialog("close");
                        alert("删除成功!");
                    }else{
                        alert("删除失败!");
                    }
                },
                error : function(textStatus, e) {
                    alert("系统ajax交互错误: " + textStatus);
                }
            });

        }

    </script>
</head>
<body>
<div class="row search-form-default">
    <div class="col-md-12">
        <form method="get" class="form-inline form-validation form-search-init control-label-sm"
              data-grid-search="#grid-competitionlist-competititon-list-index">
            <div class="form-group">
                <div class="controls controls-clearfix">
                    <input type="text" name="search['CN_competitionName']" class="form-control input-medium" placeholder="竞赛名称...">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label">发布日期</label>
                <div class="controls">
                    <input type="text" name="search['EQ_applyTime']" class="form-control input-small" data-picker="date">
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
        <table id="grid-competitionlist-competititon-list-index"></table>
    </div>
</div>

<div id="gridPager"></div>
<div id="consoleDlg" style="display:none">
    <form id="consoleForm">
        <input type="hidden" id="selectId"/>
        <table class="formTable">
            <tr>
                <th>competitionName</th>
                <td><input type="text" class="textField" id="competitionName" name="competitionName" />
                </td>
            </tr>
            <tr>
                <th>petitioner</th>
                <td><input type="text" class="textField" id="petitioner" name="petitioner" />
                </td>
            </tr>
        </table>
    </form>
</div>
<%--<div id="gridPager"></div>
<script text="text/tavascript">
    jQuery("#grid-competitionlist-competititon-list-index").jqGrid({
        datatype:"local",<!--数据来源：本地数据-->
        height: 500,
        colModel : [ {
            label : '竞赛名称',
            name : 'competitionName',
            width : 200,
            fixed : true,
            align : 'center'//这个表示填到里边的字居中
        },  {
            label : '申请人',
            name : 'petitioner',
            width : 200,
            fixed : true,
            align : 'center'
        }, {
            label : '竞赛申请时间',
            name : 'applyTime',
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
        }, {
                label : '审核状态',
                name : 'checkState',
                width : 60,
                editable : true,
                align : 'center'

        },  {
            label : '操作',
            width : 200,
            editable : true

        }],
        multiselect: false,<!--支持多选-->
        rownumbers: true ,//是否显示行数！！

        rowNum:10, <!--每页能看多少条，比如10条翻一页-->
        sortname:'id',
        sortorder:'asc',
        viewrecords:true,<!--是否显示总记录信息  such as在这个例子中就是总共有几行就写1-12总共12条 -->
        rowList:[5,10,20,30],<!--可以改变每页的条数，比如20条翻一页-->
        pager:"#gridPager",
        pgtext : "第{0}页  总页数 {1}"//页数显示格式


    });
    var mydata=[
        {competitionName:"朱衍静",petitioner :"frozen", applyTime:"2017-2-8",checkState:"0001"},
        {competitionName:"朱衍静",petitioner :"frozen", applyTime:"2017-2-8",checkState:"0001"},
        {competitionName:"朱衍静",petitioner :"frozen", applyTime:"2017-2-8",checkState:"0001"},
        {competitionName:"朱衍静",petitioner :"frozen", applyTime:"2017-2-8",checkState:"0001"},
        {competitionName:"朱衍静",petitioner :"frozen", applyTime:"2017-2-8",checkState:"0001"},
        {competitionName:"朱衍静",petitioner :"frozen", applyTime:"2017-2-8",checkState:"0001"},
        {competitionName:"朱衍静",petitioner :"frozen", applyTime:"2017-2-8",checkState:"0001"}

    ];
    for(var i=0;i<=mydata.length;i++)
        jQuery("#grid-competitionlist-competititon-list-index").jqGrid('addRowData',i+1,mydata[i]);

</script>--%>


</body>
</html>