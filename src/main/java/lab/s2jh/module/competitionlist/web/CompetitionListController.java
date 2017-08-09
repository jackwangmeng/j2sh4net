package lab.s2jh.module.competitionlist.web;

import lab.s2jh.core.annotation.MenuData;
import lab.s2jh.core.service.BaseService;
import lab.s2jh.core.web.BaseController;
import lab.s2jh.module.competitionlist.entity.CompetitionListCfg;
import lab.s2jh.module.competitionlist.service.CompetitionListService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by wangmeng on 2017/7/25.
 */

@Controller
@RequestMapping("/admin/competitionlist/competition")
public class CompetitionListController extends BaseController<CompetitionListCfg,Long> {

    @Autowired
    private CompetitionListService competitionListService;

    @Override
    protected BaseService<CompetitionListCfg, Long> getEntityService() {
        return competitionListService;
    }

    @MenuData("竞赛列表:竞赛列表")
    @RequiresPermissions("竞赛列表:竞赛列表")
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String index(Model model){
        return "admin/competitionlist/competition-index";
    }

    @RequiresPermissions("竞赛列表:竞赛列表")
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public Page<CompetitionListCfg> findByPage(HttpServletRequest request){
        return super.findByPage(CompetitionListCfg.class,request);
    }


}
