package lab.s2jh.module.basicdata.service;

import lab.s2jh.core.dao.jpa.BaseDao;
import lab.s2jh.core.service.BaseService;
import lab.s2jh.module.basicdata.dao.TeacherBeanCfgDao;
import lab.s2jh.module.basicdata.entity.TeacherBeanCfg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by wangmeng on 2017/7/17.
 */
@Service
@Transactional
public class TeacherBeanCfgService extends BaseService<TeacherBeanCfg,Long> {
    private static Logger logger = LoggerFactory.getLogger(TeacherBeanCfgService.class);

    @Autowired
    private TeacherBeanCfgDao teacherBeanCfgDao;



    public List<TeacherBeanCfg> findAll(){
        return teacherBeanCfgDao.findAll();
    }

    @Transactional
    public TeacherBeanCfg findById(Long id){
        return teacherBeanCfgDao.findById(id);
    }

    public Integer countByTeacherManage(TeacherBeanCfg teacherBeanCfg){
        return teacherBeanCfgDao.countyByTeacherManage(teacherBeanCfg.getId());
    }


    public boolean deleteTeacher(Long id){
        teacherBeanCfgDao.delete(id);
        return true;
    }

    @Override
    protected BaseDao<TeacherBeanCfg, Long> getEntityDao() {
        return teacherBeanCfgDao;
    }
}
