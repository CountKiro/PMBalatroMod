
local hookTest = ease_background_colour_blind
function ease_background_colour_blind(state, blind_override)
	local ret = hookTest(state, blind_override)
	
	--Middle
	if G.GAME.selected_back.name == 'The Middle Deck' then
	print("Red")
		ease_background_colour{new_colour = HEX("5a157a"), special_colour = HEX("ab9755"), contrast = 4}
	end

	--Thumb
	if G.GAME.selected_back.name == 'The Thumb Deck' then
	print("Red")
		ease_background_colour{new_colour = HEX("59170e"), special_colour = HEX("9c7b2f"), contrast = 2}
	end

	--Ring
	if G.GAME.selected_back.name == 'The Ring Deck' then
	print("Red")
		ease_background_colour{new_colour = HEX("e3e3e3"), special_colour = HEX("858585"), contrast = 3}
	end

	--Serpent

	if (G.GAME.selected_back.name == 'Serpent Deck' and G.GAME.round_resets.ante == 1) then
	print("Blue")
		ease_background_colour{new_colour = HEX("243f7d"), special_colour = HEX("343a4a"), contrast = 2}
	end

	if (G.GAME.selected_back.name == 'Serpent Deck' and G.GAME.round_resets.ante == 2) then
	print("Red")
		ease_background_colour{new_colour = HEX("f5a111"), special_colour = HEX("c93204"), contrast = 2}
	end

	if (G.GAME.selected_back.name == 'Serpent Deck' and G.GAME.round_resets.ante == 3) then
	print("Ghost")
		ease_background_colour{new_colour = HEX("adadad"), special_colour = HEX("e3e1e1"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 4) then
	print("Green")
		ease_background_colour{new_colour = HEX("545028"), special_colour = HEX("8fa31f"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 5) then
	print("Nebula")
		ease_background_colour{new_colour = HEX("0f0f0f"), special_colour = HEX("9c7714"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 6) then
	print("Yellow")
		ease_background_colour{new_colour = HEX("9c761e"), special_colour = HEX("d9c698"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 7) then
	print("Zodiac")
		ease_background_colour{new_colour = HEX("2b241f"), special_colour = HEX("3d4b4d"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 8) then
	print("Magic")
		ease_background_colour{new_colour = HEX("473221"), special_colour = HEX("914617"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 9) then
	print("Checkered")
		ease_background_colour{new_colour = HEX("321554"), special_colour = HEX("6a3a8c"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante == 10) then
	print("Black")
		ease_background_colour{new_colour = HEX("211f1e"), special_colour = HEX("22292e"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Serpent Deck' and (G.GAME.round_resets.ante > 10) then
	print("Black")
		ease_background_colour{new_colour = HEX("60077d"), special_colour = HEX("140b17"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Silent Deck' then
	print("Silent")
		ease_background_colour{new_colour = HEX("063d16"), special_colour = HEX("0d140f"), contrast = 2}
	end

	if G.GAME.selected_back.name == 'Shy Deck' then
	print("Shy")
		ease_background_colour{new_colour = HEX("2e170f"), special_colour = HEX("631709"), contrast = 1}
	end

	if G.GAME.selected_back.name == 'Love Deck' then
	print("Love")
		ease_background_colour{new_colour = HEX("f58f36"), special_colour = HEX("f54983"), contrast = 1}
	end

	--if G and G.GAME and G.GAME.blind and G.GAME.blind.name == "bl_manacle" then
	if G.GAME.selected_back.name == 'Red Deck' then
	print("Red")
		ease_background_colour{new_colour = HEX("f5a111"), special_colour = HEX("c93204"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Blue Deck' then
	print("Blue")
		ease_background_colour{new_colour = HEX("243f7d"), special_colour = HEX("343a4a"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Yellow Deck' then
	print("Yellow")
		ease_background_colour{new_colour = HEX("9c761e"), special_colour = HEX("d9c698"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Green Deck' then
	print("Green")
		ease_background_colour{new_colour = HEX("545028"), special_colour = HEX("8fa31f"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Black Deck' then
	print("Black")
		ease_background_colour{new_colour = HEX("211f1e"), special_colour = HEX("22292e"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Magic Deck' then
	print("Magic")
		ease_background_colour{new_colour = HEX("473221"), special_colour = HEX("914617"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Nebula Deck' then
	print("Nebula")
		ease_background_colour{new_colour = HEX("0f0f0f"), special_colour = HEX("9c7714"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Ghost Deck' then
	print("Ghost")
		ease_background_colour{new_colour = HEX("adadad"), special_colour = HEX("e3e1e1"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Abandoned Deck' then
	print("Abandoned")
		ease_background_colour{new_colour = HEX("1a2440"), special_colour = HEX("2997d6"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Checkered Deck' then
	print("Checkered")
		ease_background_colour{new_colour = HEX("321554"), special_colour = HEX("6a3a8c"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Zodiac Deck' then
	print("Zodiac")
		ease_background_colour{new_colour = HEX("2b241f"), special_colour = HEX("3d4b4d"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Anaglyph Deck' then
	print("Anaglyph")
		ease_background_colour{new_colour = HEX("e0cfb1"), special_colour = HEX("ede7dd"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Painted Deck' then
	print("Painted")
		ease_background_colour{new_colour = HEX("4f4138"), special_colour = HEX("40331c"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Plasma Deck' and not G.shop then
	print("plasma")
		ease_background_colour{new_colour = HEX("02e81d"), special_colour = HEX("000000"), contrast = 2}
	end
	if G.GAME.selected_back.name == 'Erratic Deck' then
	print("Erratic")
		ease_background_colour{new_colour = HEX("992399"), special_colour = HEX("5c091c"), contrast = 2}
	end

	

	return ret
	
end