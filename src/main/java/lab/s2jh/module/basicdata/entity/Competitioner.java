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

@Setter
@Getter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class,property = "id",scope = Competitioner.class)
@ToString(exclude = "comApply")
@Entity
@Table(name = "competition_petitioner")
@MetaData(value = "竞赛负责人")
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
public class Competitioner extends PersistableEntity<Long> {
    private static final long serialVersionUID = 512335968914828057L;

    @Id
    @MetaData("主键")
    @GeneratedValue(generator = "idGenerator")
    @GenericGenerator(name = "idGenerator", strategy = "native")
    @JsonProperty
    private Long id;

    @MetaData(value = "教师")
    @OneToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "petitioner_id")
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
    public ComApply getComApply(){
        return comApply;
    }
}
