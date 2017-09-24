class UteisTagTagLib {

    def selAlteraCondenacao = { attrs ->
		def name = attrs['name']
		def value = attrs['value']
		if (value == null){
			value = 0
		}else{
			value = Integer.parseInt(value)
		}
		

		out << "<select name='${attrs['name']}' id='${attrs['name']}'>"
		out << "<option ${value==1 ? "selected='selected'" : ''} value='1'>aumenta</option>"		
		out << "<option ${value==0 ? "selected='selected'" : ''} value='0'>não altera</option>"
		out << "<option ${value==-1 ? "selected='selected'" : ''} value='-1'>diminui</option>"
		out << "</select>"
    }
    
	def selSimNao = { attrs ->

		def name = attrs['name']
		def value = attrs['value']
		if (value.equalsIgnoreCase("true")){
			value = 1
		}else{
			value = 0
		}



		out << "<select name='${attrs['name']}' id='${attrs['name']}'>"
		out << "<option ${value==1 ? "selected='selected'" : ''} value='true'>Sim</option>"		
		out << "<option ${value==0 ? "selected='selected'" : ''} value='false'>Não</option>"
		out << "</select>"
    }
	
    def alteraCondenacao = { attrs ->
		def value = attrs['value']
		
		if (value == null){
			value = 0
		}else{
			value = Integer.parseInt(value)
		}
		
        switch(value){
          case -1:
            out << "diminui";
            break
          case 0:
            out << "não altera";
            break
          case 1:
            out << "aumenta";
            break
		}
    }    

    def simNao = { attrs ->
		def value = attrs['value']
		if(value){
			if (value.equalsIgnoreCase("true")){
				out << "Sim";
			}else{
		        out << "Não";
			}
		}
	}
}