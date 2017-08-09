package lab.s2jh.module.basicdata.entity;

import lab.s2jh.core.annotation.MetaData;
import lab.s2jh.core.entity.BaseNativeEntity;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.builder.CompareToBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.envers.Audited;

import javax.persistence.*;
import javax.validation.constraints.Size;

/**
 * Created by wangmeng on 2017/7/24.
 */
@Getter
@Setter
@Access(AccessType.FIELD)
@Entity
@Table(name = "basic_college")
@MetaData(value = "学院")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Audited
public class College extends BaseNativeEntity implements Comparable<College> {

    private static final long serialVersionUID = -7634994834209530394L;

    @MetaData(value = "代码",comments = "代码本身具有层次信息，用于进行从属权限控制")
    @Size(min = 10)
    @Column(nullable = true,length = 255,unique = true)
    private String code;

    @MetaData("学院名称")
    @Column(length = 64,nullable = false)
    private String platform;

    @Override
    public int compareTo(College o) {
        return CompareToBuilder.reflectionCompare(o.getCode(),this.getCode());
    }
}
