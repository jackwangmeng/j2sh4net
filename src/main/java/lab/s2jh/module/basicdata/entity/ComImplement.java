package lab.s2jh.module.basicdata.entity;

import lab.s2jh.core.annotation.MetaData;
import lab.s2jh.core.entity.BaseNativeEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.Table;

@Setter
@Getter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "competition_implement")
@MetaData(value = "竞赛实施")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ComImplement extends BaseNativeEntity {
    private static final long serialVersionUID = 512335968914828057L;


}
