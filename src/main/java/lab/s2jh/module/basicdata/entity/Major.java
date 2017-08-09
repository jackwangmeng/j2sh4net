package lab.s2jh.module.basicdata.entity;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
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
@Table(name = "basic_major")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id",scope = Major.class)
@MetaData(value = "专业")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Audited
public class Major extends BaseNativeEntity implements Comparable<Major>{

    private static final long serialVersionUID = -7634994834209530394L;

    @MetaData(value = "代码",comments = "代码本身具有层级信息,用于进行从属权限控制")
    @Size(min = 10)
    @Column(nullable = true,length = 255,unique = true)
    private String code;

    @MetaData(value = "名称")
    @Column(nullable = false,length = 64)
    private String name;

    @MetaData(value = "所属学院")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "college_id")
    private College college;


    @Override
    public int compareTo(Major o) {
        return CompareToBuilder.reflectionCompare(o.getCode(),this.getCode());
    }
}
