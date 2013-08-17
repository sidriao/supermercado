
$(document).ready(function(){
	formataDinheiro()
	formataMedida()

	$('#form_compra').submit(function(){
		$('#item_compra_preco').priceFormat({ 
			prefix: '',
			thousandsSeparator: '.' 
		})
		$('#item_compra_preco').unmask();
	});

	$('#item_compra_quantidade').keypress(function(e){
	    var todo = new String($(this).val());
	    var t = String.fromCharCode($(this));
	    alert(todo.indexOf(".") + t);
	    if(e.which==46 && todo.indexOf(".") >= 0){
	        return false;
	    }
		if((e.which >= 48 && e.which <= 57) || e.which==8 || e.which==0 || e.which==46){
			return true;
		}else{
			alert(e.which);
			return false;

		}
	});

});

function formataDinheiro() {
	$('#item_compra_preco').priceFormat({ 
		prefix: '',
		centsSeparator: ',', 
		thousandsSeparator: '.' 
	});

}

function formataMedida(){

}
;
