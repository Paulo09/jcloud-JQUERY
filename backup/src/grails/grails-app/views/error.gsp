<html>
  <head>
	  <title>jMobile Developer</title>
	  <style type="text/css">
	  		.message {
	  			border: 1px solid black;
	  			padding: 5px;
	  			background-color:#E9E9E9;
	  		}
	  		.stack {
	  			border: 1px solid black;
	  			padding: 5px;	  		
	  			overflow:auto;
	  			height: 300px;
	  		}
	  		.snippet {
	  			padding: 5px;
	  			background-color:white;
	  			border:1px solid black;
	  			margin:3px;
	  			font-family:courier;
	  		}
	  </style>
  </head>
  
  <body>
    <h1>jMobile Developer Exception</h1>
    <h2>Detalhes do Erro:</h2>
  	<div class="message">
  		<strong>Mensagem:</strong> ${exception.message?.encodeAsHTML()} <br />
  		<strong>Causa:</strong> ${exception.cause?.message?.encodeAsHTML()} <br />
  		<strong>Classe:</strong> ${exception.className} <br />  		  		
  		<strong>Linha:</strong> [${exception.lineNumber}] <br />  		
  		<strong>Código:</strong><br />   		
  		<div class="snippet">
  			<g:each var="cs" in="${exception.codeSnippet}"> 
  				${cs?.encodeAsHTML()}<br />  			
  			</g:each>  	
  		</div>	  		
  	</div>
    <h2>Stack Trace jMobile</h2>
    <div class="stack">
      <pre><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}<br/></g:each></pre>
    </div>
  </body>
</html>