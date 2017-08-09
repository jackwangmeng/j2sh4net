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

@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "competition_arrange")
@MetaData(value = "竞赛安排")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ComArrange extends BaseNativeEntity {
    private static final long serialVersionUID = 512335968914828057L;

    @MetaData(value = "竞赛安排名称")
    @Column(length = 64,nullable = true)
    private String arrangeName;

    @MetaData(value = "竞赛安排内容")
    @Column(length = 255,nullable = true)
    private String arrangeContext;

    @MetaData(value = "竞赛计划ID")
    @JoinColumn(name = "comPlan_id")
    private ComPlan comPlan;

    @MetaData(value = "安排开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonSerialize(using = ShortDateTimeJsonSerializer.class)
    private Date arrangeStartTime;

    @MetaData(value = "安排结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonSerialize(using = ShortDateTimeJsonSerializer.class)
    private Date arrangeOverTime;

    @MetaData(value = "安排地点")
    @Column(length = 64,nullable = true)
    private String arrangeLocal;
}
