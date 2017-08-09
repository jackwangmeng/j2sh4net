package lab.s2jh.module.competitionlist.service;

import lab.s2jh.core.dao.jpa.BaseDao;
import lab.s2jh.core.service.BaseService;
import lab.s2jh.module.competitionlist.dao.CompetitionListDao;
import lab.s2jh.module.competitionlist.entity.CompetitionListCfg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * Created by wangmeng on 2017/7/25.
 */
@Service
public class CompetitionListService extends BaseService<CompetitionListCfg,Long> {

    private static Logger logger = LoggerFactory.getLogger(CompetitionListService.class);

    @Autowired
    private CompetitionListDao competitionListDao;

    @Override
    protected BaseDao<CompetitionListCfg, Long> getEntityDao() {
        return competitionListDao;
    }

    public List<CompetitionListCfg> findAll(){
        return competitionListDao.findAll();
    }

    @Transactional
    public CompetitionListCfg findById(Long id){
        return competitionListDao.findById(id);
    }
}
