return {
    descriptions = {
        Back={
            b_pmcmod_thumbDeck = {
                name = 'Baralho Polegar',
                text = {
                    "Começa com {C:gold}100${}",
			        "Não ganha dinheiro com restos de",
                    "{C:red}descartes{}, {C:blue}mãos{} or {C:money}juros{}",
                    "Mais chance de encontrar",
                    "Página Chaves com {C:edition}Edições{}",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho de Ciências Sociais{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
            b_pmcmod_middleDeck = {
                name = 'Baralho Médio',
                text = {
                    "{C:attention}Aumenta{} a pontuação ",
                    "dos Encontros",
			        "Recompensas de sobras de Mão",
                    "são {C:red}triplicadas{}",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho de Linguagem{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
            b_pmcmod_ringDeck = {
                name = 'Baralho Anelar',
                text = {
                    "Começa com {C:attention}5{}",
                    "Páginas Chave aleatórias",
			        "Páginas Chave mudam após",
                    "cada Recepção",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho de Arte{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
            b_pmcmod_silenceDeck = {
                name = 'Baralho do Silêncio',
                text = {
                    "Começa com a Página Chave",
                    "{C:attention,T:j_pmcmod_silence}Tempo em Fluxo{} Eterna.",
                    "{C:blue}+2 mãos{}",
                    "{C:red}+2 descartes{}",
                    "{C:inactive}+1 espaço para Página Chave{}",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho de Religião{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
            b_pmcmod_todaysShyLookDeck = {
                name = 'Baralho Tímido',
                text = {
                    "Começa com a Página Chave",
			        "{C:attention,T:j_pmcmod_shylook}Expressão Tímida de Hoje{} Eterna.",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho de Literatura{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
            b_pmcmod_hatredDeck = {
                name = 'Baralho do Amor',
                text = {
                    "Começa com a Página Chave",
			        "{C:attention,T:j_pmcmod_queenOfHatred}Rainha do Ódio{} Eterna.",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho das Ciências Naturais{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
            b_pmcmod_serpentDeck = {
                name = 'Baralho da Serpente',
                text = {
                    "Ganha um novo bonus a {C:attention}cada{}",
			        "{C:attention}Ato concluído{} (até o Ato 10).",
			        "Pontuação dos Encontros aumentada",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho das Geral{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
        },
        Blind={},
        Edition={},
        Enhanced={
            m_pmcmod_burn = {
                name = "Carta Queimada",
                text = {
                    "Dá {C:chips}0.1%{} da pontuação total",
                    "do Encontro como fichas extras",
                    "Atualmente {C:chips}+#1#{} fichas extras",
                },
            },
        },
        Joker={
            j_pmcmod_angela = {
                name = 'Angela',
                text = {
                    "Olá, Gerente.",
			        "Estamos no {C:red}Dia #1#{}.",
    			    "Vamos dar nosso melhor hoje.",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta A Cidade{}',
                },
            },
            j_pmcmod_michelle = {
                name = 'Michelle',
                text = {
                    "Vender outra Página Chave durante uma Recepção",
			        "disarma o seu efeito. Ganhe {X:mult,C:white} X#1# {} Multi",
                    "por cada Recepção desarmada deste jeito.",
                    "Se isso acontecer mais do que 6 vezes, {C:red}sofra um colapso{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta Boato{}',
                },
            },
            j_pmcmod_elijah = {
                name = 'Elijah',
                text = {
                    "Ganhe {C:mult}2{} Multi por cada nível de Mão de Poker acima do 1.",
			        "Se o nível de qualquer Mão de Poker ficar acima de 7, {C:red}sofra um colapso{}",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta Mito Urbano{}',
                },
            },
            j_pmcmod_giovanni = {
                name = 'Giovanni',
                text = {
                    "Ganhe {C:mult}7 Multi{} and {C:chips}10 Fichas{}",
                    "no final de cada Ato. Requer que",
                    "{C:attention} #1# consumível(is){} sejam usados em cada Ato.",
                    "Se estas condições não se completarem, após derrotar uma Recepção {C:red}sofra um colapso{}",
                    "Requerimento de consumíveis dobra após cada Ato.",
                    "{C:inactive}(Atualmente {C:mult}+#2#{C:inactive} Multi)",
                    "{C:inactive}(Atualmente {C:chips}+#3#{C:inactive} Fichas)",
                    "{C:inactive}(Consumíveis usados atualmente: {C:chips}#4#{C:inactive})",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta Lenda Urbana{}',
                },
            },
            j_pmcmod_gabriel = {
                name = 'Gabriel',
                text = {
                    "Ganhe {C:mult}1{} Multi para cada carta {C:hearts}Copas{} ou {C:diamonds}Ouros{} pontuada",
                    "e {C:chips}3{} Fichas para cada carta {C:spades}Espadas{} ou {C:clubs}Paus{} pontuada",
                    "Se a diferença do total pontuado de {C:spades}Espadas{}/{C:clubs}Paus{}",
                    "e {C:hearts}Copas{}/{C:diamonds}Ouros{} ultrapassar 6, {C:red}sofra um colapso{}",
                    "{C:inactive}(Total de {C:hearts}Copas{}: #3#)",
                    "{C:inactive}(Total de {C:diamonds}Outros{}: #4#)",
                    "{C:inactive}(Total de {C:spades}Espadas{}: #1#)",
                    "{C:inactive}(Total de {C:clubs}Paus{}: #2#)",
                    "{C:inactive}(Atualmente {C:mult}+#5#{C:inactive} Multi)",
                    "{C:inactive}(Atualmente {C:chips}+#6#{C:inactive} Fichas)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta Lenda Urbana{}',
                },
            },
            j_pmcmod_daniel = {
                name = 'Daniel',
                text = {
                    "Começa com {X:mult,C:white}X#4#{} Multi",
                    "Toda vez que uma carta pontua, tem {C:green}#1# em #3#{} de chance",
                    "the aumentar o Multi em 0.1 e tem {C:green}#1# em #2#{} de chance",
                    "de diminuir pela mesma quantidade. Se a Multi",
                    "chegar a {X:mult,C:white}X1{}, {C:red}sofra um colapso{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
            j_pmcmod_kali = {
                name = 'Kali',
                text = {
                    "Ganha {C:mult}25{} Mult por cada Mão usada nessa Cena",
                    "Se o total de Mãos zerar, {C:red}sofra um colapso{}",
                    "{C:inactive}(Currently {C:mult}#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta Estrela da Cidade{}',
                },
            },
            j_pmcmod_garion = {
                name = 'Garion',
                text = {
                    "Se a primeira Mão da Cena tiver mais de uma carta,",
                    "destrua todas as cartas pontuadas e ganhe {X:mult,C:white}X#2#{} Mult por carta.",
                    "Se o total de cartas no Baralho ficar abaixo da metade da",
                    "quantidade original, {C:red}sofra um colapso{}",
                    "{C:inactive}(Atualmente {X:mult,C:white}X#1#{C:inactive} Multi)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta Impuritas Civitatis{}',
                },
            },
            j_pmcmod_lisa = {
                name = 'Lisa',
                text = {
                    "Cartas Ás pontuam {C:mult}#2#{} Multi",
                    "Se {C:attention}Enoch{} não estiver presente no começo do Encontro, invoque-o.",
                    "Toda vez que {C:attention}Enoch{} for destruido, aumente o Multi do Ás em {C:mult}#3#{}",
                    "Se {C:attention}Enoch{} morrer mais que 7 vezes, {C:red}sofra um colapso{}.",
                    "{C:inactive}(Testemunhou a morte de Enoch {C:mult}#1#{C:inactive} times)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta Praga Urbana{}',
                },
            },
            j_pmcmod_enoch = {
                name = 'Enoch',
                text = {
                    "Ganha {C:chips}#2#{} Fichas por carta pontuada",
                    "Se este valor chegar a {C:chips}100{}, destrua esta carta",
                    "{C:inactive}(Atualmente {C:chips}+#1#{C:inactive} Fichas)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho L Corp{}',
                    'pelo menos na {C:attention}Aposta Praga Urbana{}',
                },
            },
            j_pmcmod_hermann = {
                name = 'Hermann',
                text = {
                    "Na {C:attention}primeira Mão jogada{}, randomize as melhorias das",
                    "cartas pontuadas. Também tem {C:green}#1# em #2#{} de chance de dar um selo aleatório",
                    "e {C:green}#1# em #3#{} de chance de dar uma {C:dark_edition}Edição{} aleatória.",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho K Corp{}',
                    'pelo menos na {C:attention}Aposta Impuritas Civitatis{}',
                },
            },
            j_pmcmod_gubo = {
                name = 'Gubo',
                text = {
                    "No {C:attention}começo do Encontro{}, tem {C:green}#4# em #5#{} chance",
                    "de mirar em uma Página Chave aleatória. Gubo atirará na Página Chave selecionada",
                    "no final do Encontro. Se a Página Chave for Brochura ou",
			        "Capa Dura, ganhe ou {C:mult}#2#{} ou {C:mult}#3#{} Mult, dependendo da raridade.",
                    "Esse valor dobra se a Página Chave for de um Pecador",
                    "{C:inactive}(Atualmente {C:mult}+#1#{C:inactive} Multi)",
                    "{C:inactive}(Mirando em: {C:red}#6#{C:inactive})",
                    "{C:inactive}Esta Página Chave tem uma interação secreta.",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho K Corp{}',
                    'pelo menos na {C:attention}Aposta Impuritas Civitatis{}',
                },
            },
            j_pmcmod_aseah = {
                name = 'Aseah',
                text = {
                    "No começo do Encontro, transforma a Página Chave",
                    "a direita em outra de rank superior (até Limitada)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho K Corp{}',
                    'pelo menos na {C:attention}Aposta Impuritas Civitatis{}',
                },
            },
            j_pmcmod_panther = {
                name = 'Pantera',
                text = {
                    "Ganhe {C:mult}+#2#{} Multi",
                    "para cada carta {C:planet}Pecador{} vendida",
			        "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho da Serpente{}}',
                    'pelo menos na {C:attention}Aposta Mito Urbano{}',
                },
            },
            j_pmcmod_lion = {
                name = 'Leão',
                text = {
                    "Ganhe {C:chips}+#2#{} Fichas",
                    "para cada carta {C:planet}Pecador{} vendida",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho da Serpente{}',
                    'pelo menos na {C:attention}Aposta Lenda Urbana{}',
                },
            },
            j_pmcmod_wolf = {
                name = 'Lobo',
                text = {
                    "Ganhe {X:mult,C:white}X#1#{} Multi",
                    "para cada carta {C:planet}Pecador{} vendida",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho da Serpente{}',
                    'pelo menos na {C:attention}Aposta Praga Urbana{}',
                },
            },
            j_pmcmod_hopkins = {
                name = 'Hopkins',
                text = {
                    "{C:mult}+#1#{} Multi",
                    "{C:green}#2# em #3#{} de chance desta Página Chave",
                    "destruir outra no final",
                    "da Cena e fugir",
                },
            },
            j_pmcmod_aya = {
                name = 'Aya',
                text = {
                    "{C:chips}+#1#{} Fichas",
                    "{C:green}#2# em #3#{} de chance desta Página Chave",
                    "se destruir no final da Cena",
                    "Deixa para trás uma {C:tarot, T:v_tarot_merchant} Máscara de Gas {}",
                },
            },
            j_pmcmod_yuri = {
                name = 'Yuri',
                text = {
                    "{C:green}#1# em #2#{} de chance desta Página Chave",
                    "se destruir no final da Cena",
                    "Se esta Página Chave sobreviver {C:red}#3#{} Cenas,",
                    "venda-a para ganhar um {C:money, T:c_soul} Ramo Dourado {}",
                    "Total de Cenas sobrevividas: {C:red}#4#{}",
                },
            },
            j_pmcmod_demian = {
                name = 'Demian',
                text = {
                    "Ganhe {X:mult,C:white}X#1#{} Multi por",
                    "cada {C:spectral}Carta Espectral{} usada",
                    "{C:inactive}(Atualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho N Corp{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
            j_pmcmod_rim = {
                name = 'Rim',
                text = {
                    "Divida todas as {C:green,E:1,S:1.1}probabilidades",
                    "{C:attention}listadas por dois",
                    "{C:inactive}(ex: {C:green}1 em 3{C:inactive} -> {C:green}1 em 6{C:inactive})",
                },
                unlock = {
                    'Pontue pelo menos 100000 chips',
                    'com uma única mão',
                },
            },
            j_pmcmod_sanson = {
                name = 'Sansão',
                text = {
                    "Força uma carta a estar sempre selecionada",
                    "Dobra o valor base da Mão de Poquer atual",
                }
            },
            j_pmcmod_effie = {
                name = 'Effie',
                text = {
                    "Ganhe{C:mult} +#2# {}Multi se a mão jogada",
                    "contém um{C:attention} #3#{}. ",
                    "Valor reseta se a mão jogada for errada",
                    "(Mão de Poquer muda a cada Cena)",
                    "{C:inactive}(Atualmente{C:mult} #1# {C:inactive}Multi)"
                },
            },
            j_pmcmod_saude = {
                name = 'Saude',
                text = {
                    "Ganhe{C:chips} +#2# {}Fichas se a mão jogada",
                    "contém uma carta de {C:attention} #3# {}",
                    "Valor reseta se a mão não conter o naipe escolhido",
                    "(Naipe muda a cada Cena) ",
                    "{C:inactive}(Atualmente{C:chips} #1# {C:inactive}Fichas)",
                },
            },
            j_pmcmod_aida = {
                name = 'Aida',
                text = {
                    "Cada mão jogada garante um dos seguintes efeitos:",
                    "{C:chips} +#1# Fichas {},{C:chips} +#2# Fichas {},{C:chips} +#3# Fichas {},",
                    "{C:chips} +#4# Ficha {},{C:attention} #5# Fichas{}, or{C:mult} #6# Fichas {}",
                },
            },
            j_pmcmod_sonya = {
                name = 'Sonya',
                text = {
                    "Garante {C:chips}#1#{} Fichas se a mão jogada conter um {C:attention}Flush{}",
                    "Adicionalmente, tem {C:green}#2# em #3#{} de chance de encontrar",
                    "um {C:attention, T:c_soul}Ramo Dourado{}",
                },
                unlock = {
                    'Em uma mão, pontue um valor maior que 50000 Fichas',
                    'e que seja multiplo de 7',
                },
            },
            j_pmcmod_kromer = {
                name = 'Kromer',
                text = {
                    "Quando um {C:attention}Encontro Normal{} or {C:attention}Arriscado{}",
                    "for selecionado, se uma Página Chave de um {C:attention}Herege{} estiver presente,",
                    "destrua e ganhe {X:mult,C:white}X#1#{} Multi",
                    "(acontece uma vez por Encontro)",
                    "{C:inactive}(Atualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho N Corp{}',
                    'pelo menos na {C:attention}Aposta Praga Urbana{}',
                },
            },
            j_pmcmod_siegfried = {
                name = 'Siegfried',
                text = {
                    "Ganhe {X:mult,C:white}X#1#{} Multi toda vez que uma Cena",
                    "for concluída em que uma mão pontuou mais que o valor alvo",
                    "{C:inactive}(Atualmente {X:mult,C:white}X#2#{C:inactive} Multi)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho K Corp{}',
                    'pelo menos na {C:attention}Aposta Estrela da Cidade{}',
                },
            },
            j_pmcmod_guido = {
                name = 'Guido',
                text = {
                    "Quando um {C:attention}Encontro Normal{} or {C:attention}Arriscado{}",
                    "for selecionado, adicione uma carta aletória com {c:red}selo vermelho{} a mão.",
                    "Ganhe {C:mult}+#1#{} Multi para cada {c:red}selo vermelho{} no baralho",
                    "{C:inactive}(Atualmente {C:mult} +#2# {C:inactive} Multi)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho N Corp{}',
                    'pelo menos na {C:attention}Aposta Mito Urbano{}',
                },
            },
            j_pmcmod_papaBongy = {
                name = 'Papa Bongy',
                text = {
                    "Quando um {C:attention}Encontro{} começar, invoque até 4 Bongys aleatórios,",
                    "até um total de 20 Bongys por toda a tentativa",
                    "Para cada Bongy derrotado, Papa Bongy ganha um dos seguinte efeitos:",
                    "Bongy (Molho de Soja): {C:chips}10{} Fichas",
                    "Bongy (Molho Vermelho): {C:mult}5{} Multi",
                    "Bongy (Normal): {X:mult,C:white}X0.1{} Multi",
                    "Bongy (Chef): {C:gold}1${} at the end of the Encounter",
                    "{C:inactive}(Atualmente{C:chips} #1# {C:inactive} Fichas)",
                    "{C:inactive}(Atualmente{C:mult} #2# {C:inactive} Multi)",
                    "{C:inactive}(Atualmente {X:mult,C:white}X#3#{C:inactive} Multi)",
                    "{C:inactive}(Atualmente{C:gold} #4#$ {C:inactive})",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho K Corp{}',
                    'pelo menos na {C:attention}Aposta Lenda Urbana{}',
                },
            },
            j_pmcmod_dongrang = {
                name = 'Dongrang',
                text = {
                    "No final de cada Recepção, ganhe",
                    "{C:dark_edition}Policromo{} para uma Página Chave aleatória que não tenha Edição",
                    "Ganhe {X:mult,C:white}X#2#{} Multi para cada Página Chave com {C:dark_edition}Policromo{}",
                    "{C:inactive}(Atualmente {X:mult,C:white}X#1#{C:inactive} Multi)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho K Corp{}',
                    'pelo menos na {C:attention}Aposta Pesadelo Urbano{}',
                },
            },
            j_pmcmod_dongrang_alt = {
                name = 'Dongrang, Quem Rejeita a Tudo',
                text = {
                    "No final de cada Recepção, ganhe",
                    "{C:dark_edition}Policromo{} para uma Página Chave aleatória que não tenha Edição",
                    "Ganhe {X:mult,C:white}X#2#{} Multi para cada Página Chave com {C:dark_edition}Policromo{}",
                    "{C:inactive}(Atualmente {X:mult,C:white}X#1#{C:inactive} Multi)",
                },
            },
            j_pmcmod_dongbaek = {
                name = 'Dongbaek',
                text = {
                    "Cada 9 pontuado dá {X:mult,C:white}X#1#{} Multi",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho K Corp{}',
                    'pelo menos na {C:attention}Aposta Praga Urbana{}',
                },
            },
            j_pmcmod_samjo = {
                name = 'Samjo',
                text = {
                    "{C:chips}20{} Fichas base",
                    "Ganhe {C:chips}20{} Fichas para cada",
                    "Página Chave {C:edition}Policromo{} possuída",
                    "{C:inactive}(Atualmente {C:chips}#1#{C:inactive} Fichas)",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho K Corp{}',
                    'pelo menos na {C:attention}Aposta Mito Urbano{}',
                },
            },
            j_pmcmod_shrenne = {
                name = 'Shrenne',
                text = {
                    "Vender uma Página Chave adiciona metade",
                    "do seu valor de venda como {C:mult}Multi{}",
                    "{C:inactive}(Atualmente {C:mult}#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_alfonso = {
                name = 'Alfonso',
                text = {
                    "Dá {C:money}$#1#{} por mão jogada se o nível",
                    "da Mão de Poquer atual for maior que 1",
                    "{C:green}#2# em #3#{} de chance de reduzir o nível da Mão de Poquer",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho K Corp{}',
                    'pelo menos na {C:attention}Impuritas Civitatis Stake{}',
                },
            },
            j_pmcmod_marile = {
                name = 'Marile',
                text = {
                    "Esta Página Chave começa com {C:mult}#2#{} Multi",
                    "Perca {C:mult}10{} Multi para cada Página Chave com Edições",
                    "e {C:mult}2{} Multi para cada carta Melhorada.",
                    "Destrua está Página Chave na próxima mão caso",
                    "o Multi chegar a 0",
                    "{C:inactive}(Atualmente {C:mult}#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_ran = {
                name = 'Ran',
                text = {
                    "Esta Página Chave começa com {C:chips}#2#{} Fichas",
			        "Perca {C:chips}20{} Fichas para cada Página Chave com Edições",
			        "e {C:chips}5{} Fichas para cada carta Melhorada.",
			        "Destrua está Página Chave na próxima mão caso",
			        "as Fichas chegarem a 0",
			        "{C:inactive}(Atualmente {C:chips}#1#{C:inactive} Fichas)",
                },
            },
            j_pmcmod_niko = {
                name = 'Niko',
                text = {
                    "Adicione {C:mult}Multi{} igual a {C:attention}triplo{} a quantidade de",
			        "cartas que sobraram na mão",
                },
            },
            j_pmcmod_robotHod = {
                name = 'Hod (Robô)',
                text = {
                    "{X:mult,C:white}X#2#{} Multi",
                    "Desabilita uma Página Chave aleatória",
                    "a cada Encontro"
                },
            },
            j_pmcmod_robotMalkuth = {
                name = 'Malkuth (Robô)',
                text = {
                    "Ganhe 1 Mult para cada Mão de Poquer acima do nível 1",
                    "Tem {C:green}#2# in #3#{} de chance de diminuir o nível da Mão jogada",
                    "{C:inactive}(Atualmente {C:mult}#1#{C:inactive} Mult)",
                },
            },
            j_pmcmod_robotNetzach = {
                name = 'Netzach (Robô)',
                text = {
                    "Ganhe {C:mult}3 Multi{} and {C:chips}5 Fichas{}",
                    "no final de cada Ato",
                    "{C:red}Aumenta os preços da loja em 5%{}",
                    "{C:red}após cada Encontro{}",
                    "{C:inactive}(Atualmente {C:mult}+#2#{C:inactive} Multi)",
                    "{C:inactive}(Atualmente {C:chips}+#3#{C:inactive} Fichas)",
                },
            },
            j_pmcmod_robotYesod = {
                name = 'Yesod (Robô)',
                text = {
                    "Ganhe {C:mult}1{} Multi para cada três cartas {C:hearts}Copas{} e {C:diamonds}Ouros{} pontuadas",
                    "e {C:chips}1{} Fichas para cada carta {C:spades}Espadas{} e {C:clubs}Paus{} pontuadas",
                    "Tem {C:green}#7# in #8#{} de chance de adicionar Perecível a uma Página Chave",
                    "aleatória a cada mão jogada",
                    "{C:inactive}(Atualmente {C:mult}+#5#{C:inactive} Multi)",
                    "{C:inactive}(Atualmente {C:chips}+#6#{C:inactive} Fichas)",
                },
            },
            j_pmcmod_robotChesed = {
                name = 'Chesed (Robô)',
                text = {
                    "Começa com {X:mult,C:white}X#4#{} Multi",
                    "Toda vez que uma carta pontua, tem {C:green}#1# in #2#{} de chance",
                    "de aumentar o Multi em 0.1.",
                    "Remove melhorias das cartas jogadas",
                    "{C:inactive}(Atualmente {X:mult,C:white}X#3#{C:inactive} Multi)",
                },
            },
            j_pmcmod_robotGebura = {
                name = 'Gebura (Robô)',
                text = {
                    "Ganhe {C:mult}10{} Multi para cada mão utilizada nesta Cena",
                    "Perca a metade dessa quantidade em dinheiro a cada Mão jogada",
                    "{C:inactive}(Atualmente {C:mult}#1#{C:inactive} Multi)",
                },
            },
            j_pmcmod_robotBinah = {
                name = 'Binah (Robô)',
                text = {
                    "Ganhe {X:mult,C:white}X#2#{} por cada unidade de cartas",
                    "faltando da quantidade original do Baralho",
                    "Adicione uma carta aleatória no início de cada Encontro",
                    "{C:inactive}(Atualmente {X:mult,C:white}X#1#{C:inactive} Multi)",
                },
            },
            j_pmcmod_robotTiph = {
                name = 'Tiph A (Robô)',
                text = {
                    "Cartas Ás dão {C:mult}#2#{} Multi and {C:chips}#4# Fichas{}",
                    "Se {C:attention}Enoch{} não estiver presente no início do encontro, invoque-o.",
                    "Toda vez que {C:attention}Enoch{} for destruído, incremente o Multi do Ás em {C:mult}#3#{}",
                },
            },
            j_pmcmod_robotEnoch = {
                name = 'Tiph B (Robô)',
                text = {
                    "Ganhe {C:chips}#2#{} Fichas por carta pontuada",
                    "Se este valor acumulado chegar em {C:chips}100{}, destrua esta carta",
                    "{C:inactive}(Atualmente {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_pmcmod_silence = {
                name = 'Tempo em Fluxo',
                text = {
                    "Perca a tentativa caso a Cena não seja",
                    "concluída em {C:mult}30 segundos{}",
                },
            },
            j_pmcmod_shylook = {
                name = "Expressão Tímida de Hoje",
                text = {
                    "Troca de expressões regularmente.",
                    "Dá entre {X:mult,C:white}X0{} e {X:mult,C:white}X2{} Multi dependendo da",
                    "expressão em que está quando a mão é jogada",
                },
            },
            j_pmcmod_queenOfHatred = {
                name = "Queen of Hatred",
                text = {
                    "Toda carta pontuada e descartada é contabilizada",
                    "Ganhe efeitos baseados nas diferenças entre estes valores:",
                    "< 4: {C:attention}Reative{} todas as Páginas Chave",
                    "< 7: Ganhe {C:chips}100{} Fichas",
                    "> 10: {X:mult,C:white}X0.5{} Multi",
                    "> 14: {C:attention}Transforme{}. Disabilite uma página no início de cada Cena.",
                    "Se a transformação ocorrer, fique neste estado por duas Cenas,",
                    "então volte ao normal e a diferença reseta para 9",
                    "{C:inactive}(Descartados:{C:attention} #1# {C:inactive})",
                    "{C:inactive}(Pontuados:{C:attention} #2# {C:inactive})",
                    "{C:inactive}(Contagem atual:{C:attention} #8# {C:inactive})",
                    "{C:inactive}(Cenas transformadas:{C:attention} #7# {C:inactive})",
                },
            },
            j_pmcmod_chickenA = {
                name = "Bongy (Normal)",
                text = {
                    "Crocante por fora e suculento por dentro.",
                    "Após {C:attention}3 Cenas concluídas{}, destrua no final da Cena.",
                    "{C:inactive}(Atualmente{C:attention} #1# {C:inactive}Cenas concluídas)",
                },
            },
            j_pmcmod_chickenB = {
                name = "Bongy (Soy Sauce)",
                text = {
                    "Coberto com temperos cheirosos.",
                    "Após {C:blue}5 mãos jogadas{}, destrua no final da Cena.",
                    "{C:inactive}(Atualmente{C:blue} #1# {C:inactive}mãos jogadas)",
                },
            },
            j_pmcmod_chickenC = {
                name = "Bongy (Red Sauce)",
                text = {
                    "Coberto com um delicioso molho de...tomate?",
                    "Após {C:red}20 cartas descartadas{}, destrua no final da Cena",
                    "{C:inactive}(Atualmente{C:mult} #1# {C:inactive}descartes usados)",
                },
            },
            j_pmcmod_chickenD = {
                name = "Bongy (Chef)",
                text = {
                    "Seria muito pesado pedir um frango frito?",
                    "Após {C:gold}3 pacotes abertos{}, destrua no final da Cena.",
                    "{C:inactive}(Atualmente{C:gold} #1# {C:inactive}pacotes abertos)",
                },
            },
        },
        Other={
            pmcmod_markofcain_seal = {
                name = "Marca de Caim",
                text = {
                    "{X:mult,C:white}X1.2{} Multi",
                },
            },
        },
        Partner={
            pnr_pmcmod_dante = {
                name = "Dante",
                text = {
                    "Gerente",
                    "Ganha {C:mult}#2#{} Multi",
                    "em cada mão jogada.",
                    "{C:inactive}(Atualmente{C:mult} #1# {C:inactive}Multi)",
                }
            },
            pnr_pmcmod_roland = {
                name = "Roland",
                text = {
                    "Sicário",
                    "...",
                }
            },
            pnr_pmcmod_netzach = {
                name = "Netzach",
                text = {
                    "Bibliotecário",
                    "Ganha {C:money}$#1#{} após",
                    "qualquer Encontro.",
                }
            },
        },
        Planet={},
        Spectral={
            c_pmcmod_witness = {
                name = "Testemunha",
                text = {
                    "Transforma toda carta em mãos",
                    "em uma carta Realeza de Paus",
                }
            },
            c_pmcmod_outcast = {
                name = "Exilado",
                text = {
                    "Toda carta em mãos",
                    "ganha uma melhoria aleatória",
                    "-1 tamanho da mão",
                }
            },
            c_pmcmod_unloving = {
                name = "Indiferente",
                text = {
                    "Destroi uma Página Chave aleatória.",
                    "Dá Bonus para todas as cartas na mão",
                }
            },
        },
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
        Sleeve = {
            sleeve_pmcmod_thumbDeck = {
                name = "Capa Polegar",
                text = {
                    "Começa com {C:gold}100${}",
			        "Não ganha dinheiro com restos de",
                    "{C:red}descartes{}, {C:blue}mãos{} or {C:money}juros{}",
                    "Mais chance de encontrar",
                    "Página Chaves com {C:dark_edition}Edições{}",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho Polegar{}',
                    'pelo menos na {C:attention}Aposta Boato{}',
                },
            },
            sleeve_pmcmod_middleDeck = {
                name = "Capa Média",
                text = {
                    "{C:attention}Aumenta{} a pontuação ",
                    "dos Encontros",
			        "Recompensas de sobras de Mão",
                    "são {C:red}triplicadas{}",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho Médio{}',
                    'pelo menos na {C:attention}Aposta Boato{}',
                },
            },
            sleeve_pmcmod_ringDeck = {
                name = "Capa Anelar",
                text = {
                    "Começa com {C:attention}5{}",
                    "Páginas Chave aleatórias",
			        "Páginas Chave mudam após",
                    "cada Recepção",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho Anelar{}',
                    'pelo menos na {C:attention}Aposta Boato{}',
                },
            },
            sleeve_pmcmod_silenceDeck = {
                name = "Capa do Silêncio",
                text = {
                    "Começa com a Página Chave",
                    "{C:attention,T:j_pmcmod_silence}Tempo em Fluxo{} Eterna.",
                    "{C:blue}+2 mãos{}",
                    "{C:red}+2 descartes{}",
                    "{C:inactive}+1 espaço para Página Chave{}",         
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho do Silêncio{}',
                    'pelo menos na {C:attention}Aposta Boato{}',
                },
            },
            sleeve_pmcmod_todaysShyLookDeck = {
                name = "Capa Tímida",
                text = {
                    "Começa com a Página Chave",
			        "{C:attention,T:j_pmcmod_shylook}Expressão Tímida de Hoje{} Eterna.",      
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho Tímido{}',
                    'pelo menos na {C:attention}Aposta Boato{}',
                },
            },
            sleeve_pmcmod_hatredDeck = {
                name = "Capa do Amor",
                text = {
                    "Começa com a Página Chave",
			        "{C:attention,T:j_pmcmod_queenOfHatred}Rainha do Ódio{} Eterna.",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho do Amor{}',
                    'pelo menos na {C:attention}Aposta Boato{}',
                },
            },
            sleeve_pmcmod_serpentDeck = {
                name = "Capa da Serpente",
                text = {
                    "Ganha um novo bonus a {C:attention}cada{}",
			        "{C:attention}Ato concluído{} (até o Ato 10).",
			        "Pontuação dos Encontros aumentada",
                },
                unlock = {
                    'Vença uma tentativa com o {C:attention}Baralho da Serpente{}',
                    'pelo menos na {C:attention}Aposta Boato{}',
                },
            },
        }
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={},
        high_scores={},
        labels={
            pmcmod_markofcain_seal = "Mark of Cain",
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={
            pnr_pmcmod_dante_1={
                "Ai... cacildis!",
                "M-me espera!",
            },
            pnr_pmcmod_dante_2={
                "Vamos dar o nosso melhor!",
            },
            pnr_pmcmod_dante_3={
                "Por favor, temos que fazer tudo certinho.",
                "Vergilius está assistindo...",
            },
            pnr_pmcmod_dante_4={
                "Vamos...tentar não morrer.",
            },
            pnr_pmcmod_roland_1={
                "Aquilo é aquilo e isso é isso.",
            },
            pnr_pmcmod_roland_2={
                "Hmmm... que tipo de",
                "convidados teremos desta vez?",
            },
            pnr_pmcmod_roland_3={
                "E lá vamos nós",
            },
            pnr_pmcmod_roland_4={
                "Sem dinheiro? Duro. Quer mult? Desvantagem. Quer Espectrais?",
            },
            pnr_pmcmod_roland_5={
                "*suspiro*...vamos lá...",
            },
            pnr_pmcmod_roland_6={
                "Não espere muito de mim.",
                "Sou só um Sicário de 6o grau",
                "meia-boca",
            },
            pnr_pmcmod_roland_7={
                "Será se o Netz",
                "tem uma breja?",
            },
            pnr_pmcmod_netzach_1={
                "*sigh* Vamos começar...",
            },
            pnr_pmcmod_netzach_2={
                "Podemos terminar isso logo?",
                "Tô com sono...",
            },
            pnr_pmcmod_netzach_3={
                "*suspiro*",
            },
            pnr_pmcmod_netzach_4={
                "Preciso de uma cerveja...",
            },
            pnr_pmcmod_netzach_5={
                "Vamos lá.",
            },
            pnr_pmcmod_netzach_6={
                "*sigh* Tá, né...",
            },
            pnr_pmcmod_netzach_7={
                "Preciso de algo para beber.",
            },
            pnr_pmcmod_netzach_8={
                "Ei, vamos beber algo.",
            },
        },
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}