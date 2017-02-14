<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<#import "macroTextBlock.ftl" as lib>
<#include "mailHeader.ftl">
<body style="width: 600px">
    <table width="600" cellpadding="0" cellspacing="0" class="wrapContent">
        <#include "mailLogo.ftl">
        <tr>
            <td style="padding: 10px 30px 0px;">
                <p>${actionHeading}</p>
                <p><@lib.hyperLink displayName=projectHyperLink.displayName() webLink=projectHyperLink.webLink()/></p>
                <p><b><@lib.hyperLink displayName=name webLink=summaryLink/></b></p>
                <table width="100%" cellpadding="0" cellspacing="0" border="0" style="font-size:12px; margin: 0px 0px 25px;">
                    <tr>
                        <td style="padding: 3px 0px;">
                            <p><u><i>${Changes}:</i></u></p>
                            <table border="0" cellspacing="0" style="font-size: 12px; margin: 20px 0px; border-collapse: collapse;">
                                <tr style="border-bottom: 1px solid ${styles.border_color}">
                                    <td style="font-weight: bold; ${styles.cell('240px')}">${Field}</td>
                                    <td style="font-weight: bold; ${styles.cell('250px')}">${Old_Value}</td>
                                    <td style="font-weight: bold; ${styles.cell('250px')}">${New_Value}</td>
                                </tr>
                                <#list historyLog.changeItems as item>
                                    <#if mapper.hasField(item.field)>
                                        <#assign fieldFormat=mapper.getField(item.field)>
                                        <tr style="border-bottom: 1px solid ${styles.border_color}">
                                            <td style="${styles.cell('240px')}; color: ${styles.meta_color}">${context.getFieldName(mapper, item.field)}</td>
                                            <td style="${styles.cell('250px')};">${fieldFormat.formatField(context, item.oldvalue)}</td>
                                            <td style="${styles.cell('250px')};">${fieldFormat.formatField(context, item.newvalue)}</td>
                                        </tr>
                                    </#if>
                                </#list>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <#if lastComments?has_content>
            <tr>
                <td style="padding: 0px 30px;">
                    <h3 style="font-size:14px">${lastCommentsValue}</h3>
                </td>
            </tr>
            <#list lastComments as commentItem>
                <@lib.commentBlock avatar=commentItem.ownerAvatarId! displayName=commentItem.ownerFullName comment=commentItem.comment/>
            </#list>
        </#if>
    </table>
    <#include "mailProjectFooter.ftl">
</body>
</html>