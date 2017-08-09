package lab.s2jh.module.basicdata.dao;

import lab.s2jh.core.dao.jpa.BaseDao;
import lab.s2jh.module.basicdata.entity.TeacherBeanCfg;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import javax.persistence.QueryHint;
import java.util.List;

/**
 * Created by wangmeng on 2017/7/17.
 */
@Repository
public interface TeacherBeanCfgDao extends BaseDao<TeacherBeanCfg,Long> {
    @Query("from TeacherBeanCfg")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE,value = "true")})
    List<TeacherBeanCfg> findAll();

    @QueryHints({@QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE,value = "true")})
    TeacherBeanCfg findById(Long id);

    @Query("select count(nm) from TeacherBeanCfg nm where nm.id=:id")
    @QueryHints({@QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE,value = "true")})
    Integer countyByTeacherManage(@Param("id") Long id);
}
