<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset=UTF-8">
    <title>Dashboard</title>
</head>
<%--
<body>
<div class="note note-info">
    <h3>常用工具</h3>
</div>
<div>
    <ul>
        <li>
            <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon01.png" alt=""></a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon02.png" alt=""></a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon03.png" alt=""></a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon04.png" alt=""></a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon05.png" alt=""></a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon06.png" alt=""></a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon07.png" alt=""></a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
        </li>
        <li>
            <a href="javascript:;">通知公告</a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;">知识库</a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;">密码修改</a>&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;">待办事务</a>&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;">添加竞赛</a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;">网络硬盘</a>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
            <a href="javascript:;">参数信息</a>
        </li>
    </ul>
</div>
<div class="row">
    <div class="col-md-3">
        <div class="dashboard-stat yellow">
            <div class="visual">
                <i class="fa fa-bullhorn"></i>
            </div>
            <div class="details">
                <div class="number number-notify-message-count">-</div>
                <div class="desc">未读公告消息</div>
            </div>
            <a href="javascript:;" rel="address:/admin/profile/notify-message|公告消息列表" class="more">
                View more <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="col-md-3">
        <div class="dashboard-stat blue">
            <div class="visual">
                <i class="fa fa-envelope"></i>
            </div>
            <div class="details">
                <div class="number number-user-message-count">-</div>
                <div class="desc">未读个人消息</div>
            </div>
            <a href="javascript:;" rel="address:/admin/profile/user-message|个人消息列表" class="more">
                View more <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat green">
            <div class="visual">
                <i class="fa fa-shopping-cart"></i>
            </div>
            <div class="details">
                <div class="number">549</div>
                <div class="desc">New Orders</div>
            </div>
            <a href="#" class="more">
                View more <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat purple">
            <div class="visual">
                <i class="fa fa-globe"></i>
            </div>
            <div class="details">
                <div class="number">+89%</div>
                <div class="desc">Brand Popularity</div>
            </div>
            <a href="#" class="more">
                View more <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
</div>

<div class="well well-large">
    <h3>项目简介</h3>
    <p>
        集结最新主流时尚开源技术的面向互联网Web应用的整合前端门户站点、HTML5移动站点及后端管理系统一体的的基础开发框架，提供一个J2EE相关主流开源技术架构整合及一些企业应用基础通用功能和组件的设计实现的最佳实践和原型参考。</p>
</div>
<c:if test="${cfg.dev_mode}">
    <div class="alert alert-block alert-info fade in">
        <h4 class="alert-heading">
            提示说明:
            <small>当前界面内容只有在开发模式(dev_mode=true)才会显示！</small>
        </h4>
        <div class="row">
            <div class="col-md-12">
                <div class="list-group">
                    <a class="list-group-item" href="${ctx}/docs/markdown/README" target="_blank">
                        <h4 class="list-group-item-heading">开发框架介绍与开发指南</h4>
                        <p class="list-group-item-text">对整个开发框架整体的设计说明和开发指南。</p>
                    </a>
                    <a class="list-group-item" href="javascript:;" rel="address:/docs/ui-feature/items|UI组件用法示例">
                        <h4 class="list-group-item-heading">UI组件用法示例</h4>
                        <p class="list-group-item-text">针对典型的UI组件，提供一个基本的用法示意参考，结合对应的JSDoc文档了解相关UI组件的用法和支持的功能属性。</p>
                    </a>
                    <a class="list-group-item" href="${ctx}/docs/jsdoc/global.html" target="_blank">
                        <h4 class="list-group-item-heading">Javascript注释JSDoc文档</h4>
                        <p class="list-group-item-text">基于框架主要Javascript代码文件注释，用jsdoc3-maven-plugin生成的UI组件用法参考文档。</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</c:if>
<script type="text/javascript">
    $(function () {
        AdminGlobal.updateMessageCount();
    });
</script>
</body>
<body>
<div class="note note-info">
    <h4 class="block">提示说明</h4>
    <p>以下Dashboard内容定义主要是演示效果之用，实际需要根据项目业务需求定制设计开发。</p>
</div>
<div class="row">
    <div class="col-md-3">
        <div class="dashboard-stat yellow">
            <div class="visual">
                <i class="fa fa-bullhorn"></i>
            </div>
            <div class="details">
                <div class="number number-notify-message-count">-</div>
                <div class="desc">未读公告消息</div>
            </div>
            <a href="javascript:;" rel="address:/admin/profile/notify-message|公告消息列表" class="more">
                View more <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="col-md-3">
        <div class="dashboard-stat blue">
            <div class="visual">
                <i class="fa fa-envelope"></i>
            </div>
            <div class="details">
                <div class="number number-user-message-count">-</div>
                <div class="desc">未读个人消息</div>
            </div>
            <a href="javascript:;" rel="address:/admin/profile/user-message|个人消息列表" class="more">
                View more <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat green">
            <div class="visual">
                <i class="fa fa-shopping-cart"></i>
            </div>
            <div class="details">
                <div class="number">549</div>
                <div class="desc">New Orders</div>
            </div>
            <a href="#" class="more">
                View more <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="dashboard-stat purple">
            <div class="visual">
                <i class="fa fa-globe"></i>
            </div>
            <div class="details">
                <div class="number">+89%</div>
                <div class="desc">Brand Popularity</div>
            </div>
            <a href="#" class="more">
                View more <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
</div>
<div class="well well-large">
    <h3>项目简介</h3>
    <p>
        集结最新主流时尚开源技术的面向互联网Web应用的整合前端门户站点、HTML5移动站点及后端管理系统一体的的基础开发框架，提供一个J2EE相关主流开源技术架构整合及一些企业应用基础通用功能和组件的设计实现的最佳实践和原型参考。</p>
</div>
<c:if test="${cfg.dev_mode}">
    <div class="alert alert-block alert-info fade in">
        <h4 class="alert-heading">
            提示说明:
            <small>当前界面内容只有在开发模式(dev_mode=true)才会显示！</small>
        </h4>
        <div class="row">
            <div class="col-md-12">
                <div class="list-group">
                    <a class="list-group-item" href="${ctx}/docs/markdown/README" target="_blank">
                        <h4 class="list-group-item-heading">开发框架介绍与开发指南</h4>
                        <p class="list-group-item-text">对整个开发框架整体的设计说明和开发指南。</p>
                    </a>
                    <a class="list-group-item" href="javascript:;" rel="address:/docs/ui-feature/items|UI组件用法示例">
                        <h4 class="list-group-item-heading">UI组件用法示例</h4>
                        <p class="list-group-item-text">针对典型的UI组件，提供一个基本的用法示意参考，结合对应的JSDoc文档了解相关UI组件的用法和支持的功能属性。</p>
                    </a>
                    <a class="list-group-item" href="${ctx}/docs/jsdoc/global.html" target="_blank">
                        <h4 class="list-group-item-heading">Javascript注释JSDoc文档</h4>
                        <p class="list-group-item-text">基于框架主要Javascript代码文件注释，用jsdoc3-maven-plugin生成的UI组件用法参考文档。</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</c:if>
<script type="text/javascript">
    $(function () {
        AdminGlobal.updateMessageCount();
    });
</script>


</body>
</html>--%>
<body>
<div class="article toolbar">
    <div class="title ue-clear">
        <h2>常用工具</h2>
        <a href="javascript:;" class="more">更多</a>
    </div>
    <div class="content">
        <ul class="toollist ue-clear">
            <li>
                <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon01.png" /></a>
                <p><a href="javascript:;">通知公告</a></p>
            </li>
            <li>
                <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon02.png" /></a>
                <p><a href="javascript:;">知识库</a></p>
            </li>
            <li>
                <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon03.png" /></a>
                <p><a href="javascript:;">密码修改</a></p>
            </li>
            <li>
                <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon04.png" /></a>
                <p><a href="javascript:;">日程安排</a></p>
            </li>
            <li>
                <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon05.png" /></a>
                <p><a href="javascript:;">添加文章</a></p>
            </li>
            <li>
                <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon06.png" /></a>
                <p><a href="javascript:;">网络硬盘</a></p>
            </li>
            <li>
                <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon07.png" /></a>
                <p><a href="javascript:;">参数信息</a></p>
            </li>
            <li>
                <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon08.png" /></a>
                <p><a href="javascript:;">回收站</a></p>
            </li>
            <li>
                <a href="javascript:;" class="img"><img src="${ctx}/assets/admin/img/oa/icon09.png" /></a>
                <p><a href="javascript:;">系统配置</a></p>
            </li>
            <li class="add-btn">
                <img src="${ctx}/assets/admin/img/oa/add.png" />
            </li>
        </ul>

    </div>
</div>
<div class="article half notice">
    <div class="wrap-l">
        <div class="title ue-clear">
            <h2>通知公告</h2>
            <a href="javascript:;" class="more">更多</a>
        </div>
        <div class="content">
            <ul class="notice-list">
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">中国移动关于设立作风建设监督举报电话的公告</a>
                    <div class="notice-time">05-08</div>
                </li>
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">关于公示全市中国移动办公生产双主体责任名单的通知</a>
                    <div class="notice-time">05-08</div>
                </li>
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">南京市中国移动支付系统安全管理责任人名单</a>
                    <div class="notice-time">05-08</div>
                </li>
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">2014年全市通信行业安全生产工作要点</a>
                    <div class="notice-time">05-08</div>
                </li>
                <li class="ue-clear">
                    <a href="javascript:;" class="notice-title">中国移动南京公司关于表彰各位员工的规定</a>
                    <div class="notice-time">05-08</div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="article half matter">
    <div class="wrap-r">
        <div class="title ue-clear">
            <h2 class="title-list">
                <ul class="ue-clear">
                    <li class="current"><a href="javascript:;">待办事项</a></li>
                    <li><a href="javascript:;">已办事项</a></li>
                </ul>
            </h2>
            <a href="javascript:;" class="more">更多</a>
        </div>
        <div class="content">
            <div class="matter-content current ue-clear">
                <div class="today">
                    <p class="year">2014年5月</p>
                    <p class="date">10</p>
                </div>
                <ul class="matter-list">
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">下午2点中国移动召开2014年工作会议</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">上交本年度市局工作报告提纲</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">领取南京政府办公室公务员津贴</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">南京2014年全国移动技术投标大会报名事宜</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">参加市政府举办的互动活动并宣传单位</a>
                    </li>
                </ul>
            </div>
            <div class="matter-content ue-clear">
                <div class="today">
                    <p class="year">2014年5月</p>
                    <p class="date">10</p>
                </div>
                <ul class="matter-list">
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">领取南京政府办公室公务员津贴</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">南京2014年全国移动技术投标大会报名事宜</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">领取南京政府办公室公务员津贴</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">南京2014年全国移动技术投标大会报名事宜</a>
                    </li>
                    <li class="ue-clear">
                        <span class="matter-time">05-08</span>
                        <a href="javascript:;" class="matter-title">参加市政府举办的互动活动并宣传单位</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="article half duty">
    <div class="wrap-l">
        <div class="title ue-clear">
            <h2>领导值岗</h2>
            <a href="javascript:;" class="more">更多</a>
        </div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th class="date">日期</th>
                    <th class="week">星期</th>
                    <th class="leader">值班领导</th>
                    <th class="contact">联系方式</th>
                    <th class="remark">备注</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="date">05-08</td>
                    <td class="week">星期一</td>
                    <td class="leader">刘秀全</td>
                    <td class="contact">139039409876</td>
                    <td class="remark"></td>
                </tr>
                <tr>
                    <td class="date">05-09</td>
                    <td class="week">星期一</td>
                    <td class="leader">刘秀全</td>
                    <td class="contact">139039409876</td>
                    <td class="remark"></td>
                </tr>
                <tr>
                    <td class="date">05-10</td>
                    <td class="week">星期一</td>
                    <td class="leader">刘秀全</td>
                    <td class="contact">139039409876</td>
                    <td class="remark"></td>
                </tr>
                <tr>
                    <td class="date">05-08</td>
                    <td class="week">星期一</td>
                    <td class="leader">刘秀全</td>
                    <td class="contact">139039409876</td>
                    <td class="remark"></td>
                </tr>
                <tr>
                    <td class="date">05-08</td>
                    <td class="week">星期一</td>
                    <td class="leader">刘秀全</td>
                    <td class="contact">139039409876</td>
                    <td class="remark"></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="article half email">
    <div class="wrap-r">
        <div class="title ue-clear">
            <h2>未读邮件</h2>
            <a href="javascript:;" class="more">更多</a>
        </div>
        <div class="content">
            <table>
                <thead>
                <tr>
                    <th class="icon"></th>
                    <th class="sender">发件人</th>
                    <th class="subject">主题</th>
                    <th class="time last-item">时间</th>
                </tr>
                </thead>
                <tbody>
                <tr class="tody">
                    <td colspan="4"><div class="td-wrap"><em>今天</em><a href="javascript:;">(3封)</a></div></td>
                </tr>
                <tr>
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">办公室</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">关于移动所有工作人员薪资调整的说明文件</a></div></td>
                    <td class="time"><div class="td-wrap">22分钟前</div></td>
                </tr>
                <tr>
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">行政部</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">行政廉洁形象建设工程要点会议纪要</a></div></td>
                    <td class="time"><div class="td-wrap">1小时前</div></td>
                </tr>
                <tr class="open">
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">局长</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">部门劳动节放假相关通知</a></div></td>
                    <td class="time"><div class="td-wrap">今天14:23</div></td>
                </tr>
                <tr>
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">自贡水务</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">2014年度所有公务员征税政策文件下载</a></div></td>
                    <td class="time"><div class="td-wrap">今天10:23</div></td>
                </tr>
                <tr>
                    <td class="icon"><div class="td-wrap"></div></td>
                    <td class="sender"><div class="td-wrap">办公室</div></td>
                    <td class="subject"><div class="td-wrap"><a href="javascript:;">关于移动所有工作人员薪资调整的说明文件</a></div></td>
                    <td class="time"><div class="td-wrap">22分钟前</div></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx}/assets/admin/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/assets/admin/js/common.js"></script>
<script type="text/javascript">
    $(".title-list ul").on("click","li",function(){
        var aIndex = $(this).index();
        $(this).addClass("current").siblings().removeClass("current");
        $(".matter-content").removeClass("current").eq(aIndex).addClass("current");
    });

    $(".duty").find("tbody").find("tr:even").css("backgroundColor","#eff6fa");
</script>
</html>