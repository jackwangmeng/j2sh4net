package lab.s2jh.module.basicdata.entity;

import lab.s2jh.core.annotation.MetaData;
import lab.s2jh.core.entity.BaseNativeEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "competition_comtest")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ComContest extends BaseNativeEntity {
    private static final long serialVersionUID = 512335968914828057L;

    @MetaData(value = "竞赛申请")
    @OneToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "comapply_id")
    private ComApply comApply;
}
