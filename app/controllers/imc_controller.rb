class ImcController < ApplicationController
	def index
	end

	def formulario
		render formulario_imc_index_path
	end

	def calcular
		raise params[:banana]
		render formulario_imc_index_path
	end
end
