package lab.s2jh.module.basicdata.entity;

import lab.s2jh.core.annotation.MetaData;
import lab.s2jh.core.entity.BaseNativeEntity;
import lab.s2jh.module.auth.entity.User;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by wangmeng on 2017/7/25.
 */
@Getter
@Setter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "basic_student")
@MetaData(value = "学生基础信息")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Student extends BaseNativeEntity {

    private static final long serialVersionUID = 512335968914828057L;

    @MetaData(value = "用户")
    @OneToOne(fetch = FetchType.LAZY,optional = true)
    @JoinColumn(name = "user_id")
    private User user;

    @MetaData(value = "工号")
    @Column(length = 64,nullable = false)
    private String teacherCode;

    @MetaData(value = "性别", comments = "从数据字典定义的性别")
    @Column(length = 32, nullable = true)
    private String sex;

    @MetaData(value = "所属学院")
    @ManyToOne(cascade = CascadeType.DETACH)
    @NotNull
    @JoinColumn(name = "college_id")
    private College college;
}
