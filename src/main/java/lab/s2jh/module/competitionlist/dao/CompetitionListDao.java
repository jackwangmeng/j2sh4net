package lab.s2jh.module.competitionlist.dao;

import lab.s2jh.core.dao.jpa.BaseDao;
import lab.s2jh.module.competitionlist.entity.CompetitionListCfg;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import javax.persistence.QueryHint;
import java.util.List;

/**
 * Created by wangmeng on 2017/7/25.
 */
@Repository
public interface CompetitionListDao extends BaseDao<CompetitionListCfg,Long> {

    @Query("from CompetitionListCfg")
    @QueryHints({ @QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE,value = "true")})
    List<CompetitionListCfg> findAll();

    @QueryHints({@QueryHint(name = org.hibernate.jpa.QueryHints.HINT_CACHEABLE,value = "true")})
    CompetitionListCfg findById(Long id);


}
