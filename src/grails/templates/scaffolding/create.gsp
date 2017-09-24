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
<script type="text/javascript" src="\${createLinkTo(dir:'js',file:'cpf.js')}" ></script>
<script>function vCPF(i){i.setCustomValidity(validaCPF(i.value)?'':'CPF inválido!')}</script>
<script type="text/javascript" charset="utf-8" src="jquery-2.0.0.min.js"></script>
<script type="text/javascript" charset="utf-8" src="quantize.js"></script>
<script type="text/javascript" charset="utf-8" src="color-thief.js"></script>
<script src="../signature.js"></script>
<style>
body, canvas, div, form, input {
margin: 0;
padding: 0;
}
#wrapper {
width: 100%;
padding: 1px;
}
canvas {
position: relative;
margin: 1px;
margin-left: 0px;
border: 1px solid #3a87ad;
}
h1, p {
padding-left: 2px;
width: 100%;
margin: 0 auto;
}
#controlPanel {
margin: 2px;
}
#saveSignature {
display: none;
}
</style>
<script>
	var desiredWidth;
    \$(document).ready(function(){
	console.log('onReady');
    \$("#takePictureField").on("change",gotPic);
    \$("#yourimage").load(getSwatches);
    desiredWidth = window.innerWidth;
	if(!("url" in window) && ("webkitURL" in window)) {
	window.URL = window.webkitURL;}});
    function getSwatches(){var colorArr = createPalette(\$("#yourimage"), 5);
	for (var i = 0; i < Math.min(5, colorArr.length); i++){
    \$("#swatch"+i).css("background-color","rgb("+colorArr[i][0]+","+colorArr[i][1]+","+colorArr[i][2]+")");
    console.log(\$("#swatch"+i).css("background-color"));}}
	function gotPic(event){
	if(event.target.files.length == 1 &&
	event.target.files[0].type.indexOf("image/") == 0) {
	\$("#yourimage").attr("src",URL.createObjectURL(event.target.files[0]));}}	
</script>

 	<style>
	#yourimage {
		width:100%;	
	}
	#swatches {
		width: 100%;
		height: 50px;	
	}
	.swatch {
		width:18%;
		height: 50px;
		border-style:solid;
		border-width:thin;	
		float: left;
		margin-right: 3px;	
	}
</style>
</head>
<body>
<div data-role="page" id="primeira">
<div data-role="header">
<h1>Cadastrar ${className}</h1>
<g:link class="list" data-transition="pop" action="list" data-transition="pop" data-icon="arrow-l">Voltar</g:link>
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

<g:form action="save" method="post" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
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
if(p.type != Set.class) {
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
<%  }   }   } %>
</tbody>
</table>
</div>
<div class="buttons">
<span class="button"><input class="save" type="submit" value="Salvar" data-transition="pop" action="Create" data-icon="check"/></span>
</div>
</g:form>
</div>
</body>
</html>
