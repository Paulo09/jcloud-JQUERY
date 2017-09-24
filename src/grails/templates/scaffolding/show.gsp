<% import org.codehaus.groovy.grails.orm.hibernate.support.ClosureEventTriggeringInterceptor as Events %>
<%=packageName%>
<html>
    <head>
        <meta name="viewport" content="height=device-height,width=device-width"/>
		<title>jMob!le Developer</title>
		<link rel="icon" type="image/png" href="icone.png" />
		<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
    </head>
   <body>
		<div data-role="page" id="primeira">
			<div data-role="header">
			<h1>Dados ${className}</h1>
			<g:link class="list" data-transition="pop" action="list" data-icon="arrow-l">Voltar</g:link>
			<g:link class="create" data-transition="pop" action="create" data-icon="plus">Novo</g:link>
		</div>

            <div class="dialog" align="center">
                <table>
                    <tbody>

                    <%
                        excludedProps = ['version',
                                           Events.ONLOAD_EVENT,
                                           Events.BEFORE_DELETE_EVENT,
                                           Events.BEFORE_INSERT_EVENT,
                                           Events.BEFORE_UPDATE_EVENT]
                        props = domainClass.properties.findAll { !excludedProps.contains(it.name) }
                        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                        props.each { p -> %>
						<% def dataFormat="${p.type}";def cifra='R$'%>
						<%def apiQrcode="";p.name.eachMatch("qrcode"){condicao->apiQrcode=condicao}%>
						<%def apiMapa="";p.name.eachMatch("mapa"){condicao->apiMapa=condicao}%>
						<%def apiLink="";p.name.eachMatch("link"){condicao->apiLink=condicao}%>
						<%def apiVideo="";p.name.eachMatch("video"){condicao->apiVideo=condicao}%>
				        <tr class="prop">
                            <td valign="top1" class="name"><b>${p.naturalName.replaceAll("Textarea","").replaceAll("Link","")}:</td>
                            <% if(p.isEnum()) { %>
                            <td valign="top" class="value">\${${propertyName}?.${p.name}?.encodeAsHTML()}</td>
                            <% } else if(p.oneToMany) { %>
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="${p.name[0]}" in="\${${propertyName}.${p.name}}">
                                    <li><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            <%  } else if(p.manyToOne || p.oneToOne) { %>
                            <td valign="top" class="value"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></td>
                            <%  } else if(dataFormat !="class java.util.Date" && dataFormat!="class java.lang.Boolean" && dataFormat!="class java.lang.Float" && !apiQrcode && !apiMapa && !apiLink && !apiVideo) { %>
                            <td valign="top" class="value">\${fieldValue(bean:${propertyName}, field:'${p.name}')}</td>
			                <%  } %>
							<%if(apiQrcode){%><td valign="top" class="value"><img src="http://chart.apis.google.com/chart?cht=qr&chl=\${fieldValue(bean:${propertyName}, field:'${p.name}')} &chs=180x180" alt="Qrcod"/></td><%}%>
							<%if(apiMapa){%><td valign="top" class="value">\${${propertyName}.${p.name}}</td><%}%>
							<%if(apiLink){%><td valign="top" class="value"><a href="\${${propertyName}.${p.name}}">\${${propertyName}.${p.name}}</td><%}%>
							<%if(apiVideo){%><td valign="top" class="value"><iframe width="399" height="217" src="\${${propertyName}.${p.name}}" frameborder="0"></iframe></td><%}%>
							<%if(dataFormat=="class java.util.Date"){%><td valign="top" class="value">\${String.format('%td/%<tm/%<tY',${domainClass.propertyName}?.${p.name})}</td><%}%>
							<%if(dataFormat=="class java.lang.Boolean"){%><td valign="top" class="value"><g:simNao  value="\${fieldValue(bean:${propertyName}, field:'${p.name}')}"/></td><%}%>
							<%if(dataFormat=="class java.lang.Float"){%><td valign="top" class="value">${cifra} <g: formatNumber number="\${${propertyName}.${p.name}}" format="###,###.###"/><%}%>
					    </tr>
                    <%  } %>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="\${${propertyName}?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Editar" data-transition="pop" action="Edit" data-icon="back"/></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Deseja Apagar os Dados?');" value="Apagar" data-transition="pop" action="Delete" data-icon="delete"/></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
