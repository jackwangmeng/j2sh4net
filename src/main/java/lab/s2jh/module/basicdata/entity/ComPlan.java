package lab.s2jh.module.basicdata.entity;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lab.s2jh.core.annotation.MetaData;
import lab.s2jh.core.entity.BaseNativeEntity;
import lab.s2jh.core.web.json.ShortDateTimeJsonSerializer;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "competition_plan")
@MetaData(value = "竞赛计划")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ComPlan extends BaseNativeEntity {
    private static final long serialVersionUID = 512335968914828057L;

    @MetaData(value = "竞赛列表")
    @OneToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "comcontest_id")
    private ComContest comContest;

    @MetaData(value = "竞赛名称")
    @Column(length = 64,nullable = false)
    private String comPlanName;

    @MetaData(value = "竞赛负责人")
    @OneToMany(mappedBy = "comApply",cascade = CascadeType.ALL)
    private List<Competitioner> competitionerList;

    @MetaData(value = "竞赛申请时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonSerialize(using = ShortDateTimeJsonSerializer.class)
    private Date applyPlanTime;

    @MetaData(value = "开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @Column(nullable = false)
    @JsonSerialize(using = ShortDateTimeJsonSerializer.class)
    private Date startPlanTime;

    @MetaData(value = "结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonSerialize(using = ShortDateTimeJsonSerializer.class)
    private Date overPlanTime;

    @MetaData(value = "竞赛举办地点")
    @Column(length = 64,nullable = true)
    private String comPlanLocal;

    @MetaData(value = "审核状态",comments = "从数据词典中定义的状态")
    @Column(length = 32,nullable = false)
    private String checkState;

    @MetaData(value = "是否区分专业组")
    @Column(length =1,nullable = false)
    private Boolean professional;

    @MetaData(value = "参赛形式")
    @Column(length =1,nullable = false)
    private Boolean comRace;
}
