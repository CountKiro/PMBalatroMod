return {
    descriptions = {
        Back={
            b_pmcmod_thumbDeck = {
                name = '엄지 덱',
                text = {
                    "{C:gold}$100{} 을 갖고 시작",
			        "남은 {C:red}버리기{}, {C:blue}핸드{} 또는 {C:money}이자{}로부터",
                    "더 이상 돈을 획득하지 않음",
                    "{C:dark_edition}에디션{}이 부여된 {C:attention}책장{}을",
                    "발견할 확률 증가",
                },
                unlock = {
                    '{C:attention}사회과학 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_middleDeck = {
                name = '중지 덱',
                text = {
                    "접대 점수 요구치가",
                    "{C:attention}증가{}함",
			        "남은 핸드로 받는 보상이",
                    "{C:red}3배{}로 증가",
                },
                unlock = {
                    '{C:attention}언어 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_ringDeck = {
                name = '약지 덱',
                text = {
                    "{C:attention}5{}장의 무작위 책장을",
                    "가지고 시작",
			        "매 {C:attention}접대{}가 끝날 때마다",
                    "책장이 무작위로 변경됨",
                },
                unlock = {
                    '{C:attention}예술 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_indexDeck = {
                name = '검지 덱',
                text = {
                    "영구적인",
			        "{C:attention,T:j_pmcmod_voiceOfTheCity}도시의 의지{} 책장을 가지고 시작",
                },
                unlock = {
                    '{C:attention}자연과학 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_silenceDeck = {
                name = '침묵 덱',
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_silence}침묵의 대가{} 책장을 가지고 시작.",
                    "{C:blue}+2 핸드{}",
                    "{C:red}+2 버리기{}",
                    "{C:inactive}+1 책장 슬롯{}",
                },
                unlock = {
                    '{C:attention}종교 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_todaysShyLookDeck = {
                name = '수줍은 덱',
                text = {
                    "영구적인",
			        "{C:attention,T:j_pmcmod_shylook}오늘의 표정{} 책장을 가지고 시작.",
                },
                unlock = {
                    '{C:attention}문학 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_hatredDeck = {
                name = '사랑 덱',
                text = {
                    "영구적인",
			        "{C:attention,T:j_pmcmod_queenOfHatred}증오의 여왕{} 책장을 가지고 시작.",
                },
                unlock = {
                    '{C:attention}자연과학 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_serpentDeck = {
                name = '뱀 덱',
                text = {
                    "{C:attention}무대{}를 클리어할 때마다",
			        "새로운 보너스 획득 (최대 10 무대까지).",
			        "점수 요구치 배수가 두 배로 증가.",
                },
                unlock = {
                    '{C:attention}일반 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_giftDeck = {
                name = '선물 덱',
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_laetitia}선물이야~{} 책장을 가지고 시작.",
                    "{C:blue}+2 핸드{}",
                },
                unlock = {
                    '{C:attention}문학 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_galaxyDeck = {
                name = '은하수 덱',
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_childrenOfTheGalaxy}조약돌{} 책장을 가지고 시작.",
                    "남은 핸드, 버리기 또는",
                    "이자로부터 돈을 획득하지 않음.",
                    "상점 가격 상승"
                },
                unlock = {
                    '{C:attention}예술 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            b_pmcmod_censoredDeck = {
                name = '[검열삭제]',
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_censored}[검열삭제]{} 책장을 가지고 시작.",
                    "{C:blue}+4 핸드{}",
                },
                unlock = {
                    '{C:attention}언어 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
        },
        Blind={},
        Edition={
            e_pmcmod_charge = {
                name = "충전",
                text = {
                    "카운트가 {C:blue}4{}에 도달하면",
                    "책장 효과를 한 번 더 발동",
                    "카운트: {C:blue}#1#{}"
                },
            },
        },
        Enhanced={
            m_pmcmod_bleed = {
                name = "출혈 카드",
                text = {
                    "플레이한 핸드에서 득점한",
                    "{C:red}출혈{} 카드 하나당",
                    "영구 배수 {C:red}+1{} 획득.",
                    "남은 횟수: #1#"
                },
            },
            m_pmcmod_burn = {
                name = "화상 카드",
                text = {
                    "총 접대 점수의 {C:chips}0.001%{}를",
                    "추가 칩으로 제공",
                },
            },
            m_pmcmod_poise = {
                name = "호흡 카드",
                text = {
                    "{C:green}#3# / #4#{} 확률로 {X:red,C:white}X#1#{} 배수 제공",
                    "카드가 득점할 때마다 확률이 증가함.",
                    "효과가 발동할 때마다 확률이 초기화됨."
                },
            },
            m_pmcmod_rupture = {
                name = "파열 카드",
                text = {
                    "{C:attention}카드가 득점할 때마다{} 파열 스택 부여.",
                    "그림 카드가 아니면 스택을 2배로 부여함.",
                    "스택 수치의 2배만큼 {C:chips}칩{}을 제공함.",
                    "{C:inactive}(현재 스택: {C:attention}#1#{})"
                },
            },
            m_pmcmod_tremor = {
                name = "진동 카드",
                text = {
                    "함께 득점할 경우 특정 강화 효과의",
                    "위력을 증폭시킴."
                },
            },            
            m_pmcmod_sinking = {
                name = "침잠 카드",
                text = {
                    "이 카드가 득점될 때",
                    "목표 점수를 {C:chips}5%{} 감소시킴",
                },
            },
            m_pmcmod_pallid = {
                name = "백화 카드",
                text = {
                    "{C:chips}+#1#{} 칩",
                },
            },
        },
        Joker={
            j_pmcmod_oswald = {
                name = '오스왈드',
                text = {
                    "핸드를 플레이할 때마다 {C:attention}무작위 효과{} 부여",
                    "마지막 효과: #1#"
                },
                unlock = {
                    '{C:attention}오스왈드(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_kalo = {
                name = '칼로',
                text = {
                    {"득점한 {C:diamonds}#3#{} 무늬 카드가",
			        "{C:mult}+10{} 배수를 제공."},
    			    {"현재 팀에 있는 {C:gold}엄지{} 조직원",
                    "한 명당 제공 배수가 {C:mult}+#2#{} 증가."},
                    {"득점한 모든 {C:diamonds}#3#{} 무늬 카드를 {C:green} #4# / #5# {} 확률로",
                    "{C:attention}와일드 카드{}로 변경.",
                    "{C:inactive}(현재 {C:mult}+#1#{} 배수)"},
                },
                unlock = {
                    '{C:attention}칼로(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_katriel = {
                name = '카트리엘',
                text = {
                    {"득점한 {C:hearts}#3#{} 무늬 카드가",
			        "{C:mult}+#1#{} 배수를 제공."},
    			    {"현재 덱에 있는 {C:attention}와일드 카드{}",
                    "한 장당 제공 배수가 {C:mult}+1{} 증가.",
                    "{C:inactive}(현재 {C:mult}+#2#{} 배수)"},
                },
                unlock = {
                    '{C:attention}카트리엘(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_denis = {
                name = '데니스',
                text = {
                    {"득점한 {C:spades}#3#{} 무늬 카드가",
			        "{C:mult}+#1#{} 배수를 제공."},
    			    {"현재 덱에 있는 {C:attention}와일드 카드{}",
                    "한 장당 제공 배수가 {C:mult}+1{} 증가.",
                    "{C:inactive}현재 {C:mult}+#2#{} 배수"},
                },
                unlock = {
                    '{C:attention}데니스(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_boris = {
                name = '보리스',
                text = {
                    {"득점한 {C:clubs}#3#{} 무늬 카드가",
			        "{C:mult}+#1#{} 배수를 제공."},
    			    {"현재 덱에 있는 {C:attention}와일드 카드{}",
                    "한 장당 제공 배수가 {C:mult}+1{} 증가.",
                    "{C:inactive}현재 {C:mult}+#2#{} 배수"},
                },
                unlock = {
                    '{C:attention}보리스(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_angelaLoR = {
                name = '관장 앤젤라',
                text = {
                    {"접대 시작 시 최대 {C:attention}#1#장의 소멸성 책장{}을 생성"},
                    {"상점 진입 시, {C:red}소멸된 책장을 전부 파괴{}하고",
                    "파괴된 책장 한 장당 {C:chips}+#3#{} 칩 획득.",
                    "{C:inactive}현재 {C:chips}+#2#{} 칩"}
                },
                unlock = {
                    '{C:attention}앤젤라(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_esther = {
                name = '에스더',
                text = {
                    "득점한 카드가 {C:attention}유일{}이라면,",
                    "해당 카드에 {X:red,C:white}X3{} 배수 부여",
                },
                unlock = {
                    '{C:attention}에스더(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_gloria = {
                name = '글로리아',
                text = {
                    "득점한 카드가 {C:attention}유일{}이라면,",
                    "해당 카드에 {C:gold}$5{} 배수 부여",
                },
                unlock = {
                    '{C:attention}글로리아(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_hubert = {
                name = '휴버트',
                text = {
                    "득점한 카드가 {C:attention}유일{}이라면,",
                    "해당 카드를 한 번 더 발동",
                },
                unlock = {
                    '{C:attention}휴버트(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_kim = {
                name = '김삿갓',
                text = {
                    "라운드의 {C:attention}마지막 핸드{}에서",
                    "{X:red,C:white} X#1#{} 배율을 제공함.",
                    "{C:spade}호흡 카드{}가 발동할 때마다",
                    "이 수치가 {X:red,C:white}X#2#{}만큼 증가함."
                },
                unlock = {
                    '{C:attention}김삿갓(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리',
                },
            },
            j_pmcmod_nikolai = {
                name = '니콜라이',
                text = {
                    "구매한 모든 책장을 기록함.",
                    "기록된 책장 하나당 {C:mult}+#2#{} 배수 획득",
                    "{C:inactive}현재 {C:mult}+#1#{} 배수"
                },
                unlock = {
                    '{C:attention}니콜라이(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_maxim = {
                name = '막심',
                text = {
                    {"그림 카드가 득점할 때마다 {C:blue}5{} 충전 획득",
                    "(최대 {C:blue}100{} 충전).",},
                    {"충전이 90 이상일 경우, 무대 종료 시",
                    "{C:gold}$#2#{} 획득"},
                    {"숫자 카드를 플레이하면, 카드의 숫자만큼",
                    "충전을 소모하여 카드를 한 번 더 발동.",
                    "{C:inactive}현재 {C:blue}#1#{} 충전"}
                },
                unlock = {
                    '{C:attention}막심(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_rudolph = {
                name = '루돌프',
                text = {
                    "이제 {C:dark_edition}충전{} 카드가",
                    "발동 시마다 {C:attention}두 배의 충전{}을 얻음",
                },
                unlock = {
                    '{C:attention}루돌프(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_angelica = {
                name = '안젤리카',
                text = {
                    "{C:mult}+#1#{} 배수",
                },
                unlock = {
                    '{C:attention}안젤리카(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_puppeteer = {
                name = '인형사',
                text = {
                    {"접대 시작 시, 무작위 책장을",
                    "희귀도에 기반한 {C:red}인형{}으로 변환시킴.",},
                    {"인형은 5번 발동한 후 스스로 파괴됨.",
                    "인형이 어떤 방식으로든 파괴될 경우,",
                    "{C:mult}해당 인형 배수의 절반{}을 획득함.",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)"}
                },
                unlock = {
                    '{C:attention}안젤리카(찢어짐) 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_yisang = {
                name = '1번 수감자 이상',
                text = {
                    {"사용한 {C:attention}고유한{} {C:planet}수감자{} 카드마다",
                    "{X:mult,C:white}X#2#{} 배수 획득."},
                    {"사용한 {C:planet}수감자{} 카드마다 추가로",
                    "{X:mult,C:white}X#3#{} 배수 획득.",
                    "{C:inactive}(현재 {X:mult,C:white} X#1# {C:inactive} 배수)"},
                },
                unlock = {
                    '{C:attention}이스마엘의 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_donQuixote = {
                name = '3번 수감자 돈키호테',
                text = {
                    "모든 득점 카드에서 {C:mult}영구 배수{}를 흡수함.",
                    "흡수한 수치의 {C:attention}3배{}만큼 {C:chips}칩{} 획득",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)"

                },
                unlock = {
                    '{C:attention}돈키호테 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_ryoshu = {
                name = '4번 수감자 료슈',
                text = {
                    {"책장을 판매할 때마다 {X:mult, C:white}+#1#{} 배수 획득."},
                    {"책장을 판매하면 남은 게임 동안",
                    "해당 책장이 더 이상 등장하지 않음.",
                    "{C:inactive}(현재 {X:mult, C:white}+#2#{C:inactive} 배수)"}
                },
                unlock = {
                    '{C:attention}료슈 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },            
            j_pmcmod_hongLu = {
                name = '6번 수감자 홍루',
                text = {
                    "팀에 있는 각 수감자 책장에",
                    "따라 보너스를 획득함."
                },
                unlock = {
                    '{C:attention}홍루 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_heathcliff = {
                name = '7번 수감자 히스클리프',
                text = {
                    {"매 무대 시작 시, 무작위",
                    "{C:dark_edition}네거티브{} 책장을 파괴함."},
                    {"파괴한 {C:dark_edition}네거티브{} 책장 2장마다",
                    "{C:dark_edition}+1{} 책장 슬롯 획득."},
                    {"{C:inactive}(현재 {C:dark_edition}+#2#{C:inactive} 책장 슬롯)",}
                },
                unlock = {
                    '{C:attention}히스클리프의 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_ishmael = {
                name = '8번 수감자 이스마엘',
                text = {
                    {"득점한 모든 카드에서 백화를 제거할 확률이",
                    "{C:green}#4# / #5#{} 존재함.",
                    "제거한 백화 하나당 {C:mult}+10{} 배수 획득."},
                    {"더 이상 백화 카드가 없고 에이해브가 존재한다면,",
                    "접대 종료 시 {C:red}에이해브를 파괴{}하고",
                    "{X:mult,C:white}X3{} 배수 획득.",
                    "{C:inactive}현재 {C:mult}+#2#{} 배수",
                    "{C:inactive}(현재 {X:mult,C:white} X#1# {C:inactive} 배수)"},
                },
                unlock = {
                    '{C:attention}이스마엘 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_angela = {
                name = '보조비서 앤젤라',
                text = {
                    "환영합니다 관리자님.",
			        "오늘은 {C:red}#1#일차{}입니다.",
    			    "오늘도 최선을 다해봅시다.",
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_michelle = {
                name = '미셸',
                text = {
                    {"{C:attention}접대{} 중 다른 {C:attention}책장{}을 판매하면",
                    "해당 접대가 무효화됨.",
			        "이 방식으로 무효화된 접대마다",
                    "{X:mult,C:white}X#1#{} 배수 획득."},
                    {"접대 중에 무효화되지 않았다면,",
                    "득점한 카드당 {C:gold}$4{}를 잃음."},
                    {"접대가 {C:attention}2번{} 이상 무효화되거나,",
                    "보유한 돈이 0 이하가 되면 {C:red}폭주가 발생함{}."},
                    {"이 책장이 4번의 무대를 생존하면",
                    "{C:attention}다시 한 번 기회를 얻음.",
                    "{C:inactive}(현재 {X:mult,C:white} X#2# {C:inactive} 배수)",
                    "{C:inactive}({C:red}#3#{C:inactive} 무대 생존)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_elijah = {
                name = '엘리야',
                text = {
                    {"{C:attention}족보 레벨이 1을 초과할 때마다{}",
                    "각각 {C:mult}+2{} 배수 획득."},
			        {"어떤 족보라도 레벨이",
                    "{C:attention}3을 초과{}하면, {C:red}폭주가 발생함{}."},
                    {"이 책장이 4번의 무대를 생존하면",
                    "{C:attention}다시 한 번 기회를 얻음.",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                    "{C:inactive}({C:red}#2#{C:inactive} 무대 생존)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}도시 괴담 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_giovanni = {
                name = '지오반니',
                text = {
                    {"매 무대 종료 시 {C:mult}+7 배수{}와",
                    "{C:chips}+10 칩{} 획득."},
                    {"매 무대마다 {C:attention}#1#개의 소모품{} 사용을 요구함.",
                    "요구하는 소모품 사용량은 라운드마다 증가함."},
                    {"접대 승리 후 소모품 요구량을",
                    "충족하지 못했다면, {C:red}폭주가 발생함{}."},
                    {"이 책장이 4번의 무대를 생존하면",
                    "{C:attention}다시 한 번 기회를 얻음.",
                    "{C:inactive}(현재 {C:mult}+#2#{C:inactive} 배수)",
                    "{C:inactive}(현재 {C:chips}+#3#{C:inactive} 칩)",
                    "{C:inactive}(사용한 소모품 수: {C:chips}#4#{C:inactive})",
                    "{C:inactive}({C:red}#5#{C:inactive} 무대 생존)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}도시 전설 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_gabriel = {
                name = '가브리엘',
                text = {
                    {"득점한 {C:hearts}하트{}와 {C:diamonds}다이아몬드{} 카드마다 {C:mult}+1{} 배수 획득.",
                    "득점한 {C:spades}스페이드{} 또는 {C:clubs}클로버{} 카드마다 {C:chips}+3{} 칩 획득."},
                    {"{C:spades}스페이드{}/{C:clubs}클로버{}와 {C:hearts}하트{}/{C:diamonds}다이아몬드{} 카드의",
                    "수량 차이가 6을 넘어가면, {C:red}폭주가 발생함{}."},
                    {"이 책장이 4번의 무대를 생존하면",
                    "{C:attention}다시 한 번 기회를 얻음.",
                    "{C:inactive}(총 {C:hearts}하트{}: #3#)",
                    "{C:inactive}(총 {C:diamonds}다이아몬드{}: #4#)",
                    "{C:inactive}(총 {C:spades}스페이드{}: #1#)",
                    "{C:inactive}(총 {C:clubs}클로버{}: #2#)",
                    "{C:inactive}(현재 {C:mult}+#5#{C:inactive} 배수)",
                    "{C:inactive}(현재 {C:chips}+#6#{C:inactive} 칩)",
                    "{C:inactive}({C:red}#7#{C:inactive} 무대 생존)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}도시 전설 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_daniel = {
                name = '다니엘',
                text = {
                    {"{X:mult,C:white}X2{} 배수로 시작.",
                    "카드가 득점할 때마다",
                    "배수가 {X:mult,C:white}X#2#{} 증가함.",
                    "카드를 버릴 때마다",
                    "배수가 {X:mult,C:white}X#2#{} 감소함."},
                    {"배수가 {X:mult,C:white}X1{}에 도달하면,",
                    "{C:red}폭주가 발생함{}."},
                    {"이 책장이 4번의 무대를 생존하면",
                    "{C:attention}다시 한 번 기회를 얻음.",
                    "{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)",
                    "{C:inactive}({C:red}#3#{C:inactive} 무대 생존)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_kali = {
                name = '칼리',
                text = {
                    {"이번 무대에서 플레이한 모든",
                    "{C:blue}핸드{}당 {C:mult}+25{} 배수 획득."},
                    {"마지막 {C:blue}핸드{}를 플레이하면,",
                    "{C:red}폭주가 발생함{}."},
                    {"이 책장이 4번의 무대를 생존하면",
                    "{C:attention}다시 한 번 기회를 얻음.",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                    "{C:inactive}({C:red}#2#{C:inactive} 무대 생존)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}도시의 별 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_benjamin = {
                name = '벤자민',
                text = {
                    {"사용한 고유 타로 또는 환영 카드 하나당",
                    "{X:mult,C:white}X#4#{} 배수 획득."},
                    {"경과 시간을 계산함.",
                    "타이머가 {C:red}666{}초에 도달하면,",
                    "{C:red}폭주가 발생함{}."},
                    {"이 책장이 4번의 무대를 생존하면",
                    "{C:attention}다시 한 번 기회를 얻음.",
                    "{C:inactive}(현재 {X:mult,C:white}X#3#{C:inactive} 배수)",
                    "{C:inactive}({C:red}#5#{C:inactive} 무대 생존)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}불순물 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_garion = {
                name = '가리온',
                text = {
                    {"무대의 첫 핸드에 카드가",
                    "{C:attention}한 장 이상{} 있다면,",
                    "득점한 모든 카드를 파괴하고",
                    "파괴된 카드당 {X:mult,C:white}X#2#{} 배수 획득."},
                    {"현재 덱에 있는 카드 수가",
                    "원래 카드 수의 절반 미만이 되면,",
                    "{C:red}폭주가 발생함{}."},
                    {"이 책장이 4번의 무대를 생존하면",
                    "{C:attention}다시 한 번 기회를 얻음.",
                    "{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)",
                    "{C:inactive}({C:red}#3#{C:inactive} 무대 생존)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}불순물 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_lisa = {
                name = '리사',
                text = {
                    {"에이스 카드가 {C:mult}+#2#{} 배수 제공.",
                    "접대 시작 시 {C:attention}에녹{}이 존재하지 않으면",
                    "에녹을 소환함."},
                    {"{C:attention}에녹{}이 파괴될 때마다,",
                    "에이스 배수가 {C:mult}+#3#{} 증가함."},
                    {"{C:attention}에녹{}이 3번 이상 죽으면, {C:red}폭주가 발생함{}."},
                    {"이 책장이 4번의 무대를 생존하면",
                    "{C:attention}다시 한 번 기회를 얻음.",
                    "{C:inactive}(에녹의 죽음을 목격한 횟수: {C:mult}#1#{C:inactive} 번)",
                    "{C:inactive}({C:red}#4#{C:inactive} 무대 생존)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}도시 질병 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_enoch = {
                name = '에녹',
                text = {
                    {"플레이한 카드당 {C:chips}+#2#{} 칩 획득."},
                    {"이 수치가 {C:chips}+100{}에 도달하면,",
                    "접대 종료 시 {C:red}이 카드를 파괴함{}.",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)"},
                },
                unlock = {
                    '{C:attention}L사 덱{}으로 최소',
                    '{C:attention}도시 질병 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_hermann = {
                name = '헤르만',
                text = {
                    {"{C:attention}첫 번째로 플레이한 핸드{}에서",
                    "득점한 카드들의 강화 효과를 무작위로 변경."},
                    {"또한 {C:green}#1# / #2#{} 확률로 무작위 {C:attention}인장{}을 부여하고,",
                    "{C:green}#1# / #3#{} 확률로 무작위 {C:dark_edition}에디션{}을 부여함."},
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}불순물 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_gubo = {
                name = '구보',
                text = {
                    {"{C:attention}접대 시작 시{},",
                    "{C:green}#4# / #5#{} 확률로 무작위 {C:attention}책장{}을 조준함."},
                    {"구보는 접대가 끝날 때 조준된 책장에 사격을 가함."},
                    {"해당 책장이 {C:green}보급{} 등급이거나",
                    "{C:blue}고급{} 등급인 경우, 희귀도에 따라",
                    "{C:mult}+#2#{} 또는 {C:mult}+#3#{} 배수를 획득.",
                    "만약 책장이 {C:red}수감자{}의 책장이라면 수치가 두 배가 됨.",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                    "{C:inactive}(현재 조준 대상: {C:red}#6#{C:inactive})",
                    "{C:inactive}이 책장은 숨겨진 상호작용이 존재함."},
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}불순물 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_jiaHuan = {
                name = '가환',
                text = {
                    "{C:attention}첫 번째로 플레이한 핸드{}의 족보가",
                    "2레벨 이상이라면, 해당 족보의 기본 {C:mult}+배수{}를",
                    "획득하고 {C:red}족보 레벨을 초기화함{}.",
                    "기본 배수가 이 카드의 배수보다 높을 때만 발동함."
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}불순물 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_aseah = {
                name = '아세아',
                text = {
                    "접대 시작 시,",
                    "오른쪽에 있는 {C:attention}책장{}을",
                    "{C:attention}무작위 책장{}으로 변환함.",
                    "{C:green}#1# / #2#{} 확률로 더 높은 희귀도의",
                    "책장으로 변환함",
                    "(최대 {C:purple}한정{} 등급까지)"
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}불순물 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_panther = {
                name = '표범',
                text = {
                    "판매한 {C:planet}수감자{} 카드마다",
                    "{C:mult}+#2#{} 배수 획득",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                },
                unlock = {
                    '{C:attention}뱀 덱{}으로 최소',
                    '{C:attention}도시 괴담 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_lion = {
                name = '사자',
                text = {
                    "판매한 {C:planet}수감자{} 카드마다",
                    "{C:chips}+#2#{} 칩 획득",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)",
                },
                unlock = {
                    '{C:attention}뱀 덱{}으로 최소',
                    '{C:attention}도시 전설 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_wolf = {
                name = '늑대',
                text = {
                    "판매한 {C:planet}수감자{} 카드마다",
                    "{X:mult,C:white}X#1#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white} X#2# {C:inactive} 배수)",
                },
                unlock = {
                    '{C:attention}뱀 덱{}으로 최소',
                    '{C:attention}도시 질병 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_hopkins = {
                name = '홉킨스',
                text = {
                    "{C:mult}+#1#{} 배수",
                    "{C:green}#2# / #3#{} 확률로 막 종료 시",
                    "이 책장이 다른 책장을",
                    "{C:red}파괴{}하고 떠남",
                },
            },
            j_pmcmod_aya = {
                name = '아야',
                text = {
                    "{C:chips}+#1#{} 칩",
                    "{C:green}#2# / #3#{} 확률로 막 종료 시",
                    "이 책장이 {C:red}스스로 파괴{}되고",
                    "{C:tarot}방독면{}을 남김",
                },
            },
            j_pmcmod_yuri = {
                name = '유리',
                text = {
                    {"{C:green}#1# / #2#{} 확률로 막 종료 시",
                    "이 책장이 스스로 파괴됨."},
                    {"이 책장이 {C:red}#3#{} 막 동안 생존한 후,",
                    "판매하면 {C:money, T:c_soul}황금가지{}를 획득함",
                    "현재 생존한 막: {C:red}#4#{}"},
                },
            },
            j_pmcmod_demian = {
                name = '데미안',
                text = {
                    "사용한 {C:spectral}유령 카드{}마다",
                    "{X:mult,C:white}X#1#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white} X#2# {C:inactive} 배수)",
                },
                unlock = {
                    '{C:attention}N사 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_rim = {
                name = '림',
                text = {
                    "모든 {C:attention}표기된",
                    "{C:green,E:1,S:1.1}확률{}을 절반으로 줄임",
                    "{C:inactive}(예: {C:green}1 / 3{C:inactive} -> {C:green}1 / 6{C:inactive})",
                },
                unlock = {
                    '한 핸드에 100000 칩 이상',
                    '득점 시 해금',
                },
            },
            j_pmcmod_sanson = {
                name = '산손',
                text = {
                    "카드 한 장이 항상 선택되도록 강제함",
                    "플레이한 {C:attention}족보 기본 가치{}를 3배로 증가",
                }
            },
            j_pmcmod_effie = {
                name = '에피',
                text = {
                    {"플레이한 핸드가 {C:attention}#3#{}일 경우",
                    "{C:mult}+#2#{} 배수 획득."},
                    {"해당 핸드가 포함되지 않으면",
                    "값이 초기화됨.",
                    "(족보는 매 막마다 변경됨)",
                    "{C:inactive}(현재 {C:mult}+#1# {C:inactive}배수)"}
                },
            },
            j_pmcmod_saude = {
                name = '소드',
                text = {
                    {"플레이한 핸드에 {C:attention}#3#{} 카드가",
                    "포함될 경우 {C:chips}+#2#{} 칩 획득."},
                    {"해당 카드가 포함되지 않으면",
                    "값이 초기화됨.",
                    "(문양은 매 막마다 변경됨)",
                    "{C:inactive}(현재 {C:chips}+#1# {C:inactive}칩)"},
                },
            },
            j_pmcmod_aida = {
                name = '아이드',
                text = {
                    "핸드를 플레이할 때마다",
                    "다음 효과 중 하나를 얻음:",
                    "{C:chips}+#1# 칩{}, {C:chips}+#2# 칩{},",
                    "{C:chips}+#3# 칩{}, {C:chips}+#4# 칩{},",
                    "{C:attention}#5# 칩{}, 또는 {C:mult}#6# 칩{}",
                },
            },
            j_pmcmod_sonya = {
                name = '소냐',
                text = {
                    {"플레이한 족보에 {C:attention}플러시{}가",
                    "포함될 경우 {C:chips}+#1#{} 칩 획득"},
                    {"추가로, {C:green}#2# / #3#{} 확률로",
                    "{C:attention, T:c_soul}황금가지{}를 생성함"},
                },
                unlock = {
                    '점수가 7로 나누어떨어지며',
                    '50000 칩 이상 득점 시 해금',
                },
            },
            j_pmcmod_kromer = {
                name = '크로머',
                text = {
                    "{C:attention}일반 전투{} 또는 {C:attention}정예 전투{} 선택 시,",
                    "이단 책장이 존재한다면 파괴하고",
                    "{X:mult,C:white}X#1#{} 배수 획득",
                    "(전투당 한 번만 발동)",
                    "{C:inactive}(현재 {X:mult,C:white} X#2# {C:inactive} 배수)",
                },
                unlock = {
                    '{C:attention}N사 덱{}으로 최소',
                    '{C:attention}도시 질병 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_siegfried = {
                name = '지크프리트',
                text = {
                    "핸드 점수가 전투의 목표 점수를",
                    "초과할 때마다 {X:mult,C:white}X#1#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white} X#2# {C:inactive} 배수)",
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}도시의 별 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_guido = {
                name = '귀도',
                text = {
                    {"{C:attention}일반 전투{} 또는 {C:attention}정예 전투{} 선택 시,",
                    "붉은색 인장이 찍힌 무작위 카드를 추가함."},
                    {"덱에 있는 붉은색 인장 하나당 {C:mult}+#1#{} 배수 획득",
                    "{C:inactive}(현재 {C:mult}+#2# {C:inactive} 배수)"},
                },
                unlock = {
                    '{C:attention}N사 덱{}으로 최소',
                    '{C:attention}도시 괴담 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_papaBongy = {
                name = '봉이 아빠',
                text = {
                    {"{C:attention}전투{} 시작 시, 무작위 봉이를",
                    "최대 4마리 소환",
                    "(게임 전체에서 최대 20마리)."},
                    {"봉이를 처치할 때마다 봉이 아빠가",
                    "다른 보너스를 얻음:",
                    "봉이 (간장): {C:chips}+10{} 칩",
                    "봉이 (양념): {C:mult}+5{} 배수",
                    "봉이 (일반): {X:mult,C:white}X0.1{} 배수",
                    "봉이 (주방장): 전투 종료 시 {C:gold}$1{}",
                    "{C:inactive}(현재 {C:chips}+#1# {C:inactive}칩)",
                    "{C:inactive}(현재 {C:mult}+#2# {C:inactive}배수)",
                    "{C:inactive}(현재 {X:mult,C:white}X#3#{C:inactive} 배수)",
                    "{C:inactive}(현재 {C:gold}$#4#{C:inactive})"},
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}도시 전설 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_dongrang = {
                name = '동랑',
                text = {
                    {"매 접대 종료 시, 에디션이 없는",
                    "무작위 책장에 {C:dark_edition}폴리크롬{} 부여."},
                    {"{C:dark_edition}폴리크롬{} 책장 하나당 {X:mult,C:white}X#2#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)"},
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}도시 악몽 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_dongrang_alt = {
                name = '모든 것을 네거티브하는 동랑',
                text = {
                    {"매 접대 종료 시, 에디션이 없는",
                    "무작위 책장에 {C:dark_edition}폴리크롬{} 부여."},
                    {"{C:dark_edition}폴리크롬{} 책장 하나당 {X:mult,C:white}X#2#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_dongbaek = {
                name = '동백',
                text = {
                    "플레이한 9 카드마다 {X:mult,C:white}X#1#{} 배수 획득",
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}도시 질병 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_samjo = {
                name = '삼조',
                text = {
                    "기본 {C:chips}+20{} 칩",
                    "보유 중인 {C:dark_edition}폴리크롬{} 책장 하나당",
                    "{C:chips}+20{} 칩 획득",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)",
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}도시 괴담 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_shrenne = {
                name = '슈렌느',
                text = {
                    "책장 판매 시 판매 가치의 절반을",
                    "배수로 추가함.",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                },
            },
            j_pmcmod_alfonso = {
                name = '알폰소',
                text = {
                    {"플레이한 핸드의 족보 레벨이 1을",
                    "초과할 경우, 핸드당 {C:money}$#1#{} 획득."},
                    {"{C:green}#2# / #3#{} 확률로 {C:red}족보 레벨을 감소시킴{}"},
                },
                unlock = {
                    '{C:attention}K사 덱{}으로 최소',
                    '{C:attention}불순물 판돈{}에서 승리 시 해금',
                },
            },
            j_pmcmod_marile = {
                name = '마릴',
                text = {
                    {"이 책장은 {C:mult}+#2#{} 배수로 시작함",
                    "강화된 책장당 {C:mult}+8{} 배수,",
                    "강화된 카드당 {C:mult}-2{} 배수를 잃음."},
                    {"배수가 0 이하가 될 경우,",
                    "다음에 핸드를 플레이할 때 이 책장이 파괴됨",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_ran = {
                name = '란',
                text = {
                    {"이 책장은 {C:chips}+#2#{} 칩으로 시작함",
                    "강화된 책장당 {C:chips}+24{} 칩,",
                    "강화된 카드당 {C:chips}-5{} 칩을 잃음."},
                    {"칩이 0 이하가 될 경우,",
                    "다음에 핸드를 플레이할 때 이 책장이 파괴됨",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)"},
                },
            },
            j_pmcmod_niko = {
                name = '니코',
                text = {
                    "핸드를 플레이한 후, 패에 있는 카드 수의",
                    "{C:attention}3배{}에 해당하는 {C:mult}배수{}를 추가함"
                },
            },
            j_pmcmod_ahab = {
                name = '에이해브',
                text = {
                    {"매 전투 시작 시 {C:tarot}사냥 유령 카드{}를 획득함."},
                    {"백화 카드가 득점할 때마다 {X:mult,C:white}X#1#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white}X#2#{C:inactive} 배수)"},
                },
                unlock = {
                    '{C:attention}이스마엘 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_ahab_alt = {
                name = '피쿼드호 선장 에이해브',
                text = {
                    {"매 전투 시작 시 {C:tarot}사냥 유령 카드{}를 획득함."},
                    {"백화 카드가 득점할 때마다 {X:mult,C:white}X#1#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white}X#2#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_queequeg = {
                name = '퀴케그',
                text = {
                    "이제 백화 카드가 {C:gold}$1{}를 제공함",
                },
                unlock = {
                    '{C:attention}에이해브 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_queequeg_alt = {
                name = '피쿼드호 작살잡이 퀴케그',
                text = {
                    "이제 백화 카드가 {C:gold}$1{}를 제공함",
                },
                unlock = {
                    '{C:attention}에이해브 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_starbuck = {
                name = '스타벅',
                text = {
                    "이제 백화 카드가 {C:mult}+#1#{} 배수를 제공함",
                },
                unlock = {
                    '{C:attention}에이해브 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_starbuck_alt = {
                name = '피쿼드호 일등항해사 스타벅',
                text = {
                    "이제 백화 카드가 {C:mult}+#1#{} 배수를 제공함",
                },
                unlock = {
                    '{C:attention}에이해브 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_stubb = {
                name = '스텁',
                text = {
                    "{C:green}1 / 2 확률{}로 백화 카드를 한 번 더 발동",
                },
                unlock = {
                    '{C:attention}에이해브 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_pip = {
                name = '핍',
                text = {
                    "이제 백화 카드가 {C:chips}+#1#{} 칩을 제공함",
                },
                unlock = {
                    '{C:attention}에이해브 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_pip_alt = {
                name = '피쿼드호 선원 핍',
                text = {
                    "이제 백화 카드가 {C:chips}+10{} 칩을 제공함",
                },
                unlock = {
                    '{C:attention}에이해브 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_pilot = {
                name = '파일럿',
                text = {
                    "{C:attention}전투 시작 시{} 무작위 {C:planet}수감자{} 카드 1장 생성",
                },
            },
            j_pmcmod_smee = {
                name = '스미',
                text = {
                    "플레이한 핸드에 {C:attention}플러시{}가 포함되어 있다면,",
                    "{C:attention}중앙{} 카드의 기본 칩 점수",
                    "3배만큼 배수를 추가함"
                },
            },
            j_pmcmod_ricardo = {
                name = '리카르도',
                text = {
                    {"{C:mult}+#2#{} 배수로 시작"},
                    {"이 카드가 파괴된 후, {C:attention}상점{} 종료 시",
                    "다시 돌아오며 {C:mult}+#3#{} 배수를 획득함"},
                    {"{C:attention}헤어 쿠폰{}을 사용했다면 {X:mult,C:white}X2{} 배수 획득",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                    "{C:inactive}(현재 {X:mult,C:white}X#4#{C:inactive} 배수)"},
                },
                unlock = {
                    '{C:attention}스미 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_indigoElder = {
                name = '쪽빛노인',
                text = {
                    {"이 책장이 놓인 위치에 따라 효과를 얻음",
                    "(라운드 시작 시 선택됨):",
                    "2   -> 막이 끝날 때 {C:gold}돈{} 획득",
                    "3   -> {C:chips}칩{} 획득",
                    "4   -> 득점한 카드당 {C:mult}+배수{} 획득",
                    "5   -> {X:mult,C:white}X배수{} 획득"},
                    {"막을 클리어할 때, 현재 위치가 아닌",
                    "다른 모든 위치의 보너스가 증가함."},
                    {"1번 위치에 두면 {C:attention}모든 효과가 적용되지만,{}",
                    "{C:red}보너스가 증가하지 않음.{}",
                    "{C:inactive}(현재 위치: {C:red}#5#{})",
                    "{C:inactive}(현재 {C:gold}$#1#{}) {C:inactive}(현재 {C:chips}+#2#{} 칩)",
                    "{C:inactive}(현재 {C:mult}#3#{} 배수) {C:inactive}(현재 {X:mult,C:white}X#4#{} 배수)"},
                },
            },
            j_pmcmod_catherine = {
                name = '캐서린',
                text = {
                    "아무것도 하지 않음.",
                },
            },
            j_pmcmod_catherine_alt = {
                name = '___________',
                text = {
                    "아무것도 하지 않음.",
                },
            },
            j_pmcmod_everyCatherine = {
                name = '모든 캐서린',
                text = {
                    {"항상 {C:dark_edition}네거티브{}"},
                    {"매 접대 종료 시,",
                    "무작위 책장의 {C:dark_edition}네거티브{} 복사본을 생성함"},
                    {"그 후 {C:green}#1# / #2#{} 확률로 스스로 파괴됨.",
                    "이 확률은 성공적으로 발동할 때마다 1씩 증가함"}
                },
            },
            j_pmcmod_nelly = {
                name = '넬리',
                text = {
                    "매 접대 종료 후",
                    "{C:dark_edition}소멸성 네거티브 책장{}을 생성함",
                },
                unlock = {
                    '{C:attention}마왕 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_erlking = {
                name = '마왕',
                text = {
                    "{C:dark_edition}네거티브{} 책장 하나당 {X:mult,C:white}X1{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)",
                },
            },
            j_pmcmod_hindley = {
                name = '힌들리',
                text = {
                    {"{C:chips}+20{} 칩으로 시작"},
                    {"네거티브 책장 하나당",
                    "{C:chips}+20{} 칩 획득",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)"},
                },
                unlock = {
                    '{C:attention}넬리 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_linton = {
                name = '린튼',
                text = {
                    "판매 시 {C:dark_edition}네거티브 태그{} 획득",
                },
                unlock = {
                    '{C:attention}넬리 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_josephine = {
                name = '조세핀',
                text = {
                    {"{C:mult}+8{} 배수로 시작"},
                    {"네거티브 책장 하나당",
                    "{C:mult}+8{} 배수 획득",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)"},

                },
                unlock = {
                    '{C:attention}넬리 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_olga = {
                name = '어금니 보트 센터 올가',
                text = {
                    "카드를 버릴 때마다 이 책장에 {X:mult,C:white}X#2#{} 배수 부여,",
                    "최대 {X:mult,C:white}X3{} 배수",
                    "매 접대 종료 시 수치 초기화",
                    "{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)",
                },
                unlock = {
                    '{C:attention}올가 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_rain = {
                name = '어금니 보트 센터 레인',
                text = {
                    "카드를 버릴 때마다 이 책장에 {C:chips}+#2#{} 칩 부여,",
                    "최대 {C:chips}+60{} 칩",
                    "매 접대 종료 시 수치 초기화",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)",
                },
                unlock = {
                    '{C:attention}레인 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_mika = {
                name = '어금니 보트 센터 미카',
                text = {
                    "카드를 버릴 때마다 이 책장에 {C:mult}+#2#{} 배수 부여,",
                    "최대 {C:mult}+30{} 배수",
                    "매 접대 종료 시 수치 초기화",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                },  
                unlock = {
                    '{C:attention}미카 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_moses = {
                name = '모제스',
                text = {
                    "플레이한 {C:attention}7{} 카드마다 {X:mult,C:white}X#1#{} 배수",
                },
                unlock = {
                    '점수가 7로 나누어떨어지며',
                    '50000 칩 이상 득점 시 해금',
                },
            },
            j_pmcmod_ezra = {
                name = '에즈라',
                text = {
                    "{C:attention}7{} 카드 다시 한 번 발동",
                },
                unlock = {
                    '점수가 7로 나누어떨어지며',
                    '50000 칩 이상 득점 시 해금',
                },
            },
            j_pmcmod_santata = {
                name = '산타타',
                text = {
                    "E.G.O 기프트가 {C:attention}무료{}가 됨",
                },
                unlock = {
                    '매우 특별한 날에 해금됨',
                },
            },
            j_pmcmod_crayon = {
                name = '크레용',
                text = {
                    "매 전투 시작 시 {C:green}#1# / #2#{} 확률로",
                    "무작위 {C:attention}소모품{} 생성",
                    "{C:inactive}(슬롯에 여유 공간이 있어야 함)"
                }
            },
            j_pmcmod_domino = {
                name = '도미노',
                text = {
                    "매 접대 종료 시 {C:green}#2# / #3#{} 확률로",
                    "{C:attention}쿠폰 태그{} 생성"
                }
            },
            j_pmcmod_dadQuixote = {
                name = '돈키호테',
                text = {
                    "덱에 있는 모든 카드의 총 영구 배수에",
                    "기반하여 {C:red}배수{} 획득",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)"
                },
                unlock = {
                    '{C:attention}돈키호테 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_sancho = {
                name = '산초',
                text = {
                    "{C:green}#2# / #3#{} 확률로 {C:hearts}하트{} 카드를",
                    "다시 한 번 발동함.",
                    "카드에 {C:red}출혈{}이 있다면 항상 다시 발동함."
                },
                unlock = {
                    '{C:attention}돈키호테 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_dulcinea = {
                name = '돌시네아',
                text = {
                    "득점한 {C:hearts}하트{} 또는 {C:red}출혈{} 카드마다",
                    "{C:mult}+#2#{} 배수 획득.",
                    "다른 카드를 플레이하면, 같은 수치만큼 잃음.",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                },
                unlock = {
                    '{C:attention}산초 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_barber = {
                name = '이발사',
                text = {
                    "득점한 {C:hearts}하트{} 또는 {C:red}출혈{} 카드마다",
                    "{C:chips}+#2#{} 칩 획득.",
                    "다른 카드를 플레이하면, 같은 수치만큼 잃음.",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)",
                },
                unlock = {
                    '{C:attention}돌시네아 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_priest = {
                name = '신부',
                text = {
                    "패에 남은 {C:hearts}하트{} 또는 {C:red}출혈{} 카드가",
                    "{X:mult,C:white}X#1#{} 배수를 제공"
                },
                unlock = {
                    '{C:attention}이발사 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_bari = {
                name = '바리',
                text = {
                    "플레이한 {C:attention}강철{} 카드가",
                    "{X:mult,C:white}X#1#{} 배수 제공"
                },
                unlock = {
                    '{C:attention}관장 앤젤라 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_cesara = {
                name = '체사라',
                text = {
                    "이 카드가 {C:attention}첫 번째 위치{}에 있을 때",
                    "{C:attention}플러시{}를 플레이하면,",
                    "득점한 모든 카드의 {C:attention}랭크{} 증가"
                }
            },
            j_pmcmod_alessio = {
                name = '알레시오',
                text = {
                    "이 카드가 {C:attention}첫 번째 위치{}에 있을 때",
                    "{C:attention}플러시{}를 플레이하면,",
                    "득점한 모든 카드의 {C:attention}문양{} 변경"
                }
            },
            j_pmcmod_jiaXichun = {
                name = '가시춘',
                text = {
                    {"득점한 카드의 문양에 따라",
                    "{C:spades}지(스페이드){}, {C:clubs}용(클럽){} 또는 {C:hearts}인(하트){} 스택을 얻음."},
                    {"각 스택은 다음 보너스를 제공함:",
                    "지 1개 -> {C:chips}1{} 칩",
                    "용 5개 -> 막이 끝날 때 {C:gold}$1{}",
                    "인 1개 -> {C:mult}+1{} 배수"},
                    {"최대 50 스택까지 보유 가능. 다이아몬드 문양은 모든 스택을 1 감소시킴.",
                    "{C:inactive}(지: {C:chips}#1#{C:inactive}) {C:inactive}(용: {C:gold}#1#{C:inactive}) {C:inactive}(인: {C:mult}#1#{C:inactive})"},
                }
            },
            j_pmcmod_hugo = {
                name = '휴고',
                text = {
                    "판매한 {C:attention}책장{}마다",
                    "추가로 {C:gold}$#1#{} 획득"
                }
            },
            j_pmcmod_camille = {
                name = '카미유',
                text = {
                    "매 전투 시작 시, 현재 보유한 돈의",
                    "{C:attention}5%{}를 차감하고 그 수치를 {C:mult}배수{}에 추가함",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                },
                unlock = {
                    '한 게임에서 {C:gold}$600{} 이상 획득',
                },
            },
            j_pmcmod_paula = {
                name = '폴라',
                text = {
                    "전투의 점수 요구치 상승량을 감소시킴",
                }
            },
            j_pmcmod_romero = {
                name = '로메로',
                text = {
                    "{C:attention}일반 전투{} 또는 {C:attention}정예 전투{} 선택 시,",
                    "{C:green}보급{} 또는 {C:blue}고급{} 등급의 혈귀 책장이 존재하면,",
                    "이를 파괴하고 {C:mult}+#2#{} 배수 획득",
                    "(전투당 한 번만 발동)",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                }
            },
            j_pmcmod_hanul = {
                name = '한울',
                text = {
                    "{C:attention}#1#{}을(를) 플레이 시,",
                    "플레이한 카드들의 {C:attention}평균 랭크 가치{}에",
                    "비례하여 {C:gold}돈{}을 획득함."
                },
                unlock = {
                    '{C:attention}플러시{}를 한 번도 플레이하지 않고 게임 승리',
                }
            },
            j_pmcmod_caiman = {
                name = '카이만',
                text = {
                    "사용한 {C:planet}수감자{} 카드를",
                    "{C:green}#1# / #2#{} 확률로 되돌려받음"
                }
            },
            j_pmcmod_aengDu = {
                name = '앵두',
                text = {
                    "첫 번째나 마지막이 아닌 핸드에서",
                    "{X:red,C:white}X#1#{} 배수 획득"
                }
            },
            j_pmcmod_jun = {
                name = '쥰',
                text = {
                    "막의 {C:attention}첫 핸드{}에서",
                    "{X:red,C:white}X#1#{} 배수 획득",
                }
            },
            j_pmcmod_herbert = {
                name = '허버트',
                text = {
                    "상점에서 직접 아이템을 구매할 때",
                    "{C:red}(부스터 팩 제외){},",
                    "{C:green}#1# / #2#{} 확률로 소모한 돈을 돌려받음"
                },
                unlock = {
                    '한 게임에서 {C:gold}$200{} 이상 획득',
                },
            },
            j_pmcmod_mai = {
                name = '마이',
                text = {
                    "막 시작 시 무작위 책장을 비활성화시킴.",
                    "비활성화된 카드의 희귀도에 따라",
                    "{X:red,C:white}X2{}에서 {X:red,C:white}X3{} 배수 제공."

                },
                unlock = {
                    '한 게임에서 {C:gold}$200{} 이상 획득',
                },
            },
            j_pmcmod_bumble = {
                name = '범블',
                text = {
                    "이자 획득 상한이 {C:gold}$60{} 증가.",
                    "플레이한 카드마다 {C:gold}$1{} 잃음."
                },
                unlock = {
                    '한 게임에서 {C:gold}$200{} 이상 획득',
                },
            },
            j_pmcmod_timeRipper = {
                name = '시간살인마',
                text = {
                    {"책장을 판매할 때마다 스택 획득,",
                    "최대 3 스택",},
                    {"이 책장을 판매하면 스택 수량에 따라",
                    "막을 되돌림"}
                },
                unlock = {
                    '{C:attention}허버트 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_casetti = {
                name = '카세티',
                text = {
                    {"득점한 {C:hearts}하트{} 카드가 덱의 출혈 카드 하나당 {C:mult}+#1#{} 배수 제공",},
                    {"득점한 {C:hearts}하트{} 카드에 {C:green}#3# / #4#{} 확률로 출혈 부여",
                    "{C:inactive}(현재 {C:mult}+#2#{C:inactive} 배수)",}
                },
                unlock = {
                    '덱에 {C:red}출혈 카드{} 5장 이상 보유',
                },
            },
            j_pmcmod_sasha = {
                name = '사샤',
                text = {
                    "득점한 {C:red}출혈{} 카드에 {C:green}#1# / #2#{} 확률로",
                    "{C:dark_edition}충전{} 부여"
                },
                unlock = {
                    '덱에 {C:red}출혈 카드{} 3장 이상 보유',
                },
                
            },
            j_pmcmod_hohenheim = {
                name = '호엔하임',
                text = {
                    {"이 책장을 얻은 후 파괴된",
                    "모든 책장의 이름을 수집함",},
                    {"전투 종료 시, 무작위 책장을",
                    "소멸성 및 네거티브 상태로 부활시킴"}
                }
            },
            j_pmcmod_alyssa = {
                name = '알리사',
                text = {
                    "덱에 있는 {C:mult}배수{} 카드 하나당",
                    "{C:mult}+#1#{} 배수 획득",
                    "{C:inactive}(현재 {C:mult}+#2#{C:inactive} 배수)",
                }
            },
            j_pmcmod_marton = {
                name = '마튼',
                text = {
                    "덱에 있는 {C:chips}보너스{} 카드 하나당",
                    "{C:chips}+#1#{} 칩 획득",
                    "{C:inactive}(현재 {C:chips}+#2#{C:inactive} 칩)",
                }
            },
            j_pmcmod_johann = {
                name = '요한',
                text = {
                    "카드가 파괴될 상황에 처하면,",
                    "대신 스스로 희생함."
                }
            },
            j_pmcmod_qingTao = {
                name = '경도',
                text = {
                    {"막의 첫 번째 핸드가 {C:attention}#1#{}이고",
                    "카드가 3장뿐이라면, 득점한 카드를",
                    "{C:green}#2# / #3#{} 확률로 {C:red}파괴함{}."},
                    {"파괴된 카드가 없다면 {C:red}스스로 파괴됨{}."}
                }
            },
            j_pmcmod_shanSan = {
                name = '삼삼',
                text = {
                    {"플레이한 핸드가 {C:attention}#1#{}일 경우,",
                    "{}#3# / #4#{} 확률로 {C:gold}$#2#{} 획득."},
                    {"돈을 얻지 못했다면 {C:red}스스로 파괴됨{}."}
                }
            },
            j_pmcmod_jumsoon = {
                name = '점순이',
                text = {
                    "막의 첫 번째 핸드가 {C:attention}#1#{}일 경우,",
                    "모든 책장을 같은 희귀도의 다른 책장으로 변경함."
                },
                unlock = {
                    '{C:attention}가넷 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_garnet = {
                name = '가넷',
                text = {
                    "해금된 무작위 책장 하나를 복사함.",
                    "복사할 책장은 매 막마다 변경됨.",
                    "{C:inactive}(현재 복사 중: {C:red}#1#)",
                },
                unlock = {
                    '{C:attention}플러시 하우스{}를 버리면 해금',
                },
            },
            j_pmcmod_catt = {
                name = '캣',
                text = {
                    {"{C:attention}일반 전투{} 또는 {C:attention}정예 전투{}에서,",
                    "패배할 위기에 처하면 무작위 {C:attention}#1# 책장{}을 파괴하고 승리함."},
                    {"발동할 때마다 요구되는 희귀도가 올라감.",
                    "막마다 한 번만 발동할 수 있음."}
                },
                unlock = {
                    '{C:attention}발레리 책장{}으로 승리 시 해금',
                },
            },
            j_pmcmod_jiaMu = {
                name = '가모',
                text = {
                    {"무작위 개수의 책장을 {C:red}비활성화함{}"},
                    {"{C:attention}다른 모든 책장{}을 0~2번 다시 발동시킴,",
                    "재발동할 때마다 {C:gold}$#3#{} 비용 소모"}
                },
                unlock = {
                    '{C:attention}홍루 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_jiaQiu = {
                name = '가치우',
                text = {
                    {"{X:mult,C:white}X#1#{} 배수"},
                    {"{C:green}#3# / #4#{} 확률로 대신",
                    "{X:mult,C:white}X#2#{} 배수를 제공함.",
                    "{C:inactive}이 책장은 숨겨진 상호작용이 있음."}
                },
                unlock = {
                    '한 번의 핸드로',
                    '{C:chips}800000{} 칩 이상 득점 시 해금',
                },
            },
            j_pmcmod_linDaiyu = {
                name = '임대옥',
                text = {
                    "플레이한 첫 핸드가 {C:attention}5로 시작하면{}, 득점한",
                    "카드의 모든 파열 스택을 소모하여,",
                    "소모한 스택 5개당 {X:mult,C:white}X0.1{} 배수를 획득함.",
                    "{C:inactive}(현재 파열 스택 {C:green}#1#{C:inactive})"
                },
                unlock = {
                    '덱에 {C:green}파열{} 카드를 5장 이상 보유 시 해금'
                },
            },
            j_pmcmod_xueBaochai = {
                name = '설보차',
                text = {
                    "전투 점수 요구치를 {C:attention}10%{} 감소시킴.",
                }
            },
            j_pmcmod_xianrenA = {
                name = '피칠갑의 어르신',
                text = {
                    "막이 끝날 때 {C:gold}$#1#{}을(를) 획득함.",
                    "{C:inactive}접대가 끝난 후 다른 어르신으로 교체됨"
                },
                unlock = {
                    '{C:attention}가모 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_xianrenB = {
                name = '환자 어르신',
                text = {
                    "득점한 핸드가 3장을 초과할 경우,",
                    "{C:mult}+#1#{} 배수 및 {C:chips}+#2#{} 칩 제공",
                    "{C:inactive}접대가 끝난 후 다른 어르신으로 교체됨"
                },
                unlock = {
                    '{C:attention}가모 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_xianrenC = {
                name = '기계 안의 어르신',
                text = {
                    "득점한 카드당 {X:mult, C:white}X#1#{} 배수 제공.",
                    "{C:inactive}접대가 끝난 후 다른 어르신으로 교체됨"
                },
                unlock = {
                    '{C:attention}가모 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_xianrenD = {
                name = '승복을 입은 어르신',
                text = {
                    "첫 번째 책장을 {C:attention}재발동{}함.",
                    "{C:inactive}접대가 끝난 후 다른 어르신으로 교체됨"
                },
                unlock = {
                    '{C:attention}가모 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_xianrenE = {
                name = '병 속의 어르신',
                text = {
                    "첫 번째로 플레이한 핸드의 {C:attention}레벨을 올림{}.",
                    "{C:inactive}접대가 끝난 후 다른 어르신으로 교체됨"
                },
                unlock = {
                    '{C:attention}가모 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_xianrenF = {
                name = '애벌레 어르신',
                text = {
                    "막이 끝날 때, 다른 책장들의",
                    "판매 가치를 {C:gold}$#1#{}만큼 증가시킴.",
                    "{C:inactive}접대가 끝난 후 다른 어르신으로 교체됨"
                },
                unlock = {
                    '{C:attention}가모 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_ladyWang = {
                name = '왕 부인',
                text = {
                    "득점한 {C:attention}6{}마다 {C:mult}+#1#{} 배수 제공",
                    "배수은 매 무대마다 {C:mult}3{}씩 증가함",
                }
            },
            j_pmcmod_jiaZheng = {
                name = '가정',
                text = {
                    "득점한 {C:attention}6{}마다 {C:chips}+#1#{} 칩 제공",
                    "칩은 매 무대마다 {C:chips}+5{}씩 증가함",
                }
            },
            j_pmcmod_jiaYuanchun = {
                name = '가원춘',
                text = {
                    "접대가 끝날 때, 첫 번째 태그 이후",
                    "대기 중인 태그 하나당 {C:gold}$#1#{} 획득.",
                }
            },
            j_pmcmod_jiaHuanChild = {
                name = '어린 가환',
                text = {
                    "판매 시 {C:blue}고급{} 책장 획득"
                }
            },
            j_pmcmod_xuePan = {
                name = '설반',
                text = {
                    "전투 시작 시,",
                    "책장을 {C:red}파괴{}하거나",
                    "무작위 {C:dark_edition}에디션{}을 부여함.",
                    "{C:dark_edition}에디션{}이 있는 책장은 파괴되지 않음."
                }
            },
            j_pmcmod_wangZhao = {
                name = '왕자오',
                text = {
                    "접대를 클리어할 때마다 판매 가치 {C:gold}$1{} 증가,",
                    "핸드 1번으로 전투를 클리어하면 판매 가치 {C:gold}$1{} 추가 증가.",
                    "접대가 아닌 전투 시작 시, 인접한 책장들의",
                    "판매 가치를 {C:gold}$4{}만큼 증가시킴.",
                    "영향을 받은 책장 하나당 판매 가치 {C:red}$2{}감소.",
                    "{C:red}자신의 판매 가치가 $0 미만이 되면 파괴됨."
                }
            },
            j_pmcmod_wangDawei = {
                name = '왕대위',
                text = {
                    "{C:attention}8장{} 득점 할 때마다",
                    "{C:mult}+#2#{} 영구 배수 및 {C:chips}+#3#{} 영구 칩 획득.",
                    "{C:inactive}(다음 발동까지 남은 득점 카드: {C:attention}#1#{C:inactive})"
                }
            },
            j_pmcmod_wangQingshan = {
                name = '왕청산',
                text = {
                    "{C:attention}8장{} 득점 할 때마다",
                    "{C:mult}+#2#{} 영구 $ 획득.",
                    "{C:inactive}(다음 발동까지 남은 득점 카드: {C:attention}#1#{C:inactive})"
                }
            },
            j_pmcmod_wangRen = {
                name = '왕인',
                text = {
                    {"막이 끝날 때 {C:gold}$#1#{} 획득."},
                    {"현재 소지금이 {C:gold}$100{} 미만이 되면,",
                    "다음 막이 시작될 때 스스로 파괴됨."}
                }
            },
            j_pmcmod_shiYihua = {
                name = '사이화',
                text = {
                    "덱에 있는 {C:diamonds}다이아몬드{} 카드",
                    "1장당 {C:chips}+#1#{} 칩 획득.",
                    "{C:inactive}(현재 {C:chips}+#2#{C:inactive} 칩)"
                }
            },
            j_pmcmod_shiHuazhen = {
                name = '사화정',
                text = {
                    "왼쪽에 있는 책장 이름의 글자 수",
                    "1자당 {C:mult}+#1#{} 배수 제공."
                }
            },
            j_pmcmod_shiSijing = {
                name = '사사정',
                text = {
                    "책장이 파괴될 때마다 {C:chips}+#1#{} 칩 획득",
                    "{C:inactive}(현재 {C:chips}+#2#{C:inactive} 칩)"
                }
            },
            j_pmcmod_kongSihui = {
                name = '공사혜',
                text = {
                    {"플레이한 카드가 {C:green}1 / 5{} 확률로 {C:gold}$5{} 획득."},
                    {"{C:green}1 / 20{} 확률로 {C:red}스스로 파괴됨{}."}
                }
            },
            j_pmcmod_kongYoujin = {
                name = '공우진',
                text = {
                    {"플레이한 카드가 {C:green}1 / 5{} 확률로 {C:attention}재발동{}함."},
                    {"{C:green}1 / 20{} 확률로 {C:red}스스로 파괴됨{}."}
                }
            },
            j_pmcmod_xiren = {
                name = '습인',
                text = {
                    "가장 많이 플레이한 족보와 현재 족보의",
                    "플레이 횟수 차이의 {C:attention}3배{}만큼 {C:mult}+배수{} 추가."
                }
            },
            j_pmcmod_wei = {
                name = '웨이',
                text = {
                    "{C:red}가장 많이 플레이한 핸드가 하이 카드가 아니라면{},",
                    "막이 끝날 때 패에 남은 카드",
                    "1장당 {C:gold}$#1#{} 획득."
                }
            },
            j_pmcmod_zigong = {
                name = '자공',
                text = {
                    {"막 시작 시, 오른쪽에 있는 책장의",
                    "{C:gold}판매 가치{}를 모두 흡수하여",
                    "자신의 판매 가치에 더함."},
                    {"흡수한 수치의 {C:attention}3배{}만큼 {C:chips}칩{} 획득.",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)"},
                }
            },
            j_pmcmod_zilu = {
                name = '자로',
                text = {
                    "{C:green}파열{} 스택이 2배로 쌓임",
                }
            },
            j_pmcmod_nightDrifter = {
                name = '취수야객',
                text = {
                    {"{X:mult,C:white}X#1#{} 또는 {X:mult,C:white}X#2#{} 배수 제공."},
                    {"소모품을 사용할 때마다 최소치가 {X:mult,C:white}X#4#{} 감소하고,",
                    "최대치가 {X:mult,C:white}X#5#{} 증가함.",
                    "(최대 4번까지 중첩 가능)"},
                    {"접대가 끝나면 모든 중첩을 잃음.",
                    "{C:inactive}(현재 사용한 소모품 수: {C:attention}#3#{C:inactive})"},
                }
            },
            j_pmcmod_leiHeng = {
                name = '뇌횡',
                text = {
                    {"0에서 4 사이의 무작위 값을 굴림."},
                    {"0이 나오면, {C:red}왼쪽에 있는 책장을 파괴함{}."},
                    {"다른 숫자가 나오면, 왼쪽에 있는 책장을",
                    "그 {C:attention}숫자만큼 재발동{}함."}
                },
                unlock = {
                    '{C:attention}료슈 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_valencina = {
                name = '발렌치나',
                text = {
                    {"핸드를 플레이할 때, 득점한 카드가 2장보다 많다면,",
                    "마지막 카드를 {C:gold}진동{} 카드로 변경함."},
                    {"{C:attention}추가 효과: {}오른쪽에 루치오가 있다면, 첫 번째",
                    "카드도 {C:gold}진동{} 카드로 변경함.",
                    "이 효과가 5번 발동하면 루치오는 사망함.",
                    "{C:inactive}(총 발동 횟수: {C:red}#1#{C:inactive})"},
                },
                unlock = {
                    '{C:attention}료슈 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_rien = {
                name = '뤼엔',
                text = {
                    {"무대 시작 시 무작위 지령을 하나 생성함."},
                    {"지령 수행에 성공 할 때마다 {C:mult}+#1#{} 배수 획득.",
                    "지령 수행에 실패하면 스스로 파괴됨."},
                    {"{C:attention}추가 효과: {}오른쪽에 소라가 있다면, 이 수치를 2배로 얻음.",
                    "이 효과가 3번 발동하면 소라는 사망함."},
                },
                unlock = {
                    '{C:attention}료슈 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_matthias = {
                name = '마티아스',
                text = {
                    {"핸드 {C:blue}-#1#{}"},
                    {"첫 번째로 득점한 핸드가 4장 미만이라면,",
                    "모든 득점한 카드를 {C:red}화상{} 카드로 변경함."},
                    {"변경되는 카드 1장당 {C:gold}$#2#{} 소모. 덱에 있는 화상",
                    "카드 1장당 비용이 {C:gold}$#3#{}씩 증가함."},
                    {"{C:attention}추가 효과: {}오른쪽에 키라가 있다면 비용이 $0으로 감소함.",
                    "비용 없이 화상 카드를 5장 생성하면 키라는 사망함.",
                    "{C:inactive}(총 발동 횟수: {C:red}#4#{C:inactive})"},
                },
                unlock = {
                    '{C:attention}료슈 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_callisto = {
                name = '칼리스토',
                text = {
                    {"카드에서 배수과 보너스 강화를 흡수하여,",
                    "해당 수치의 80%를 획득함."},
                    {"{C:attention}추가 효과: {}알비나가 있다면 이 수치를 2배로 얻음.",
                    "카드 5장을 흡수하면 알비나는 사망함."}
                },
                unlock = {
                    '{C:attention}료슈 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_shiomiYoru = {
                name = '시오미 요루',
                text = {
                    {"호흡 카드에 {C:green}1 / 2{} 확률로 스택이 2배로 쌓임."},
                    {"{C:attention}추가 효과: {} 오른쪽에 렌이 있다면,",
                    "확률이 100%로 고정됨.",
                    "이 효과가 5번 발동하면 렌은 사망함.",
                    "{C:inactive}(총 발동 횟수: {C:red}#1#{C:inactive})"},
                },
                unlock = {
                    '{C:attention}료슈 책장{}으로 최소',
                    '{C:attention}도시 판돈{} 이상에서 승리 시 해금',
                },
            },
            j_pmcmod_lucio = {
                name = '루치오',
                text = {
                    {"득점한 진동 카드가 {C:gold}$#2#{} 제공"},
                    {"{C:attention}추가 효과: {}오른쪽에 발렌치나가 있다면,",
                    "진동 카드가 {C:gold}$#3#{} 제공. 진동 카드 3번 발동 시 사망.",
                    "{C:inactive}(총 발동 횟수: {C:red}#1#{C:inactive})"},
                },
                unlock = {
                    '{C:attention}발렌치나 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_sora = {
                name = '소라',
                text = {
                    {"막 시작 시, 무작위 책장에서 {C:dark_edition}에디션{}을 훔치고",
                    "그 과정에서 {C:chips}+#2#{} 칩을 획득함.",
                    "동일한 에디션을 연속으로 훔칠 수는 없음."},
                    {"에디션을 훔치지 못한 채 3막이 지나면,",
                    "소라가 모습을 드러내고 현재 칩 수치를 2배로 만듦."},
                    {"{C:attention}추가 효과: {}오른쪽에 뤼엔이 있다면 획득하는 칩이 2배가 됨.",
                    "이 효과가 4번 발동하면 소라는 사망함.",
                    "{C:inactive}(총 발동 횟수: {C:red}#3#{C:inactive})",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)"},
                },
                unlock = {
                    '{C:attention}뤼엔 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_kira = {
                name = '키라',
                text = {
                    {"화상 카드가 {C:gold}$#2#{} 제공"},
                    {"{C:attention}추가 효과: {}오른쪽에 마티아스가 있다면,",
                    "이제 화상 카드가 {C:gold}$#3#{} 제공.",
                    "화상 카드 효과가 5번 발동하면 키라는 사망함.",
                    "{C:inactive}(총 발동 횟수: {C:red}#1#{C:inactive})"},
                },
                unlock = {
                    '{C:attention}마티아스 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_albina = {
                name = '알비나',
                text = {
                    {"플레이한 핸드가 {C:attention}#2#{}이고 2장뿐이라면,",
                    "첫 번째 카드를 {C:blue}인내{} 카드로,",
                    "두 번째 카드를 {C:red}힘{} 카드로",
                    "{C:green}#3# / #4#{} 확률로 변경함."},
                    {"{C:attention}추가 효과: {}오른쪽에 칼리스토가 있다면,",
                    "확률이 100%로 고정됨.",
                    "이 효과가 5번 발동하면 알비나는 사망함.",
                    "{C:inactive}(총 발동 횟수: {C:red}#1#{C:inactive})"},
                },
                unlock = {
                    '{C:attention}칼리스토 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_ren = {
                name = '렌',
                text = {
                    {"득점한 카드에 {C:green}#2# / #3#{} 확률로 호흡을 부여함."},
                    {"{C:attention}추가 효과: {}오른쪽에 시오미 요루가 있다면,",
                    "확률이 100%로 고정됨.",
                    "이 효과가 5번 발동하면 렌은 사망함.",
                    "{C:inactive}(총 발동 횟수: {C:red}#1#{C:inactive})"},
                },
                unlock = {
                    '{C:attention}시오미 요루 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_ravi = {
                name = '라비',
                text = {
                    "이 카드가 파괴될 위기에 처하면, 죽은 척하며",
                    "대신 자신에게 디버프를 걺. 이때 {C:chips}+#2#{} 칩 획득.",
                    "{C:green}#3# / #4#{} 확률로 죽은 척하기에 실패함.",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)",
                }
            },
            j_pmcmod_werner = {
                name = '베르너',
                text = {
                    "리카르도가 파괴될 때마다 {C:chips}+#2#{} 칩 획득.",
                    "{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)",
                }
            },
            j_pmcmod_jamila = {
                name = '자밀라',
                text = {
                    "{C:attention}에고 기프트{}를 획득할 때마다 {C:mult}+#1#{} 배수 획득.",
                    "{C:inactive}(현재 {C:mult}+#2#{C:inactive} 배수)",
                },
                unlock = {
                    '한 게임에서{C:attention}에고 기프트{} 5개 이상 획득',
                },
            },
            j_pmcmod_aCertainSinclair = {
                name = '어느 싱클레어',
                text = {
                    "{C:attention}왼쪽에 있는 책장{}의 발동 횟수를 셈.",
                    "그 횟수만큼 {C:attention}오른쪽에 있는 책장{}을 재발동함."
                },
                unlock = {
                    '{C:attention}칼리스토{} 및 {C:attention}알비나 책장{}으로',
                    '승리 시 해금 (같은 게임일 필요 없음)'
                },
            },
            j_pmcmod_arayaKid = {
                name = '아라야 (어린이)',
                text = {
                    {"{C:chips}+#1#{} 칩 제공."},
                    {"지난 무대에서 가장 많이 한 행동에 따라",
                    "다른 버전으로 모습이 변경됨:",
                    "카드 득점, 카드 버리기, 또는 돈 사용"},
                    {"{C:inactive}카드 득점: {C:chips}#2#{}",
                    "{C:inactive}카드 버림: {C:mult}#3#{}",
                    "{C:inactive}돈 사용: {C:gold}#4#{}"}
                },
                unlock = {
                    '{C:attention}4번 수감자 료슈 책장{}으로 승리 시 해금'
                },
            },
            j_pmcmod_arayaTeen = {
                name = '아라야 (청소년)',
                text = {
                    {"득점한 카드가 영구 칩을 6 획득"},
                    {"지난 무대에서 가장 많이 한 행동(카드 득점,",
                    "카드 버리기, 돈 사용)에 따라 다른 버전으로 변경.",
                    "만약 가장 많이 한 행동이 카드 득점이라면,",
                    "대신 어린이 버전으로 되돌아감."},
                    {"{C:inactive}카드 득점: {C:chips}#2#{}",
                    "{C:inactive}카드 버림: {C:mult}#3#{}",
                    "{C:inactive}돈 사용: {C:gold}#4#{}"}
                }
            },
            j_pmcmod_arayaYA = {
                name = '아라야 (청년)',
                text = {
                    {"득점한 카드가 영구 배수 +3 획득."},
                    {"지난 무대에서 가장 많이 한 행동(카드 득점,",
                    "카드 버리기, 돈 사용)에 따라 다른 버전으로 변경.",
                    "만약 가장 많이 한 행동이 카드 버리기라면,",
                    "대신 어린이 버전으로 되돌아감."},
                    {"{C:inactive}카드 득점: {C:chips}#2#{}",
                    "{C:inactive}카드 버림: {C:mult}#3#{}",
                    "{C:inactive}돈 사용: {C:gold}#4#{}"}
                }
            },
            j_pmcmod_arayaAdult = {
                name = '아라야 (성인)',
                text = {
                    {"득점한 카드가 영구 달러 $1 획득"},
                    {"지난 무대에서 가장 많이 한 행동(카드 득점,",
                    "카드 버리기, 돈 사용)에 따라 다른 버전으로 변경.",
                    "만약 가장 많이 한 행동이 돈 사용이라면,",
                    "대신 어린이 버전으로 되돌아감."},
                    {"{C:inactive}카드 득점: {C:chips}#2#{}",
                    "{C:inactive}카드 버림: {C:mult}#3#{}",
                    "{C:inactive}돈 사용: {C:gold}#4#{}"}
                }
            },            
            j_pmcmod_vermillionCross = {
                name = '주홍십자',
                text = {
                    "전투 점수 요구치를 절반으로 줄임",
                }
            },
            j_pmcmod_yellowHarpoon = {
                name = '노란작살',
                text = {
                    "각 책장마다 희귀도에 따라 {X:mult,C:white}X#1#{}에서",
                    "{X:mult,C:white}X#2#{} 사이의 배수를 제공함."
                }
            },            
            j_pmcmod_sephirahHod = {
                name = '세피라 호드',
                text = {
                    {"{C:attention}접대{} 중 다른 {C:attention}책장{}을 판매하면",
                    "해당 접대가 무효화됨."},
                    {"이 방식으로 무효화된 접대마다",
                    "{X:mult,C:white} X#1#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white}X#2# {C:inactive}배수)"},
                },
            },
            j_pmcmod_sephirahMalkuth = {
                name = '세피라 말쿠트',
                text = {
                    "{C:attention}족보 레벨이 1을 초과할 때마다{}",
                    "각각 {C:mult}+3{} 배수 획득",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                },
            },
            j_pmcmod_sephirahNetzach = {
                name = '세피라 네짜흐',
                text = {
                    "해당 막에서 사용한 {C:attention}소모품{}마다",
                    "매 막 종료 시 {C:mult}+3 배수{}와 {C:chips}+5 칩{} 획득.",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)",
                    "{C:inactive}(현재 {C:chips}+#2#{C:inactive} 칩)",
                    "{C:inactive}(현재 사용된 소모품: {C:chips}#3#{C:inactive})",
                },
            },
            j_pmcmod_sephirahYesod = {
                name = '세피라 예소드',
                text = {
                    {"득점한 {C:hearts}하트{} 및 {C:diamonds}다이아몬드{} 카드마다 {C:mult}+1{} 배수 획득"},
                    {"득점한 {C:spades}스페이드{} 또는 {C:clubs}클로버{} 카드마다 {C:chips}+3{} 칩 획득"},
                    {"{C:inactive}(현재 {C:mult}+#5#{C:inactive} 배수)",
                    "{C:inactive}(현재 {C:chips}+#6#{C:inactive} 칩)"},
                },
            },
            j_pmcmod_sephirahChesed = {
                name = '세피라 헤세드',
                text = {
                    {"{X:mult,C:white}X2{} 배수로 시작"},
                    {"카드가 득점할 때마다 {C:green}#3# / #4#{} 확률로",
                    "배수가 {X:mult,C:white}X#2#{} 증가함.",
                    "{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_sephirahGebura = {
                name = '세피라 게부라',
                text = {
                    {"이번 막에서 플레이한 모든",
                    "{C:blue}핸드{}당 {C:mult}+15{} 배수 획득"},
                    {"접대에서 승리할 때마다",
                    "이 수치가 {C:mult}+5{} 증가.",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_sephirahHokma = {
                name = '세피라 호크마',
                text = {
                    "사용한 {C:attention}고유 타로 또는 유령{} 카드 하나당",
                    "{X:mult,C:white}X#2#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)",
                },
            },
            j_pmcmod_sephirahBinah = {
                name = '세피라 비나',
                text = {
                    {"이 책장을 얻은 후 첫 번째로 플레이한",
                    "족보와 결속됨"},
                    {"결속된 족보가 막의 첫 번째 핸드라면,",
                    "{C:red}득점한 모든 카드를 파괴함{}."},
                    {"파괴된 카드 하나당 {X:mult,C:white}X#2#{} 배수 획득",
                    "{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)",
                    "{C:inactive}(현재 결속된 핸드: {C:attention}X#3#{C:inactive}"},
                },
            },
            j_pmcmod_sephirahTiphereth = {
                name = '세피라 티페리트',
                text = {
                    {"에이스 카드가 {C:mult}+#1#{} 배수 제공"},
                    {"{C:attention}접대에서 승리할 때마다{},",
                    "에이스 배수가 {C:mult}+#2#{} 증가함."},
                },
            },
            j_pmcmod_robotHod = {
                name = '호드 (기계)',
                text = {
                    {"{X:mult,C:white}X#1#{} 배수"},
                    {"매 전투 시",
                    "무작위 책장을 비활성화시킴"}
                },
            },
            j_pmcmod_robotMalkuth = {
                name = '말쿠트 (기계)',
                text = {
                    {"족보 레벨이 1을 초과할 때마다 1 배수 획득"},
                    {"{C:green}#2# / #3#{} 확률로 플레이한 족보의 레벨을 감소시킴",
                    "{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_robotNetzach = {
                name = '네짜흐 (기계)',
                text = {
                    {"매 막 종료 시",
                    "{C:mult}+3 배수{}와 {C:chips}+5 칩{} 획득."},
                    {"{C:red}매 전투 종료 후{}",
                    "{C:red}상점 가격이 5% 상승함{}"},
                    {"{C:inactive}(현재 {C:mult}+#2#{C:inactive} 배수)",
                    "{C:inactive}(현재 {C:chips}+#3#{C:inactive} 칩)",
                    "{C:inactive}(현재 상점 가격 상승: {C:chips}#5#{C:inactive} %)"},
                },
            },
            j_pmcmod_robotYesod = {
                name = '예소드 (기계)',
                text = {
                    {"플레이한 {C:hearts}하트{} 및 {C:diamonds}다이아몬드{} 카드 3장마다 {C:mult}+1{} 배수 획득,",
                    "플레이한 {C:spades}스페이드{} 또는 {C:clubs}클로버{} 카드마다 {C:chips}+1{} 칩 획득"},
                    {"핸드를 플레이할 때마다 {C:green}#7# / #8#{} 확률로",
                    "무작위 책장에 소멸성 부여"},
                    {"{C:inactive}(현재 {C:mult}+#5#{C:inactive} 배수)",
                    "{C:inactive}(현재 {C:chips}+#6#{C:inactive} 칩)"},
                },
            },
            j_pmcmod_robotChesed = {
                name = '헤세드 (기계)',
                text = {
                    {"{X:mult,C:white}X#4#{} 배수로 시작"},
                    {"카드가 득점할 때마다 {C:green}#1# / #2#{} 확률로",
                    "배수가 0.1 증가함."},
                    {"플레이한 카드에서 강화 효과를 제거함"},
                    {"{C:inactive}(현재 {X:mult,C:white}X#3#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_robotGebura = {
                name = '게부라 (기계)',
                text = {
                    {"이번 막에서 플레이한 모든 핸드당 {C:mult}+10{} 배수 획득.",
                    "또한 핸드를 플레이할 때마다 {C:gold}해당 가치의 절반을 돈으로 잃음{}"},
                    {"{C:inactive}(현재 {C:mult}+#1#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_robotHokma = {
                name = '호크마 (기계)',
                text = {
                    {"사용한 고유 유령 카드 하나당 {X:mult,C:white}X#2#{} 배수 획득."},
                    {"사용한 고유 타로 카드 하나당 {X:mult,C:white}X#3#{} 배수 잃음."},
                    {"{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_robotBinah = {
                name = '비나 (기계)',
                text = {
                    {"덱의 기본 시작 크기보다 카드가 적을 경우,",
                    "부족한 카드 한 장당 {X:mult,C:white}X#2#{} 배수 획득"},
                    {"매 전투 시작 시 무작위 카드를 추가함"},
                    {"{C:inactive}(현재 {X:mult,C:white}X#1#{C:inactive} 배수)"},
                },
            },
            j_pmcmod_robotTiph = {
                name = '티페리트 A (기계)',
                text = {
                    {"에이스 카드가 {C:mult}+#2#{} 배수 및 {C:chips}+#4# 칩{} 제공"},
                    {"전투 시작 시 {C:attention}에녹{}이 존재하지 않으면 소환함."},
                    {"{C:attention}에녹{}이 파괴될 때마다 에이스 배수가 {C:mult}+#3#{} 증가함"},
                },
            },
            j_pmcmod_robotEnoch = {
                name = '티페리트 B (기계)',
                text = {
                    {"플레이한 카드당 {C:chips}+#2#{} 칩 획득"},
                    {"이 수치가 {C:chips}+100{}에 도달하면 이 카드를 파괴함"},
                    {"{C:inactive}(현재 {C:chips}+#1#{C:inactive} 칩)"},
                },
            },
            j_pmcmod_silence = {
                name = '침묵의 대가',
                text = {
                    {"현재 전투를 {C:mult}30초{} 내로 클리어하지 못하면",
                    "게임 오버"},
                },
            },
            j_pmcmod_shylook = {
                name = "오늘의 표정",
                text = {
                    {"주기적으로 표정이 변함."},
                    {"핸드를 플레이할 때의 표정에 따라",
                    "{X:mult,C:white}X0{}에서 {X:mult,C:white}X2{} 배수 제공"},
                },
            },
            j_pmcmod_queenOfHatred = {
                name = "증오의 여왕",
                text = {
                    {"플레이하고 버린 모든 카드를 셈"},
                    {"두 수치의 차이에 따라 효과를 얻음:",
                    "< 4: 모든 책장을 {C:attention}다시 한 번 발동{}",
                    "< 7: {C:chips}+100{} 칩 획득 (막마다 증가함)",
                    "> 10: {X:mult,C:white}X0.5{} 배수",
                    "> 14: {C:attention}변신함{}. 매 막마다 무작위 책장 비활성화"},
                    {"변신이 발생하면 다음 3번의 전투 동안",
                    "이 상태를 유지한 후, 수치를 9로 초기화함"},
                    {"{C:inactive}(버린 횟수:{C:attention} #1# {C:inactive})",
                    "{C:inactive}(플레이한 횟수:{C:attention} #2# {C:inactive})",
                    "{C:inactive}(현재 차이:{C:attention} #8# {C:inactive})",
                    "{C:inactive}(변신 중인 막:{C:attention} #7# {C:inactive})"},
                },
            },
            j_pmcmod_laetitia = {
                name = "선물이야~",
                text = {
                    "{C:green}#2# / #3#{} 확률로 덱의",
                    "카드에 {C:attention}선물{}을 부여함.",
                },
            },
            j_pmcmod_childrenOfTheGalaxy = {
                name = "조약돌",
                text = {
                    "{C:green}#1# / #2#{} 확률로 덱의",
                    "카드에 {C:attention}조약돌{}을 부여함.",
                },
            },
            j_pmcmod_censored = {
                name = "{X:black,C:mult}[검열삭제]",
                text = {
                    "책장의 스프라이트, 이름,",
                    "설명을 검열함.",
                },
            },
            j_pmcmod_chickenA = {
                name = "봉이 (일반)",
                text = {
                    {"겉은 바삭하고 속은 촉촉하게."},
                    {"{C:attention}3 막{}을 완료하면 전투 종료 시",
                    "스스로 파괴됨"},
                    {"{C:inactive}(현재 완료한 막:{C:attention} #1# {C:inactive})"},
                },
            },
            j_pmcmod_chickenB = {
                name = "봉이 (간장)",
                text = {
                    {"향긋한 향신료로 버무려짐."},
                    {"{C:blue}5 핸드{}를 플레이하면 전투 종료 시",
                    "스스로 파괴됨"},
                    {"{C:inactive}(현재 플레이한 핸드:{C:blue} #1# {C:inactive})"},
                },
            },
            j_pmcmod_chickenC = {
                name = "봉이 (양념)",
                text = {
                    {"달콤한 붉은 토마토 (?) 양념으로 버무려짐."},
                    {"카드를 {C:red}20장 버리면{} 전투 종료 시",
                    "스스로 파괴됨"},
                    {"{C:inactive}(현재 버린 카드:{C:mult} #1# {C:inactive})"},
                },
            },
            j_pmcmod_chickenD = {
                name = "봉이 (주방장)",
                text = {
                    {"닭이 볶음밥을 볶아준다는 거야, 뭐야?"},
                    {"{C:gold}부스터 팩을 3개 열면{} 전투 종료 시",
                    "스스로 파괴됨"},
                    {"{C:inactive}(현재 연 팩 개수:{C:gold} #1# {C:inactive})"},
                },
            },
            j_pmcmod_dummyRicardo = {
                name = '더미 리카르도',
                text = {
                    "리카르도 사망 횟수: {C:red}#1#",
                    "스폰 가능: {C:red}#2#",
                },
            },
            j_pmcmod_puppetA = {
                name = "인형",
                text = {
                    "기기기기기기기기기긱기기기기기기",
                    "기기기기긱{C:red}+#1#{}배수기기기긱",
                    "{C:inactive}(카운터: {C:attention}#2#{C:inactive})"
                },
            },
            j_pmcmod_puppetB = {
                name = "날랜 인형",
                text = {
                    "기기기기기기기기기긱기기기기긱기기",
                    "기기기기기{C:red}+#1#{}배수기기기긱",
                    "{C:inactive}(카운터: {C:attention}#2#{C:inactive})"
                    
                },
            },
            j_pmcmod_puppetC = {
                name = "육중한 인형",
                text = {
                    "기기기기기기기기기긱기기기기긱기기",
                    "기기기기기{C:red}+#1#{}배수기기기긱",
                    "{C:inactive}(카운터: {C:attention}#2#{C:inactive})"
                },
            },
            j_pmcmod_puppetAngelica = {
                name = "익숙한 인형",
                text = {
                    "기기기기기기기기기긱기기기기긱기기",
                    "기기기기기기기기기기기기기기기...",
                    "기기기기기{C:red}+#1#{}배수기기기긱",
                },
            },
            j_pmcmod_voiceOfTheCity = {
                name = '도시의 의지',
                text = {
                    {"첫 막 이후,",
                    "다음 상점에서 지령을 생성함"},
                    {"지령을 완수하면 $15를 얻음",
                    "지령 완수에 실패하면 돈이 $0가 됨"}
                },
            },
            j_pmcmod_prescript1 = {
                name = '지령',
                text = {
                    {"단일 핸드에서 5장의 그림 카드를 {C:red}버리기{}"},
                    {"지령 완수: {c:green}#1#{}"}
                },
            },
            j_pmcmod_prescript2 = {
                name = '지령',
                text = {
                    {"{C:red}#2#{} 책장을 판매하기"},
                    {"지령 완수: {c:green}#1#{}"}
                },
            },
            j_pmcmod_prescript3 = {
                name = '지령',
                text = {
                    {"{C:attention}#2#{} 카드를 플레이하지 않기"},
                    {"지령 실패: {c:red}#3#{}"}
                },
            },
            j_pmcmod_prescript4 = {
                name = '지령',
                text = {
                    {"{C:attention}게임 속도{}를 1로 설정하여 1막 완료하기"},
                    {"지령 완수: {c:green}#1#{}"}
                },
            },
            j_pmcmod_prescript5 = {
                name = '지령',
                text = {
                    "{C:red}버리기{}를 사용하지 않기",
                },
            },
            j_pmcmod_prescript6 = {
                name = '지령',
                text = {
                    {"{C:attention}부스터 팩{} 3개를 열고 건너뛰기"},
                    {"건너뛴 팩: {c:attention}#2#{}"}
                },
            },
            j_pmcmod_prescript7 = {
                name = '지령',
                text = {
                    {"최소 {C:blue}고급{} 희귀도 이상의 책장 판매하기"},
                    {"지령 완수: {c:green}#1#{}"}
                },
            },
            j_pmcmod_prescript8 = {
                name = '지령',
                text = {
                    "{C:blue}마지막 핸드{}로 막 승리하기",
                },
            },
            j_pmcmod_prescript9 = {
                name = '지령',
                text = {
                    "{C:red}접대{} 능력 발동시키기",
                },
            },
            j_pmcmod_prescript10 = {
                name = '지령',
                text = {
                    "{C:attention}소모품 3개{} 사용하기",
                },
            },
            j_pmcmod_prescript11 = {
                name = '지령',
                text = {
                    {"e의 첫 5자리 숫자 플레이하기"},
                    {"지령 완수: {c:green}#1#{}"}
                },
            },
        },
        Other={
            effect_singleton={
                name="유일",
                text={
                    "덱에서 유일한 카드",
                    "(해당 랭크가 단 한 장임)",
                },
            },
            effect_perma={
                name="영구",
                text={
                    "카드에 직접 부여되는 효과로,",
                    "강화, 인장, 또는 에디션의 영향을 받지 않음"
                },
            },         
            pmcmod_markofcain_seal = {
                name = "카인의 표식",
                text = {
                    "{X:mult,C:white}X1.2{} 배수",
                },
            },
            pmcmod_gift_seal = {
                name = "선물",
                text = {
                    "{C:mult}+10 배수{}",
                    "접대 종료 후 남은 선물 하나당",
                    "{C:gold}$10{} 잃음",
                    "사용 후 사라짐"
                },
            },
            pmcmod_pebble_seal = {
                name = "조약돌",
                text = {
                    "{C:gold}$5{}",
                    "사용 후 사라짐"
                },
            },
            censored_joker={
                name="{X:black,C:mult}[검열삭제]",
                text={
                    "{X:black,C:mult}[검열삭제]",
                },
            },
        },
        Partner={
            pnr_pmcmod_dante = {
                name = "단테",
                text = {
                    "관리자",
                    "플레이한 핸드에",
                    "{C:attention}그림 카드{}가 없다면",
                    "해당 핸드에 {C:mult}+#2#{} 배수 제공.",
                    "{C:inactive}(현재 {C:mult}+#1# {C:inactive}배수)",
                }
            },
            pnr_pmcmod_roland = {
                name = "롤랑",
                text = {
                    "해결사",
                    "{C:dark_edition}+#2# 책장 슬롯",
                }
            },
            pnr_pmcmod_netzach = {
                name = "네짜흐",
                text = {
                    "지정사서",
                    "",
                    "{C:attention}접대{}에서 승리한 후",
                    "{C:planet}수감자{} 카드를 생성함.",
                }
            },
            pnr_pmcmod_angela = {
                name = "앤젤라",
                text = {
                    "관장",
                    "",
                    "{C:attention}접대{} 시작 시",
                    "{C:planet}책장{}을 생성함.",
                }
            },
        },
        Planet={},
        Spectral={
            c_pmcmod_conceptIncinerator = {
                name = "지운다",
                text = {
                    "최대 2개의 책장을 남은 게임 동안",
                    "등장하지 않도록 {C:red}제거{}합니다.",
                    "{C:inactive}(팀에 있는 책장만 선택 가능)",
                }
            },
            c_pmcmod_witness = {
                name = "목도",
                text = {
                    "패에 있는 {C:attention}모든 카드{}를",
                    "무작위 {C:clubs}클로버{} 그림 카드로 변경",
                    "핸드 크기 {C:red}-2{}"
                }
            },
            c_pmcmod_outcast = {
                name = "속하지 못하는",
                text = {
                    "패에 있는 {C:attention}모든 카드{}에",
                    "무작위 {C:dark_edition}강화{} 부여",
                    "핸드 크기 {C:red}-1{}",
                }
            },
            c_pmcmod_unloving = {
                name = "사랑할 수 없는",
                text = {
                    "무작위 책장을 파괴함",
                    "패에 있는 모든 카드에 보너스 부여",
                }
            },
            c_pmcmod_hunt= {
                name = "사냥",
                text = {
                    "카드 1장에 {C:attention}백화{} 부여",
                }
            },
            c_pmcmod_waltz= {
                name = "왈츠",
                text = {
                    "카드 2장에 {C:red}화상{} 부여",
                }
            },
            c_pmcmod_banquet= {
                name = "만찬",
                text = {
                    "카드 2장에 {C:dark_red}출혈{} 부여",
                }
            },
            c_pmcmod_binds= {
                name = "결박",
                text = {
                    "카드 2장에 {C:blue}침잠{} 부여",
                }
            },
            c_pmcmod_bardbed= {
                name = "가시 돋친",
                text = {
                    "카드 2장에 {C:rupture}파열{} 부여",
                }
            },
            c_pmcmod_bygone= {
                name = "지나간",
                text = {
                    "카드 2장에 {C:spade}호흡{} 부여",
                }
            },
            c_pmcmod_ticking= {
                name = "째깍이는",
                text = {
                    "카드 2장에 {C:gold}진동{} 부여",
                }
            },            
            c_pmcmod_manifest= {
                name = "개화",
                text = {
                    "{C:attention}찢어진 책장{}을",
                    "완전한 버전으로 업그레이드함."
                }
            },
        },
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
        Sleeve = {
            sleeve_pmcmod_thumbDeck = {
                name = "엄지 슬리브",
                text = {
                    "{C:gold}$100{}을 보유하고 시작",
                    "남은 {C:red}버리기{}, {C:blue}핸드{} 또는 {C:money}이자{}로부터",
                    "더 이상 돈을 획득하지 않음",
                    "{C:dark_edition}에디션{}이 부여된 책장을",
                    "발견할 확률 증가",   
                },
                unlock = {
                    '{C:attention}엄지 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_middleDeck = {
                name = "중지 슬리브",
                text = {
                    "접대 점수 요구치가",
                    "{C:attention}증가{}함",
                    "남은 핸드로 받는 보상이",
                    "{C:red}3배{}로 증가",
                },
                unlock = {
                    '{C:attention}중지 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_ringDeck = {
                name = "약지 슬리브",
                text = {
                    "{C:attention}5{}장의",
                    "무작위 책장을 가지고 시작",
                    "매 접대가 끝날 때마다",
                    "책장이 무작위로 변경됨",
                },
                unlock = {
                    '{C:attention}약지 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_indexDeck = {
                name = "검지 슬리브",
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_voiceOfTheCity}도시의 의지{} 책장을 가지고 시작.",
                },
                unlock = {
                    '{C:attention}검지 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_silenceDeck = {
                name = "침묵 슬리브",
                text = {
                    "영구적인",
                    "{C:attention, T:j_pmcmod_silence}침묵의 대가{} 책장을 가지고 시작.",
                    "{C:blue}+2 핸드{}",
                    "{C:red}+2 버리기{}",
                    "{C:inactive}+1 책장 슬롯{}",
                },
                unlock = {
                    '{C:attention}침묵 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_todaysShyLookDeck = {
                name = "수줍은 슬리브",
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_shylook}오늘의 표정{} 책장을 가지고 시작.",         
                },
                unlock = {
                    '{C:attention}수줍은 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_hatredDeck = {
                name = "사랑 슬리브",
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_queenOfHatred}증오의 여왕{} 책장을 가지고 시작.",
                },
                unlock = {
                    '{C:attention}사랑 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_galaxyDeck = {
                name = "은하수 슬리브",
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_childrenOfTheGalaxy}조약돌{} 책장을 가지고 시작.",
                },
                unlock = {
                    '{C:attention}은하수 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_giftDeck = {
                name = "선물 슬리브",
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_laetitia}선물이야~{} 책장을 가지고 시작.",
                },
                unlock = {
                    '{C:attention}선물 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_censoredDeck = {
                name = "검열 슬리브",
                text = {
                    "영구적인",
                    "{C:attention,T:j_pmcmod_censored}[검열삭제]{} 책장을 가지고 시작.",
                },
                unlock = {
                    '{C:attention}[검열삭제]{}로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
                },
            },
            sleeve_pmcmod_serpentDeck = {
                name = "뱀 슬리브",
                text = {
                    "{C:attention}막{}을 클리어할 때마다",
                    "새로운 보너스 획득 (최대 10 막까지).",
                    "점수 요구치 배수가 두 배로 증가.",
                },
                unlock = {
                    '{C:attention}뱀 덱{}으로 최소',
                    '{C:attention}뜬소문 판돈{}에서 승리 시 해금',
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
        dictionary={
            pmcmod_ph_catt="캣에 의해 살아남",
            pmcmod_badge_circus="8시의 서커스",
            pmcmod_badge_index="검지",
            pmcmod_badge_blade="검계",
            pmcmod_badge_charles="찰스 사무소",
            pmcmod_badge_puppets="인형",
            pmcmod_badge_RCorp="R사",
            pmcmod_badge_thumb="엄지",
            pmcmod_badge_library="도서관",
            pmcmod_badge_limbus="림버스 컴퍼니",
            pmcmod_badge_LCorp="로보토미 코퍼레이션",
            pmcmod_badge_head="머리",
            pmcmod_badge_newLeagueOfNine="N사 신구인회",
            pmcmod_badge_unknown="??????",
            pmcmod_badge_fixer="해결사",
            pmcmod_badge_sovereigns="별의 주인 될 자들",
            pmcmod_badge_mariachis="마리아치",
            pmcmod_badge_NCorpInquisition="N사 이단심문관",
            pmcmod_badge_citizen="시민",
            pmcmod_badge_KCorp="K사",
            pmcmod_badge_TLA="기술해방연합",
            pmcmod_badge_rosespanner="장미스패너 공방",
            pmcmod_badge_pequod="피쿼드호",
            pmcmod_badge_twinhook="쌍갈고리 해적단",
            pmcmod_badge_middle="중지",
            pmcmod_badge_empty="          ",
            pmcmod_badge_wildHunt="와일드헌트",
            pmcmod_badge_wuthering="워더링하이츠",
            pmcmod_badge_molar="어금니 보트 센터",
            pmcmod_badge_seven="세븐 협회",
            pmcmod_badge_santata="산타타의 선물공장",
            pmcmod_badge_cloud="구름마을",
            pmcmod_badge_lamanchaland="라만차랜드",
            pmcmod_badge_PCorp="P사",
            pmcmod_badge_hongyuan="홍원",
            pmcmod_badge_cinq="섕크 협회",
            pmcmod_badge_zwei="츠바이 협회",
            pmcmod_badge_fanghunt="송곳니 사냥 사무소",
            pmcmod_badge_hana="하나 협회",
            pmcmod_badge_kurokumo="흑운회",
            pmcmod_badge_TCorp="T사",
            pmcmod_badge_multicrack="멀티크랙 사무소",
            pmcmod_badge_triAxe="삼도끼 사무소",
            pmcmod_badge_ring="약지",
            pmcmod_badge_HCorp="H사",
            pmcmod_badge_jiaFamily="가씨 가문",
            pmcmod_badge_xueFamily="설씨 가문",
            pmcmod_badge_wangFamily="왕씨 가문",
            pmcmod_badge_shiFamily="사씨 가문",
            pmcmod_badge_kongFamily="공씨 가문",
            pmcmod_badge_heishou="흑수",
            pmcmod_badge_assassin="암살자",
            pmcmod_badge_spiders="거미집",
            pmcmod_badge_LCAUdjat="LCA 우제트",
            pmcmod_badge_abraxas="아브락사스의 전차",
            pmcmod_badge_colorFixer="특색",
            pmcmod_badge_abnormality="환상체",
            pmcmod_badge_foodMaybe="음식...?",
            pmcmod_elapsedTime="경과 시간",
            pmcmod_seconds=" 초",
            pmcmod_oswaldEffect1="+ 칩",
            pmcmod_oswaldEffect2="+ 배수",
            pmcmod_oswaldEffect3="X 배수",
            pmcmod_oswaldEffect4="X 배수",
            pmcmod_oswaldEffect5="배수 반전",
            pmcmod_oswaldEffect6="배수 나누기",
            pmcmod_oswaldEffect7="- 칩",
            pmcmod_oswaldEffect8="- 배수",
            pmcmod_oswaldEffect9="+ $",
            pmcmod_oswaldEffect10="+ $",
            pmcmod_oswaldEffect11="- $",
            pmcmod_oswaldEffect12="부패성 책장 생성",
            pmcmod_oswaldEffect13="렌탈 책장 생성",
            pmcmod_oswaldEffect14="영구 책장 생성",
            pmcmod_oswaldEffect15="책장 생성",
            pmcmod_oswaldEffect16="타로 카드 생성",
            pmcmod_oswaldEffect17="유령 카드 생성",
            pmcmod_oswaldEffect18="책장 파괴",
        },
        high_scores={},
        labels={
            pmcmod_markofcain_seal = "카인의 표식",
            pmcmod_gift_seal = "선물",
            pmcmod_pebble_seal = "조약돌",
            pmcmod_charge="충전",
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={
            pmcmod_roland_win={
                "이 고생을 도서관 관장이신",
                "누구 님께서 알아주셨으면 좋겠네~",
            },
            pmcmod_roland_loss={
                "한 것도 없이 당해버린 건",
                "너무 민망한데...",
            },
            pmcmod_malkuth_win={
                "우리가 이겼어!",
                "이걸로 좀 보탬이 되었을까?",
            },
            pmcmod_malkuth_loss={
                "해낼 수 있다고",
                "생각했는데...",
            },
            pmcmod_hod_win={
                "이겼다...!",
                "다들 멋지게 해내 줘서 고마워.",
            },
            pmcmod_hod_loss={
                "그렇게 열심히 했는데...",
                "마지막은 왜 늘 이런 식일까...",
            },
            pmcmod_yesod_win={
                "수고 많으셨습니다.",
                "다들 흐트러진 복장을 정리하십쇼.",
            },
            pmcmod_yesod_loss={
                "더 정확한 판단을 하셨어야 합니다.",
            },
            pmcmod_netzach_win={
                "이 정도면 충분하겠지... 이만 들어가자.",
            },
            pmcmod_netzach_loss={
                "...큰 도움을 줄 수 없는 건, 미안하네.",
            },
            pmcmod_chesed_win={
                "모두 수고 많았어~",
                "다 같이 향긋한 커피라도 한 잔 마실래~?",
            },
            pmcmod_chesed_loss={
                "나는 이제 한계인 모양이네...",
                "역시 내겐... 무리였던 거야?",
            },
            pmcmod_gebura_win={
                "이번에도 무난하게 넘겼군.",
                "다들 고생 많았어.",
            },
            pmcmod_gebura_loss={
                "분하지만... 받아들여야 하는 일이지.",
            },
            pmcmod_tiph_win={
                "당연한 결과잖아.", 
                "우리가 이 정도도 못 해낼 것 같아?",
            },
            pmcmod_tiph_loss={
                "...미안. 큰 도움을 주지는 못했네.",
            },
            pmcmod_hokma_win={
                "자만은 금물입니다.",
                "겸허히 자리를 지킬 뿐.",
            },
            pmcmod_hokma_loss={
                "결과를 받아들이기 위해",
                "마음을 접어야 함도 중요하겠죠...",
            },
            pmcmod_binah_win={
                "수고 많았단다.",
            },
            pmcmod_binah_loss={
                "무리였을 테지. 용케 버텼구나.",
            },
            pnr_pmcmod_dante_1={
                "아... 망했다!",
                "자-잠깐만 기다려!",
            },
            pnr_pmcmod_dante_2={
                "최선을 다해보자!",
            },
            pnr_pmcmod_dante_3={
                "제발 완벽하게 해내자.",
                "베르길리우스가 보고 있다고...",
            },
            pnr_pmcmod_dante_4={
                "일단... 죽지는 말아보자.",
            },
            pnr_pmcmod_roland_1={
                "그건 그거고, 이건 이거지.",
            },
            pnr_pmcmod_roland_2={
                "흠... 이번엔 또 어떤",
                "손님들이 오려나?",
            },
            pnr_pmcmod_roland_3={
                "이런, 시작이군",
            },
            pnr_pmcmod_roland_4={
                "돈이 없어요? 거지예요. 배수가 필요해요? 디버프됐어요. 유령이 없어요?",
            },
            pnr_pmcmod_roland_5={
                "이게 뭐라고... 좀 떨리는데.",
            },
            pnr_pmcmod_roland_6={
                "나한테 너무 큰 기대는 마",
                "난 그냥 한물간",
                "9급 해결사일 뿐이니까",
            },
            pnr_pmcmod_roland_7={
                "네짜흐한테 가서",
                "술이나 한 잔 얻어먹을까.",
            },
            pnr_pmcmod_netzach_1={
                "하... 시작해 볼까...",
            },
            pnr_pmcmod_netzach_2={
                "빨리 끝낼 수 있을까?",
                "다시 자러 가고 싶은데...",
            },
            pnr_pmcmod_netzach_3={
                "하아...",
            },
            pnr_pmcmod_netzach_4={
                "맥주가 필요해...",
            },
            pnr_pmcmod_netzach_5={
                "나름대로 진지하게 임하고 있으니까요...",
            },
            pnr_pmcmod_netzach_6={
                "제가 어쩌다 이런 일까지 맡아야 하는 걸까요...",
            },
            pnr_pmcmod_netzach_7={
                "술 한 잔 하고 싶네.",
            },
            pnr_pmcmod_netzach_8={
                "얼마 남지 않았네...",
            },
            pnr_pmcmod_angela_1={
                "저는 이 도서관의",
                "관장이자 사서, 앤젤라입니다.",
            },
            pnr_pmcmod_angela_2={
                "부디, 이곳에서 당신의",
                "책을 찾으실 수 있기를.",
            },
            pnr_pmcmod_angela_3={
                "환영합니다, 손님.",
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