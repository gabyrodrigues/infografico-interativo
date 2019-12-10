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
			@result_imc = "<p>Atenção! O seu IMC está muito abaixo do ideal e isso é bastante preocupante. Estar muito abaixo do peso pode trazer tantas consequências quanto a obesidade, levando a problemas de saúde como: Unhas e cabelos secos e quebradiços, exaustão, dores de cabeça e inclusive dores nas articulações e incapacidade de concentrar.</p>
				<p>O peso muito abaixo do ideal pode indicar transtornos alimentares bem sérios como a anorexia ou até mesmo a
				bulimia. É importante que você procure a ajuda de um profissional especializado para lhe dar as devidas 
				orientações e assim conseguir atingir um IMC ideal e inclusive hábitos realmente saudáveis, é importante também evitar tomar decisões importantes relacionada a sua saúde por conta própria.</p>"
			@faixa_imc = "carinha-muito-abaixo"

		elsif @imc  >= 17 && @imc <= 18.49
			@result_imc = "<p>Seu IMC está abaixo do ideal. Procure mudar os seus hábitos pois, apesar dessa faixa não ser muito grave é possível, dependendo dos seus hábitos que evolua para uma faixa ainda menor, trazendo tantas consequências quanto a obesidade e levando a problemas de saúde como: Unhas e cabelos secos e quebradiços, exaustão, dores de cabeça e inclusive dores nas articulações e incapacidade de concentrar.<p>
				<p>O baixo consumo de alimentação pode levar a transtornos alimentares como a anorexia ou até mesmo a bulimia. Ter uma alimentação equilibrada é importante para garantir hábitos saudáveis e cada índice pode indicar necessidades do corpo, porém, não tome atitudes por sua própria conta. Busque sempre um profissional para lhe dar as orientações adequadas e assim alcançar resultados saudáveis e de maneira segura.</p>"
			@faixa_imc = "carinha-abaixo"

		elsif @imc  >= 18.50 && @imc <= 24.99
			@result_imc = "<p>Uau, você está dentro da faixa ideal! Estar dentro do peso ideal é importante para a promoção da saúde, pois isso ajuda na prevenção de doenças e na garantia da qualidade de vida. Por isso, ao estar abaixo do peso o indicado é buscar o aumento do volume muscular para aumentar de peso de forma saudável. E para quem está acima do peso o indicado é que haja busca por hábitos saudáveis associados à atividade física, para obter uma saúde melhor. Então, continue assim!<p>
				<p>Porém, é sempre importante lembrar que cada índice pode indicar necessidades do corpo, porém, não tome atitudes por sua própria conta. Busque sempre um profissional para lhe dar as orientações adequadas e assim alcançar resultados saudáveis e de maneira segura.</p>"
			@faixa_imc = "carinha-normal"

		elsif @imc >= 25 && @imc <= 29.99
			@result_imc = "<p>Seu IMC está acima do ideal, isso significa que você está com sobrepeso e que também precisa rever seus hábitos. Estar com sobrepeso não é tão grave, porém pode levar facilmente à obesidade, e trazer problemas de alto risco para a saúde como:  hipertensão, diabetes, infarto e colesterol alto.<p>
				<p>Hábitos saudáveis são importantes para a garantia de uma qualidade de vida melhor, sendo super importante incluir na rotina atividades físicas regulares, boas noites de sono e uma alimentação equilibrada. Porém, com as dificuldades do dia a dia se torna bem comum não conseguir tirar um tempo para atividades físicas ou até mesmo conseguir dormir a quantidade recomendada todas as noites (6-8h), então que tal atentar-se para os seus hábitos alimentares? Não se esqueça que antes de tomar decisões importantes relacionadas a sua saúde o ideal é procurar um profissional especializado para lhe dar as devidas orientações.</p>"
			@faixa_imc = "carinha-sobrepeso"

		elsif @imc >= 30
			@result_imc = "<p>Seu IMC está bastante acima do ideal, indicando que você deve estar em algum nível de obesidade! A obesidade é bastante séria e pode trazer doenças de alto risco para a saúde como: hipertensão, diabetes, infarto e colesterol alto. Então, que tal começar a atentar-se em seus hábitos?</p>
				<p>Hábitos saudáveis são importantes para a garantia de uma qualidade de vida melhor, sendo super importante incluir na rotina atividades físicas regulares, boas noites de sono e uma alimentação equilibrada. Porém, com as dificuldades do dia a dia se torna bem comum não conseguir tirar um tempo para atividades físicas ou até mesmo conseguir dormir a quantidade recomendada todas as noites (6-8h). Então o recomendado seria atentar-se para uma dieta que leve a uma redução de peso para atingir o IMC recomendado, que seria o índice de 18,50 a 24,99. É importante lembrar que cada índice pode indicar necessidades do corpo, porém, não tome atitudes por sua própria conta. Busque sempre um profissional para lhe dar as orientações adequadas e assim alcançar resultados saudáveis e de maneira segura.</p>"
			@faixa_imc = "carinha-obeso"
		end

		if @banana  >= 1 && @banana <= 2
			 @result_banana = "<p>Consumir banana de 1 a 2 vezes na semana já é um início, mas você
			precisa saber alguns fatos importantes sobre a banana que podem te ajudar a ter mais interesse em
			incluí-la na sua dieta diária: O consumo frequente de banana é importante para seu organismo, 
			pois a banana contém muito <b>ferro</b>, que estimula a produção de 
			<b>hemoglobina</b> e, consequentemente, o seu consumo na dieta é uma forma eficiente de ajudar a combater a 
			anemia. Além de serem ricas em <b>vitaminas do complexo B</b>, que auxiliam no sistema nervoso. 
			Por ser uma fruta que proporciona sensação de saciedade ainda auxilia no emagrecimento. 
			Então procure comer mais banana!</p>"

		elsif @banana  >= 3 && @banana <= 5
			@result_banana = "<p>Vi que você come banana de 3 a 5 vezes na semana, isso é bom, mas sabia que incluir
			banana na sua alimentação diária traz ainda mais benefícios? Aqui vão alguns: a banana é rica em 
			<b>vitaminas do complexo B</b>, que auxiliam no sistema nervoso, é fonte de <b>fibras alimentares</b>, 
			tornando o intestino saudável, é fonte de <b>potássio</b> e <b>cálcio</b>, contribuindo na regulação 
			dos níveis da pressão arterial, melhorando o sistema cardiovascular. Além de tudo isso ainda ajuda a <b>diminuir
			os níveis de estresse</b>, pois é fonte de <b>triptofano</b>. Pra que melhores motivos?</p>"

		elsif @banana  >= 6 && @banana <= 7
			@result_banana = "<p>Comer banana de 6 a 7 vezes na semana, é muito bom! O consumo frequente 
			de banana é importante para seu organismo, pois a banana contém muito <b>ferro</b>, que estimula a produção de 
			<b>hemoglobina</b> e, consequentemente, o seu consumo na dieta é uma forma eficiente de ajudar a combater a 
			anemia. Além de serem ricas em <b>vitaminas do complexo B</b>, que auxiliam no sistema nervoso. 
			Por ser uma fruta que proporciona sensação de saciedade ainda auxilia no emagrecimento. 
			Seu corpo se pudesse com certeza te agradeceria por esse consumo diário. Parabéns!</p>"

		elsif @banana == 0
			@result_banana = "<p>Banana nenhuma vez na semana? Você precisa mudar isso e para te convencer
			vou te mostrar alguns fatos: a banana é rica em <b>vitaminas do complexo B</b>, 
			que auxiliam no sistema nervoso, é fonte de <b>fibras alimentares</b>, 
			tornando o intestino saudável, é fonte de <b>potássio</b> e <b>cálcio</b>, contribuindo na regulação 
			dos níveis da pressão arterial, melhorando o sistema cardiovascular. Além de tudo isso ainda ajuda a <b>diminuir
			os níveis de estresse</b>, pois é fonte de <b>triptofano</b>. Pra que melhores motivos?</p>"
		end

		if @batata  >= 1 && @batata <= 2
			@result_batata = "<p>Você come batata doce de 1 a 2 vezes na semana. É pouco,
			mas já é um começo. Aqui vai alguns dos benefícios da batata doce pra te estimular
			a consumir e incluí-la em seu cotidiano: o consumo diário e constante de batata doce 
			incrementa no seu organismo vitaminas como: <b>A</b>, que ajuda no funcionamento do sistema visual, 
			<b>vitamina C</b>, que ajuda no sistema imunológico, a <b>vitamina E</b>, que auxilia no sistema hormonal 
			e no sistema nervoso, além de <b>potássio</b> e <b>ferro</b> também são encontrados em quantidades 
			relevantes na batata-doce. Ou seja, ela te mantém nutrido e alimentado. E o seu corpo 
			se pudesse com certeza agradeceria por isso. Sendo um ótimo aliado para que quer 
			perder peso e/ou ganhar massa muscular. Então aproveite mais da batata!</p>"

		elsif @batata  >= 3 && @batata <= 5
			@result_batata = "<p>Comer batata doce de 3 a 5 vezes na semana é bem interessante,
			pois a batata doce é rica em <b>vitamina A</b> e <b>C</b>, agindo como antioxidante e fortalecendo
			o sistema imunológico, em <b>vitamina E</b>, sendo ótima para a pele, além de ajudar
			a dar energia, a perder peso e ganhar massa muscular, surpreendente, não? 
			Então, para garantia dessas vantagens, coma mais batata doce!</p>"

		elsif @batata  >= 6 && @batata <= 7
			@result_batata = "<p>Você consome batata doce de 6 a 7 vezes na semana, meus 
			parabéns, o seu consumo diário e constante de batata doce incrementa no seu 
			organismo vitaminas como: <b>A</b>, que ajuda no funcionamento do sistema visual, <b>vitamina 
			C</b>, que ajuda no sistema imunológico, a <b>vitamina E</b>, que auxilia no sistema hormonal 
			e no sistema nervoso, além de <b>potássio</b> e <b>ferro</b> que também são encontrados em quantidades 
			relevantes na batata-doce. Ou seja, ela te mantém nutrido e alimentado. E o seu corpo 
			se pudesse com certeza agradeceria por isso. Sendo um ótimo aliado para que quer 
			perder peso e/ou ganhar massa muscular.</p>"
		elsif @batata == 0
			@result_batata = "<p>Como assim você não come batata doce? Você provavelmente não
			sabe o que ta perdendo. Então aqui vai algumas informações sobre a batata para
			te deixar interessado: incrementa no seu organismo vitaminas como: <b>A</b>, que ajuda no funcionamento 
			do sistema visual, <b>vitamina C</b>, que ajuda no sistema imunológico, a <b>vitamina E</b>, que auxilia 
			no sistema hormonal e no sistema nervoso e o seu consumo ainda ajuda a reduzir o colesterol, regular a pressão 
			arterial e ainda faz bem pra pele! Então, para garantia dessas vantagens, coma mais batata doce!</p>"
		end

		if @peixe  >= 1 && @peixe <= 2
			 @result_peixe = "<p>Vi que você come peixe de 1 a 2 vezes na semana, que tal saber algumas vantagens
			do consumo de peixe para incrementá-lo em sua dieta semanal? O peixe é rico em <b>fontes proteicas</b> 
			que são nutrientes importantes para a formação da massa muscular, dos cabelos, da pele, 
			das células e do sistema imunológico, possui <b>ômega 3</b> que é uma gordura boa que auxilia 
			na redução do colesterol ruim e aumentando o colesterol bom, além de reduzir a inflamação 
			e na prevenção contra o mal de Alzheimer. Então, para garantia dessas vantagens, coma mais peixe.</p>"

		elsif @peixe  >= 3 && @peixe <= 5
			@result_peixe = "<p>Vi que você come peixe de 3 a 5 vezes na semana, isso é bom mas sabia
			que consumir peixe diariamente traz ainda mais vantagens? O peixe é rico em <b>fontes proteicas</b> 
			que são nutrientes importantes para a formação da massa muscular, dos cabelos, da pele, 
			das células e do sistema imunológico, possui <b>ômega 3</b> que é uma gordura boa que auxilia 
			na redução do colesterol ruim e aumentando o colesterol bom, além de reduzir a inflamação 
			e na prevenção contra o mal de Alzheimer. Então, para garantia dessas vantagens, coma mais peixe.</p>"

		elsif @peixe  >= 6 && @peixe <= 7
			@result_peixe = "<p>Você come peixe de 6 a 7 vezes na semana, surpreendente!
			O consumo frequente de peixe é muito bom para seu organismo pois, 
			é rico em <b>fontes proteicas</b> que são nutrientes importantes para a formação da massa muscular, 
			dos cabelos, da pele, das células e do sistema imunológico, possuem <b>ômega 3</b>, que é uma gordura boa 
			que auxilia na redução do colesterol ruim e aumentando o colesterol bom, 
			além de reduzir a inflamação e na prevenção contra o  mal de Alzheimer. Parabéns!</p>"

		elsif @peixe == 0
			@result_peixe = "<p>Como assim peixe nenhuma vez na semana? Vamos mudar isso! O consumo de peixe
			traz inúmeras vantagens, incluindo: a presença do <b>ômega 3</b>, que é uma gordura boa 
			que auxilia na redução do colesterol ruim e aumentando o colesterol bom, 
			além de reduzir a inflamação e na prevenção contra o mal de Alzheimer. Além de rico em <b>fontes proteicas</b> 
			que são nutrientes importantes para a formação da massa muscular, dos cabelos, da pele, das células 
			e do sistema imunológico. Tente incluir aos poucos peixe em sua dieta semanal.</p>"
		end

		if @fritura  >= 1 && @fritura <= 2
			@result_fritura = "<p>Comer fritura 1 a 2 vezes na semana não é tão preocupante, porém ainda é
			importante rever os seus hábitos alimentares, por isso aqui vão alguns alertas sobre o consumo de 
			frituras: O óleo, quando submetido a altas temperaturas se torna 
			bastante prejudicial ao organismo podendo causar grandes problemas a longo prazo como: 
			<i>doenças cardiovasculares</i>, <i>aumento da pressão arterial</i> e <i>má absorção</i> de nutrientes. 
			Além disso, a fritura deixa o alimento consumido com uma característica inflamatória 
			que pode estimular o <i>acúmulo de gordura abdominal</i> e também levar à <i>resistência à insulina</i>, 
			o que desencadeia <i>cansaço</i>, <i>mal-estar</i>, <i>dores de cabeça</i> e <i>falta de energia</i>. 
			Ou seja, é super importante rever os seus hábitos alimentares. Então uma dica é: invista mais em alimentos
			cozidos ou grelhados.</p>"
		elsif @fritura  >= 3 && @fritura <= 5
			@result_fritura = "<p>Você come fritura de 3 a 5 vezes na semana, acredito que você deva rever isso!
			Aqui vão alguns fato sobre o consumo de frituras: O óleo, quando submetido a altas temperaturas se torna 
			bastante prejudicial ao organismo podendo causar grandes problemas a longo prazo como: 
			<i>doenças cardiovasculares</i>, <i>aumento da pressão arterial</i> e <i>má absorção</i> de nutrientes. 
			Além disso, a fritura deixa o alimento consumido com uma característica inflamatória 
			que pode estimular o <i>acúmulo de gordura abdominal</i> e também levar à <i>resistência à insulina</i>, 
			o que desencadeia <i>cansaço</i>, <i>mal-estar</i>, <i>dores de cabeça</i> e <i>falta de energia</i>. 
			Ou seja, é super importante rever os seus hábitos alimentares. Que tal começar remover aos poucos 
			a fritura de sua rotina e/ou optar por grelhados?</p>"
		elsif @fritura  >= 6 && @fritura <= 7
			@result_fritura = "<p>Você come fritura de 6 a 7 vezes na semana, isso é preocupante!
			Consumir fritura e ainda mais tantas vezes durante a semana é bastante prejudicial, 
			pois o óleo, quando submetido a altas temperaturas se torna bastante prejudicial ao organismo.
			Então, alguns dos problemas que as frituras podem causar a longo prazo são: <i>doenças cardiovasculares</i>, 
			<i>aumento da pressão arterial</i> e <i>má absorção</i> de nutrientes. Além disso, a fritura 
			deixa o alimento consumido com uma característica inflamatória que pode estimular o <i>acúmulo de gordura 
			abdominal</i> e também levar à <i>resistência à insulina</i>, o que desencadeia <i>cansaço</i>, 
			<i>mal-estar</i>, <i>dores de cabeça</i> e <i>falta de energia</i>. Ou seja, é super importante
			rever os seus hábitos alimentares. Que tal começar remover aos poucos a fritura de sua rotina e/ou optar
			por grelhados?</p>"
		elsif @fritura == 0
			@result_fritura = "<p>Você não consume fritura durante a semana, parabéns! O Consumo de frituras, como
			conhecido por várias pessoas, traz enormes ricos para a saúde. Levando a sérios problemas, como
			obesidade, doenças vasculares e aumento da pressão arterial. Sendo vantajoso substituir as frituras 
			por alimentos cozidos ou grelhados. Então, continue assim e seu corpo agradece.</p>"
		end

		if @refri  >= 1 && @refri <= 2
			 @result_refri = "<p>Consumir refrigerante, mesmo que 1 a 2 vezes na semana pode ser prejudicial a sua saúde. 
			O Consumo de refrigerante, pode trazer enormes ricos para a saúde. Pois,
			possui <i>ácido fosfórico</i>, que <i>elimina o cálcio dos ossos</i>, deixando-os mais 
			fracos, levando a um maior o risco de osteoporose, principalmente em mulheres. Isso porque a substância 
			causa maior acidez no sangue, fazendo com que o organismo use o cálcio dos ossos para neutralizar o ácido 
			no organismo. Preocupante! E <b>não</b>, não adianta substituir o refrigerante comum por sua versão diet 
			ou zero, os malefícios do refrigerante estão ligados a todos os componentes de sua fórmula. 
			O organismo gasta nutrientes para conseguir eliminar a ingestão da química presente no refrigerante do 
			corpo, sendo a versão diet ainda pior pela grande quantidade de adoçante artificial.</p>
			<p>O consumo constante de refrigerante contribui para o aumento de peso, inclusive podendo levar à obesidade,
			influenciando o seu <b>IMC</b> e ainda aumentando os riscos de outras doenças, como diabetes, câncer e 
			problemas cardíacos. Além de serem <i>calorias vazias</i>, ou seja, sem nenhum valor nutricional.
			Por isso é importante rever a quantidade que você consome mesmo sendo em uma baixa frequência.</p>"
		elsif @refri  >= 3 && @refri <= 5
			@result_refri = "<p>Tomar refrigerante de 3 a 5 vezes na semana pode ser bastante prejudicial. O Consumo de refrigerante, ainda mais diariamente, traz enormes ricos para a saúde. Pois,
			possui <i>ácido fosfórico</i>, que <i>elimina o cálcio dos ossos</i>, deixando-os mais 
			fracos, levando a um maior o risco de osteoporose, principalmente em mulheres. Isso porque a substância 
			causa maior acidez no sangue, fazendo com que o organismo use o cálcio dos ossos para neutralizar o ácido 
			no organismo. Preocupante! E <b>não</b>, não adianta substituir o refrigerante comum por sua versão diet 
			ou zero, os malefícios do refrigerante estão ligados a todos os componentes de sua fórmula. 
			O organismo gasta nutrientes para conseguir eliminar a ingestão da química presente no refrigerante do 
			corpo, sendo a versão diet ainda pior pela grande quantidade de adoçante artificial.</p>
			<p>O consumo constante de refrigerante contribui para o aumento de peso, inclusive podendo levar à obesidade,
			influenciando o seu <b>IMC</b> e ainda aumentando os riscos de outras doenças, como diabetes, câncer e 
			problemas cardíacos. Além de serem <i>calorias vazias</i>, ou seja, sem nenhum valor nutricional.
			Por isso é importante rever a quantidade que você consome e inclusive tentar cortá-lo aos poucos de sua dieta.</p>"
		elsif @refri  >= 6 && @refri <= 7
			@result_refri = "<p>Consumo de refrigerante de 6 a 7 vezes na semana? isso precisa ser revisto!
			Consumir refrigerante, ainda mais diariamente, traz enormes ricos para a saúde. O refrigerante,
			possui <i>ácido fosfórico</i>, que <i>elimina o cálcio dos ossos</i>, deixando-os mais 
			fracos, levando a um maior o risco de osteoporose, principalmente em mulheres. Isso porque a substância 
			causa maior acidez no sangue, fazendo com que o organismo use o cálcio dos ossos para neutralizar o ácido 
			no organismo. Preocupante! E <b>não</b>, não adianta substituir o refrigerante comum por sua versão diet 
			ou zero, os malefícios do refrigerante estão ligados a todos os componentes de sua fórmula. 
			O organismo gasta nutrientes para conseguir eliminar a ingestão da química presente no refrigerante do 
			corpo, sendo a versão diet ainda pior pela grande quantidade de adoçante artificial.</p>
			<p>O consumo constante de refrigerante contribui para o aumento de peso, inclusive podendo levar à obesidade,
			influenciando o seu <b>IMC</b> e ainda aumentando os riscos de outras doenças, como diabetes, câncer e 
			problemas cardíacos. Além de serem <i>calorias vazias</i>, ou seja, sem nenhum valor nutricional.
			Por isso é importante rever a quantidade que você consome e inclusive tentar cortá-lo aos poucos de sua dieta.</p>"
		elsif @refri == 0
			@result_refri = "<p>Você não consume refrigerante durante a semana, parabéns. O Consumo de refrigerante, como
			conhecido por várias pessoas, traz enormes ricos para a saúde. Levando a sérios problemas, como
			obesidade, diabete, problemas cardíacos ou até mesmo cancêr e osteoporose. Preocupante! E é importante citar que 
			não adianta substituir o refrigerante comum por sua versão diet. Além de as calorias do refrigerante serem
			calorias vazias, ou seja, sem nenhum valor nutricional. Então, parabéns e continue assim.</p>"
		end

		if @pizza  >= 1 && @pizza <= 2
			 @result_pizza = "<p>Pizza é ótimo e (quase) todo mundo concorda com isso, porém, o seu consumo constante, ainda mais sendo de 3 a 5 vezes na semana, talvez seja demais. A pizza possui uma <i>grande quantidade de
			gordura</i>, incluindo a saturada, e isso é apenas o começo do problema. A pizza, produzida com farinha branca,
			entra no organismo em forma de <i>carboidratos</i> excessivos, acabam quase indo direto para os depósitos de 
			gordura, pois causa uma absorção rápida no organismo fazendo com que a pessoa fique com fome rapidamente, resultando no <i<aumento de peso</i> e no desequilíbrio dos níveis de glicose, ainda contribuindo para 
			o desenvolvimento de <i>diabetes</i>, pois por ser <i>rica em gordura</i>, ela altera o funcionamento do
			metabolismo, causando <i>resistência à insulina</i> e <i>danos ao fígado</i>. O que é ainda mais agravante no caso das pizzas congeladas, que aumentam ainda mais o número de <i>sódio</i> e <i>conservantes</i>. Tente reduzir o número, reduzindo para 1 ou 2 vezes no mês, ou optar por versões mais saudáveis, como low-carb ou as com massa de batata ou brocólis.</p>"
		elsif @pizza  >= 3 && @pizza <= 5
			@result_pizza = "<p>Pizza é ótimo e (quase) todo mundo concorda com isso, porém, o seu consumo constante, ainda mais sendo de 3 a 5 vezes na semana, é bastante prejudicial. A pizza possui uma <i>grande quantidade de
			gordura</i>, incluindo a saturada, e isso é apenas o começo do problema. A pizza, produzida com farinha branca,
			entra no organismo em forma de <i>carboidratos</i> excessivos, acabam quase indo direto para os depósitos de 
			gordura, pois causa uma absorção rápida no organismo fazendo com que a pessoa fique com fome rapidamente, resultando no <i<aumento de peso</i> e no desequilíbrio dos níveis de glicose, ainda contribuindo para 
			o desenvolvimento de <i>diabetes</i>, pois por ser <i>rica em gordura</i>, ela altera o funcionamento do
			metabolismo, causando <i>resistência à insulina</i> e <i>danos ao fígado</i>. O que é ainda mais agravante no caso das pizzas congeladas, que aumentam ainda mais o número de <i>sódio</i> e <i>conservantes</i>. Tente reduzir o número ou optar por versões mais saudáveis, como low-carb ou as com massa de batata ou brocólis.</p>"
		elsif @pizza  >= 6 && @pizza <= 7
			@result_pizza = "<p>Pizza é ótimo e (quase) todo mundo concorda com isso, porém, o seu consumo constante, ainda mais sendo de 6 a 7 vezes na semana, é bem preocupante! Em uma única fatia de pizza, o valor de sódio já
			é quase metade do valor indicado para o dia todo, além de possuir uma <i>grande quantidade de gordura</i>,
			incluindo a saturada, e isso é apenas o começo do problema. A pizza, produzida com farinha branca, entra 
			no organismo em forma de <i>carboidratos</i> excessivos, acabam quase indo direto para os depósitos de gordura,
			pois causa uma absorção rápida no organismo fazendo com que a pessoa fique com fome rapidamente,
			resultando no <i<aumento de peso</i> e no desequilíbrio dos níveis de glicose, ainda contribuindo para o desenvolvimento de <i>diabetes</i>, pois por ser <i>rica em gordura</i>, ela altera o funcionamento do
			metabolismo, causando <i>resistência à insulina</i> e <i>danos ao fígado</i>. O que é ainda mais agravante no caso das pizzas congeladas, que aumentam ainda mais o número de <i>sódio</i> e <i>conservantes</i>. Tente reduzir o número ou optar por versões mais saudáveis, como low-carb ou as com massa de batata ou brocólis.</p>"
		elsif @pizza == 0
			@result_pizza = "<p>Você não consome pizza nenhuma vez por semana, parabéns! A pizza possui uma <i>grande quantidade de
			gordura</i>, incluindo a saturada, e isso é apenas o começo do problema. A pizza, produzida com farinha branca,
			entra no organismo em forma de <i>carboidratos</i> excessivos, acabam quase indo direto para os depósitos de 
			gordura, pois causa uma absorção rápida no organismo fazendo com que a pessoa fique com fome rapidamente, resultando no <i<aumento de peso</i> e no desequilíbrio dos níveis de glicose, ainda contribuindo para 
			o desenvolvimento de <i>diabetes</i>, pois por ser <i>rica em gordura</i>, ela altera o funcionamento do
			metabolismo, causando <i>resistência à insulina</i> e <i>danos ao fígado</i>. O que é ainda mais agravante no caso das pizzas congeladas, que aumentam ainda mais o número de <i>sódio</i> e <i>conservantes</i>. Continue assim! </p>"
		end

		#render :partial => 'resultado'
		render resultado_imc_index_path
	end
end
