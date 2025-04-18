<#if isWithPackage?exists && isWithPackage==true>package ${packageName}.entity;</#if>

<#if isAutoImport?exists && isAutoImport==true>
<#if isLombok?exists && isLombok==true>import lombok.Data;</#if>
import java.util.Date;
import java.util.List;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
<#if isSwagger?exists && isSwagger==true>
import io.swagger.v3.oas.annotations.media.Schema;</#if>
</#if>
/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Entity
@Builder
@AllArgsConstructor
<#if isLombok?exists && isLombok==true>@Data</#if>
<#if isComment?exists && isComment==true>@Table(name="${classInfo.originTableName}")</#if><#if isSwagger?exists && isSwagger==true>
@Schema"${classInfo.classComment}")</#if>
public class ${classInfo.className} implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Schema(description = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
<#list classInfo.fieldList as fieldItem >
    <#if isComment?exists && isComment==true>/**
    * ${fieldItem.fieldComment}
    */</#if><#if isSwagger?exists && isSwagger==true>
    @Schema(description = "${fieldItem.fieldComment}")</#if>
    <#if isComment?exists && isComment==true>@Column(name="${fieldItem.columnName}")</#if>
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

</#list>
    public ${classInfo.className}() {
    }
</#if>

<#if isLombok?exists && isLombok==false>
    public ${fieldItem.fieldClass} get${fieldItem.fieldName?cap_first}() {
        return ${fieldItem.fieldName};
    }

    public void set${fieldItem.fieldName?cap_first}(${fieldItem.fieldClass} ${fieldItem.fieldName}) {
        this.${fieldItem.fieldName} = ${fieldItem.fieldName};
    }
</#if>
}
