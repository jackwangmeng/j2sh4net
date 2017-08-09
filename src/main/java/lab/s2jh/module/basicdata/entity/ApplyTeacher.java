package lab.s2jh.module.basicdata.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lab.s2jh.core.annotation.MetaData;
import lab.s2jh.core.entity.PersistableEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by wangmeng on 2017/7/30.
 */
@Setter
@Getter
@Accessors(chain = true)
@Access(value = AccessType.FIELD)
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "id",scope = ApplyTeacher.class)
@ToString(exclude = "comApply")
@Entity
@Table(name = "basicdata_applyteacher")
@MetaData(value = "申请负责人")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ApplyTeacher extends PersistableEntity<Long> {
    private static final long serialVersionUID = 512335968914828057L;

    @Id
    @MetaData("主键")
    @GeneratedValue(generator = "idGenerator")
    @GenericGenerator(name = "idGenerator", strategy = "native")
    @JsonProperty
    private Long id;

    @MetaData(value = "教师")
    @OneToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(name = "applyteacher_id")
    private Teacher teacher;

    @MetaData(value = "竞赛申请")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "comApply")
    private ComApply comApply;

    @Override
    public String getDisplay() {
        return null;
    }

    @JsonIgnore
    public ComApply getComApply() {
        return comApply;
    }
}
