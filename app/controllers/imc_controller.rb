class ImcController < ApplicationController
	def index
	end

	def formulario
		render formulario_imc_index_path
	end

	def calcular
		# raise params.inspect
		@imc = (params[:peso].to_d / (params[:altura].to_d * params[:altura].to_d)).to_f
		
		@banana = params[:banana].to_i
		@batata = params[:batata].to_i
		@peixe = params[:peixe].to_i
		
		@fritura = params[:fritura].to_i
		@refri = params[:refri].to_i
		@pizza = params[:pizza].to_i


		if @imc < 17
			 @result_imc = "seu imc apontou que você está muito abaixo do peso, isso é muito sério"
		elsif @imc  > 17 && @imc <= 18.49
			@result_imc = "seu imc apontou que você abaixo do peso, procure regular isso"
		elsif @imc  >= 18.50 && @imc <= 24.99
			@result_imc = "seu imc apontou que você está com peso normal, continue assim"
		elsif @imc >= 25 && @imc <= 29.99
			@result_imc = "seu imc apontou que você está com sobrepeso, faça mais exercicios"
		elsif @imc >= 30
			@result_imc = "seu imc apontou que você está com obesidade, isso é gravissímo, procure ajuda!"
		end

		if @banana  >= 1 && @banana <= 2
			 @result_banana = "vi que você come banana de 1 a 3 vezes na semana, legal"
		elsif @banana  >= 3 && @banana <= 5
			@result_banana = "vi que você come banana de 4 a 5 vezes na semana, legal"
		elsif @banana  >= 6 && @banana <= 7
			@result_banana = "vi que você come banana de 6 a 7 vezes na semana, surpreedente"
		elsif @banana == 0
			@result_banana = "como assim vc não come banana?"
		end

		if @batata  >= 1 && @batata <= 2
			 @result_batata = "vi que você come batata doce de 1 a 3 vezes na semana, legal"
		elsif @batata  >= 3 && @batata <= 5
			@result_batata = "vi que você come batata doce de 4 a 5 vezes na semana, legal"
		elsif @batata  >= 6 && @batata <= 7
			@result_batata = "vi que você come batata doce de 6 a 7 vezes na semana, surpreedente"
		elsif @batata == 0
			@result_batata = "como assim vc não come batata doce?"
		end

		if @peixe  >= 1 && @peixe <= 2
			 @result_peixe = "vi que você come peixe de 1 a 3 vezes na semana, legal"
		elsif @peixe  >= 3 && @peixe <= 5
			@result_peixe = "vi que você come peixe de 4 a 5 vezes na semana, legal"
		elsif @peixe  >= 6 && @peixe <= 7
			@result_peixe = "vi que você come peixe de 6 a 7 vezes na semana, surpreedente"
		elsif @peixe == 0
			@result_peixe = "como assim vc não come peixe?"
		end

		if @fritura  >= 1 && @fritura <= 2
			 @result_fritura = "você come fritura mas num nivel aceitavel, 1 a 2 vezes"
		elsif @fritura  >= 3 && @fritura <= 5
			@result_fritura = "vi que você come fritura de 3 a 5 vezes na semana, isso é preocupante"
		elsif @fritura  >= 6 && @fritura <= 7
			@result_fritura = "vi que você come fritura de 6 a 7 vezes na semana, se cuida pelo amor"
		elsif @fritura == 0
			@result_fritura = "parabéns, fritura nenhuma vez, você é saudável"
		end

		if @refri  >= 1 && @refri <= 2
			 @result_refri = "você toma refrigerante mas num nivel aceitavel, 1 a 2 vezes"
		elsif @refri  >= 3 && @refri <= 5
			@result_refri = "vi que você toma refrigerante de 3 a 5 vezes na semana, isso é preocupante"
		elsif @refri  >= 6 && @refri <= 7
			@result_refri = "vi que você toma refrigerante de 6 a 7 vezes na semana, se cuida pelo amor"
		elsif @refri == 0
			@result_refri = "parabéns, refrigerante nenhuma vez, você é saudável"
		end

		if @pizza  >= 1 && @pizza <= 2
			 @result_pizza = "você come pizza mas num nivel aceitavel, 1 a 2 vezes"
		elsif @pizza  >= 3 && @pizza <= 5
			@result_pizza = "vi que você come pizza de 3 a 5 vezes na semana, isso é preocupante"
		elsif @pizza  >= 6 && @pizza <= 7
			@result_pizza = "vi que você come pizza de 6 a 7 vezes na semana, se cuida pelo amor"
		elsif @pizza == 0
			@result_pizza = "parabéns, pizza nenhuma vez, você é saudável"
		end

		render :partial => 'resultado'
	end
end
