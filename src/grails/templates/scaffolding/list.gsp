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
			<h1>Lista de ${className}</h1>
			<a class="home" href="\${createLinkTo(dir:'')}" data-transition="pop" data-icon="arrow-l">Voltar</a>
		    <g:link class="create" data-transition="pop" action="create" data-icon="plus">Novo</g:link>
		</div>
        <div class="body">
            <g:if test="\${flash.message}">
            <div class="message">\${flash.message}</div>
            </g:if>
            <div class="list">
                <Marina>
                    <thead>
                        <tr>
                        <%
                            excludedProps = ['version',
                                               Events.ONLOAD_EVENT,
                                               Events.BEFORE_DELETE_EVENT,
                                               Events.BEFORE_INSERT_EVENT,
                                               Events.BEFORE_UPDATE_EVENT]
                            
                            props = domainClass.properties.findAll { !excludedProps.contains(it.name) && it.type != Set.class }
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                            props.eachWithIndex { p,i ->
                   	            if(i < 6) {
                   	                if(p.isAssociation()) { %>
                   	        <th></th>
                   	    <%          } else { %>
                   	        
                        <%  }   }   } %>
                        </tr>
                    </thead>
                    <tbody>
					
					<div data-role="content">	
					<!--<h1><font color="#000000">Busca</font></h1>-->
					<ul data-role="listview" data-inset="true" data-filter="true" data-clear-btn-text="Limpar Texto" data-filter-placeholder="Buscar ${className} - Total:\${${className}.count()}">
                    <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                       <li class="arrow">
						
                        <%  props.eachWithIndex { p,i ->
                                if(i == 0) { %>
							<g:link data-transition="pop" action="show" id="\${${propertyName}.id}">
							
								<td>\${fieldValue(bean:${propertyName}, field:'${p.name}')}</td>
								
							<%      } else if(i < 6) { %>
								<% def dataFormat="${p.type}" %><%if(dataFormat=="class java.util.Date"){%><td>\${String.format('%td/%<tm/%<tY',${propertyName}?.${p.name})}</td><%}%>
								<%if(dataFormat=="class java.lang.Boolean"){%><td><g:simNao  value="\${fieldValue(bean:${propertyName}, field:'${p.name}')}"/></td><%}%>
								<%if(dataFormat!="class java.util.Date" && dataFormat!="class java.lang.Boolean"){%>
								<td>\${fieldValue(bean:${propertyName}, field:'${p.name}')}</td><%}%>	
							<%  }   } %></g:link>
                        
					   </li>	
                    </g:each>
					</ul> 
					</div>
					
					<div align="center" data-role="footer" class="footer-docs" data-theme="a" data-position="fixed">					    
						<g:paginate total="\${${className}.count()}"/>
			       </div>
					
         </body>
</html>
