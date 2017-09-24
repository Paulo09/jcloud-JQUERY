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
		<a href="#myPopup" data-rel="popup" data-role="button" data-icon="bars" data-iconpos="notext">Usuario</a>
		<a href="#popupBasic" data-transition="slidedown" data-rel="popup" data-icon="info" data-iconpos="notext">Sobre</a><div data-role="popup" id="popupBasic"><p>App criada com jMobile Developer http://www.jmobiledeveloper.com<p></div>
    </div>
	
	<div data-role="popup" id="myPopup">
      <ul data-role="listview" data-inset="true" style="min-width:250px;">
        <li data-role="list-divider" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;jMob!le Developer</li>
		<li><a data-icon="home" href="http://www.youtube.com/watch?v=aQmqc_Zu8gc">jMob!le Dev</a></li>
		<li><a data-icon="video" href="http://www.youtube.com/watch?v=aQmqc_Zu8gc">Videos</a></li>
		<li><a data-icon="mail" href="d.html">Emails</a></li>
		<li><a data-icon="mail" href="d.html">Documentação</a></li>
		<li><a data-icon="mail" href="d.html">Contato</a></li>
	  </ul>
    </div>

    <div data-role="content">	
	   <g:form data-transition="pop" name="formLogin" url="[controller:'usuario',action:'login']">
 		<b>Login<input type="text"     id="Editbox1" name="login"><br/>
		<b>Senha<input type="password" id="Editbox2" name="senha"><br/>
		<input type="submit"   id="Button1"  name=""       value="Entrar" >
		<input type="Reset"    id="Button2"  name=""       value="Limpar" >
	   </g:form>
    </div>

    </div>
  
</body>
</html>