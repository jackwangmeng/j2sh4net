package lab.s2jh.module.basicdata.web;

import lab.s2jh.core.annotation.MenuData;
import lab.s2jh.core.cons.GlobalConstant;
import lab.s2jh.core.service.BaseService;
import lab.s2jh.core.web.BaseController;
import lab.s2jh.core.web.view.OperationResult;
import lab.s2jh.module.basicdata.entity.TeacherBeanCfg;
import lab.s2jh.module.basicdata.service.TeacherBeanCfgService;
import lab.s2jh.module.sys.service.DataDictService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wangmeng on 2017/7/16.
 */
@Controller
@RequestMapping(value = "/admin/basicdata/teacherManage")
public class TeacherManageController extends BaseController<TeacherBeanCfg,Long> {

    @Autowired
    private TeacherBeanCfgService teacherBeanCfgService;

    @Autowired
    private DataDictService dataDictService;

    @MenuData("基础信息管理:教师管理")
    @RequiresPermissions("基础信息管理:教师管理")
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String index(Model model){
        return "admin/basicdata/teacherManage-index";
    }


    @RequiresPermissions("基础信息管理:教师管理")
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public Page<TeacherBeanCfg> findByPage(HttpServletRequest request){
        return super.findByPage(TeacherBeanCfg.class,request);
    }


    @RequiresPermissions("基础信息管理:教师管理")
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String editShow11(Model model){
        model.addAttribute("sexType", dataDictService.findMapDataByRootPrimaryKey(GlobalConstant.DataDict_Sex_Type));
        return "admin/basicdata/teacherManage-inputBasic";
    }

  /*  @MetaData("信息保存")*/
    @RequiresPermissions("基础信息管理:教师管理")
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseBody
    public OperationResult editSave(@ModelAttribute("entity") TeacherBeanCfg entity, Model model){
        return super.editSave(entity);
    }


    @RequiresPermissions("基础信息管理:教师管理")
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody

    public OperationResult deleteTeacher(Long id){
        teacherBeanCfgService.deleteTeacher(id);
        return OperationResult.buildSuccessResult();

}

    @RequiresUser
    @ModelAttribute
    public void prepareModel(HttpServletRequest request,Model model,@RequestParam(value = "id",required = false) Long id){
        super.initPrepareModel(request,model,id);
    }

    @Override
    protected BaseService<TeacherBeanCfg, Long> getEntityService() {
        return teacherBeanCfgService;
    }
}
