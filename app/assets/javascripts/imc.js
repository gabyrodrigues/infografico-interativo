function sendFood() {
	let imc_altura = $("#imc_altura").val();
	let imc_peso = $("#imc_peso").val();

	$.ajax({
    	url: '/imc/calcular',
    	type: 'GET',
    	data: {banana: banana, batata: batata, peixe: peixe, fritura: fritura, refri: refri, pizza: pizza, imc_altura: imc_altura, imc_peso: imc_peso}
	})
	.done(function(retorno){
    	$("#retorno_resultado").html(retorno);
  	});
}