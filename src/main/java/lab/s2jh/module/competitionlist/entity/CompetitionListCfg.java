package lab.s2jh.module.competitionlist.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lab.s2jh.core.annotation.MetaData;
import lab.s2jh.core.entity.PersistableEntity;
import lab.s2jh.core.web.json.ShortDateTimeJsonSerializer;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.envers.Audited;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by wangmeng on 2017/7/23.
 */
@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "competition_list")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@MetaData(value = "竞赛列表")
@Audited
public class CompetitionListCfg extends PersistableEntity<Long> {

    private static final long serialVersionUID = 2544390748513253055L;


    @MetaData("主键")
    @Id
    @GeneratedValue(generator = "idGenerator")
    @GenericGenerator(name = "idGenerator", strategy = "native")
    @JsonProperty
    private Long id;

    @MetaData(value = "申请人")
    @Column(length = 64,nullable = false)
    private String petitioner;

    @MetaData(value = "竞赛名称")
    @Column(length = 64,nullable = false)
    private String competitionName;

    @MetaData(value = "竞赛申请时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonSerialize(using = ShortDateTimeJsonSerializer.class)
    private Date applyTime;

    @MetaData(value = "开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @Column(nullable = false)
    @JsonSerialize(using = ShortDateTimeJsonSerializer.class)
    private Date startTime;

    @MetaData(value = "结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonSerialize(using = ShortDateTimeJsonSerializer.class)
    private Date overTime;

    @MetaData(value = "审核状态",comments = "从数据词典中定义的状态")
    @Column(length = 32,nullable = false)
    private String checkState;
    
    @Override
    public String getDisplay() {
        return competitionName;
    }
}
