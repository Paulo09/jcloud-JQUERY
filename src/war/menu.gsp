<html>
    <head>
    <meta name="viewport" content="height=device-height,width=device-width"/>
    <title>jMob!le Developer</title>
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css" />
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
	<link rel="icon" type="image/png" href="/images/principal.png" />
	<link rel="apple-touch-icon" href="icone.png">
</head>
<body>
 
<div data-role="page" id="primeira">

    <div data-role="header" data-nobackbtn="true">
        <h1><img src="${createLinkTo(dir:'images',file:'Phone-32.png')}"/>jMob!le Dev</h1>
		<a href="#myPopup" data-rel="popup" data-role="button" data-icon="user" data-iconpos="notext">Usuario</a>
		<a href="#popupBasic" data-transition="slidedown" data-rel="popup" data-icon="info" data-iconpos="notext">Sobre</a><div data-role="popup" id="popupBasic"><p>App criada com jMobile Developer http://www.jmobiledeveloper.com<p></div>
    </div>
	
	<div data-role="popup" id="myPopup">
      <ul data-role="listview" data-inset="true" style="min-width:250px;">
        <li data-role="list-divider">Menu Usuário</li>
		<li><a href="list">Usuario</a></li>
        <li><a href="sair.gsp" onclick="return confirm('Deseja Sair do Sistema?');">Sair</a></li>
	  </ul>
    </div>

    <div data-role="content">	
        <ul data-role="listview" data-inset="true"> 
		    <ul data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder-text="Limpar Campo" data-filter-placeholder="Buscar Menu">
		    <g:each var="c" in="${grailsApplication.domainClasses}">
					<li id="m1-index-listItem1" class="m1-first m1-last m1-clickable m1-hyperlink" href=${c.logicalPropertyName}>
			            <g:link class="create" data-transition="pop" controller="${c.logicalPropertyName}">${c.fullName}</g:link>
					</li>
		    </g:each>
        </ul> 
    </div>

    </div>
  
</body>
</html>