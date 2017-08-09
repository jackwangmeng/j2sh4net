package lab.s2jh.module.basicdata.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
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
import org.hibernate.envers.Audited;
import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by wangmeng on 2017/7/16.
 */
@Setter
@Getter
@Accessors(chain = true)
@Access(AccessType.FIELD)
@Entity
@Table(name = "teacher")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@MetaData(value = "教师信息")
@Audited
public class TeacherBeanCfg extends PersistableEntity<Long> {

    private static final long serialVersionUID = 2544390748513253055L;



    @Id
    @MetaData("主键")
    @GeneratedValue(generator = "idGenerator")
    @GenericGenerator(name = "idGenerator", strategy = "native")
    @JsonProperty
    private Long id;

    @MetaData(value = "姓名")
    @Column(length = 64,nullable = true)
    private String name;

    @MetaData(value = "用户名")
    @Column(length = 64,nullable = true)
    private String userName;

    @MetaData(value = "密码")
    @Column(length = 128,nullable = true)
    private String password;

    @MetaData(value = "工号")
    @Column(length = 128,nullable = true)
    private String teacherCode;

    @MetaData(value = "所属院系")
    @Column(length = 512,nullable = true)
    private String platform;

    @MetaData(value = "电子邮箱")
    @Email
    @Column(length = 128,nullable = true)
    private String email;

    @MetaData(value = "性别", comments = "从数据字典定义的性别")
    @Column(length = 32, nullable = true)
    private String sex;

    @MetaData(value = "入职时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonSerialize(using = ShortDateTimeJsonSerializer.class)
    private Date time;


    @Override
    public String getDisplay() {
        return teacherCode;
    }
}
