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
<a class="home" href="\${createLinkTo(dir:'')}" data-transition="pop" data-icon="grid">Listar</a>
</div>

<div class="body" align="center">
<g:if test="\${flash.message}">
<div class="message">\${flash.message}</div>
</g:if>
<g:hasErrors bean="">
<div class="errors">
<g:renderErrors bean="\${${propertyName}}" as="list" />
</div>
</g:hasErrors>
<g:form method="post" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
<input type="hidden" name="id" value="\${${propertyName}?.id}" />
<div class="dialog">
<table>
<tbody>
<%
excludedProps = ['version',
'id',
Events.ONLOAD_EVENT,
Events.BEFORE_DELETE_EVENT,
Events.BEFORE_INSERT_EVENT,
Events.BEFORE_UPDATE_EVENT]
props = domainClass.properties.findAll { !excludedProps.contains(it.name) }

Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
props.each { p ->
cp = domainClass.constrainedProperties[p.name]
display = (cp ? cp.display : true)        
if(display) { %>
<tr class="prop">
<g:if test="\${hasErrors(bean:${domainClass.propertyName},field:'${p.name}','errors')}">
	<td valign="top" class="value \${hasErrors(bean:${domainClass.propertyName},field:'${p.name}','errors')}">
		<label for="${p.name}"><font color="#FF0000"><b>*<b> ${p.naturalName}</label>${renderEditor(p)}
	</td>
</g:if>
<g:if test="\${!hasErrors(bean:${domainClass.propertyName},field:'${p.name}','errors')}">
	<td valign="top" class="value \${hasErrors(bean:${domainClass.propertyName},field:'${p.name}','errors')}">
		<label for="${p.name}"><b>${p.naturalName}</label>${renderEditor(p)}
	</td>
</g:if>		
</tr> 
<%  }   } %>
</tbody>
</table>
</div>
<div class="buttons">
<span class="button"><g:actionSubmit class="save" value="Salvar" data-transition="pop" action="Update" data-icon="check"/></span>
<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Deseja Apagar os Dados?');" value="Apagar" data-transition="pop" action="Delete" data-icon="delete"/></span>
</div>
</g:form>
</div>
</body>
</html>
