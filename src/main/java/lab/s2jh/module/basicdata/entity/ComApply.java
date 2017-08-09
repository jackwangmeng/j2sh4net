package lab.s2jh.module.basicdata.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
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
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "competition_apply")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "id",scope = ComApply.class)
@MetaData(value = "竞赛申请")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ComApply extends PersistableEntity<Long> {
    private static final long serialVersionUID = 2544390748513253055L;

    @Id
    @MetaData("主键")
    @GeneratedValue(generator = "idGenerator")
    @GenericGenerator(name = "idGenerator", strategy = "native")
    @JsonProperty
    private Long id;

    @MetaData(value = "竞赛名称")
    @Column(length = 64,nullable = false)
    private String comName;

    @MetaData(value = "申请负责人")
    @OneToMany(mappedBy = "comApply",cascade = CascadeType.ALL)
    private List<Competitioner> competitionerList;

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

    @MetaData(value = "竞赛举办地点")
    @Column(length = 64,nullable = true)
    private String comLocal;

    @MetaData(value = "审核状态",comments = "从数据词典中定义的状态")
    @Column(length = 32,nullable = false)
    private String checkState;

    @MetaData(value = "是否区分专业组")
    @Column(length =1,nullable = false)
    private Boolean professional;

    @MetaData(value = "参赛形式")
    @Column(length =1,nullable = false)
    private Boolean comRace;

    @Override
    public String getDisplay() {
        return null;
    }
}
