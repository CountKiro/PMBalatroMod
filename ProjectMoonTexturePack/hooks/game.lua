
local hookTest = ease_background_colour_blind
function ease_background_colour_blind(state, blind_override)
	local ret = hookTest(state, blind_override)
	
	--Middle
	if G.GAME.selected_back.name == 'The Middle Deck' then
		ease_background_colour{new_colour = HEX("5a157a"), special_colour = HEX("ab9755"), contrast = 4}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("5a157a"), 0.2), special_colour = darken(HEX("ab9755"), 0.2), contrast = 4}
		end
	end

	--Thumb
	if G.GAME.selected_back.name == 'The Thumb Deck' then
		ease_background_colour{new_colour = HEX("59170e"), special_colour = HEX("9c7b2f"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("59170e"), 0.2), special_colour = darken(HEX("9c7b2f"), 0.2), contrast = 2}
		end
	end

	--Ring
	if G.GAME.selected_back.name == 'The Ring Deck' then
		ease_background_colour{new_colour = HEX("e3e3e3"), special_colour = HEX("858585"), contrast = 3}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("e3e3e3"), 0.2), special_colour = darken(HEX("858585"), 0.2), contrast = 3}
		end
	end

	--Index
	if G.GAME.selected_back.name == 'The Index Deck' then
		ease_background_colour{new_colour = HEX("196b94"), special_colour = HEX("10161a"), contrast = 3}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("196b94"), 0.2), special_colour = darken(HEX("10161a"), 0.2), contrast = 3}
		end
	end

	--Serpent

	if (G.GAME.selected_back.name == 'Serpent Deck' and G.GAME.round_resets.ante == 1) then
		ease_background_colour{new_colour = HEX("243f7d"), special_colour = HEX("343a4a"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("243f7d"), 0.2), special_colour = darken(HEX("343a4a"), 0.2), contrast = 2}
		end
	end

	if (G.GAME.selected_back.name == 'Serpent Deck' and G.GAME.round_resets.ante == 2) then
		ease_background_colour{new_colour = HEX("f5a111"), special_colour = HEX("c93204"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("f5a111"), 0.2), special_colour = darken(HEX("c93204"), 0.2), contrast = 2}
		end
	end

	if (G.GAME.selected_back.name == 'Serpent Deck' and G.GAME.round_resets.ante == 3) then
		ease_background_colour{new_colour = HEX("adadad"), special_colour = HEX("e3e1e1"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("adadad"), 0.2), special_colour = darken(HEX("e3e1e1"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 4) then
		ease_background_colour{new_colour = HEX("545028"), special_colour = HEX("8fa31f"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("545028"), 0.2), special_colour = darken(HEX("8fa31f"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 5) then
		ease_background_colour{new_colour = HEX("0f0f0f"), special_colour = HEX("9c7714"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("0f0f0f"), 0.2), special_colour = darken(HEX("9c7714"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 6) then
		ease_background_colour{new_colour = HEX("9c761e"), special_colour = HEX("d9c698"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("9c761e"), 0.2), special_colour = darken(HEX("d9c698"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 7) then
		ease_background_colour{new_colour = HEX("2b241f"), special_colour = HEX("3d4b4d"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("2b241f"), 0.2), special_colour = darken(HEX("3d4b4d"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 8) then
		ease_background_colour{new_colour = HEX("473221"), special_colour = HEX("473221"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("473221"), 0.2), special_colour = darken(HEX("473221"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 9) then
		ease_background_colour{new_colour = HEX("321554"), special_colour = HEX("6a3a8c"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("321554"), 0.2), special_colour = darken(HEX("6a3a8c"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 10) then
		ease_background_colour{new_colour = HEX("211f1e"), special_colour = HEX("22292e"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("211f1e"), 0.2), special_colour = darken(HEX("22292e"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante > 10) then
		ease_background_colour{new_colour = HEX("60077d"), special_colour = HEX("140b17"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("60077d"), 0.2), special_colour = darken(HEX("140b17"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Silent Deck' then
		ease_background_colour{new_colour = HEX("063d16"), special_colour = HEX("0d140f"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("063d16"), 0.2), special_colour = darken(HEX("0d140f"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Shy Deck' then
		ease_background_colour{new_colour = HEX("2e170f"), special_colour = HEX("631709"), contrast = 1}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("2e170f"), 0.2), special_colour = darken(HEX("631709"), 0.2), contrast = 1}
		end
	end

	if G.GAME.selected_back.name == 'Love Deck' then
		ease_background_colour{new_colour = HEX("f58f36"), special_colour = HEX("f54983"), contrast = 1}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("f58f36"), 0.2), special_colour = darken(HEX("f54983"), 0.2), contrast = 1}
		end
	end

	if G.GAME.selected_back.name == 'Galaxy Deck' then
		ease_background_colour{new_colour = HEX("3f1173"), special_colour = HEX("1e0942"), contrast = 1}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("3f1173"), 0.2), special_colour = darken(HEX("1e0942"), 0.2), contrast = 1}
		end
	end

	if G.GAME.selected_back.name == 'Gift Deck' then
		ease_background_colour{new_colour = HEX("8a0b39"), special_colour = HEX("47101e"), contrast = 1}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("8a0b39"), 0.2), special_colour = darken(HEX("47101e"), 0.2), contrast = 1}
		end
	end

	if G.GAME.selected_back.name == 'Censored Deck' then
		ease_background_colour{new_colour = HEX("8f0725"), special_colour = HEX("1f0404"), contrast = 1}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("8f0725"), 0.2), special_colour = darken(HEX("1f0404"), 0.2), contrast = 1}
		end
	end

	--if G and G.GAME and G.GAME.blind and G.GAME.blind.name == "bl_manacle" then
	if G.GAME.selected_back.name == 'Red Deck' then
		ease_background_colour{new_colour = HEX("f5a111"), special_colour = HEX("c93204"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("f5a111"), 0.2), special_colour = darken(HEX("c93204"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Blue Deck' then
		ease_background_colour{new_colour = HEX("243f7d"), special_colour = HEX("343a4a"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("243f7d"), 0.2), special_colour = darken(HEX("343a4a"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Yellow Deck' then
		ease_background_colour{new_colour = HEX("9c761e"), special_colour = HEX("d9c698"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("9c761e"), 0.2), special_colour = darken(HEX("d9c698"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Green Deck' then
		ease_background_colour{new_colour = HEX("545028"), special_colour = HEX("8fa31f"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("545028"), 0.2), special_colour = darken(HEX("8fa31f"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Black Deck' then
		ease_background_colour{new_colour = HEX("211f1e"), special_colour = HEX("22292e"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("211f1e"), 0.2), special_colour = darken(HEX("22292e"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Magic Deck' then
		ease_background_colour{new_colour = HEX("473221"), special_colour = HEX("914617"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("473221"), 0.2), special_colour = darken(HEX("914617"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Nebula Deck' then
		ease_background_colour{new_colour = HEX("0f0f0f"), special_colour = HEX("9c7714"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("0f0f0f"), 0.2), special_colour = darken(HEX("9c7714"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Ghost Deck' then
		ease_background_colour{new_colour = HEX("adadad"), special_colour = HEX("e3e1e1"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("adadad"), 0.2), special_colour = darken(HEX("e3e1e1"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Abandoned Deck' then
		ease_background_colour{new_colour = HEX("1a2440"), special_colour = HEX("2997d6"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("1a2440"), 0.2), special_colour = darken(HEX("2997d6"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Checkered Deck' then
		ease_background_colour{new_colour = HEX("321554"), special_colour = HEX("6a3a8c"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("321554"), 0.2), special_colour = darken(HEX("6a3a8c"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Zodiac Deck' then
		ease_background_colour{new_colour = HEX("2b241f"), special_colour = HEX("3d4b4d"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("2b241f"), 0.2), special_colour = darken(HEX("3d4b4d"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Anaglyph Deck' then
		ease_background_colour{new_colour = HEX("e0cfb1"), special_colour = HEX("ede7dd"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("e0cfb1"), 0.2), special_colour = darken(HEX("ede7dd"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Painted Deck' then
		ease_background_colour{new_colour = HEX("4f4138"), special_colour = HEX("40331c"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("4f4138"), 0.2), special_colour = darken(HEX("40331c"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Plasma Deck' and not G.shop then
		ease_background_colour{new_colour = HEX("02e81d"), special_colour = HEX("000000"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("02e81d"), 0.2), special_colour = darken(HEX("000000"), 0.2), contrast = 2}
		end
	end
	if G.GAME.selected_back.name == 'Erratic Deck' then
		ease_background_colour{new_colour = HEX("992399"), special_colour = HEX("5c091c"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("992399"), 0.2), special_colour = darken(HEX("5c091c"), 0.2), contrast = 2}
		end
	end

	if G.GAME.selected_back.name == 'Challenge Deck' then
		ease_background_colour{new_colour = HEX("53e664"), special_colour = HEX("26b54f"), contrast = 2}
		if state == G.STATES.TAROT_PACK or state == G.STATES.SPECTRAL_PACK or state == G.STATES.STANDARD_PACK or state == G.STATES.BUFFOON_PACK or state == G.STATES.PLANET_PACK then
        	ease_background_colour{new_colour = darken(HEX("53e664"), 0.2), special_colour = darken(HEX("26b54f"), 0.2), contrast = 2}
		end
	end
	return ret
	
end