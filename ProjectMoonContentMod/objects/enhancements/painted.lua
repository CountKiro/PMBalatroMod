SMODS.Enhancement {
    key = "painted",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 3, y = 1},
    config = { bonus = 0, mult = 0, steel_h_x_mult = 1, gold_h_dollars = 0, 
    multCollected = false, bonusCollected = false, goldCollected = false, steelCollected = false, stoneCollected = false, bleedCollected = false, ruptureCollected = false},
    any_suit = true,
    loc_vars = function(self, info_queue, card)

        return { vars = {}}
    end,
    in_pool = function(self, args)
        return G.GAME.pool_flags.fake_paintedCard_flag
    end,
    update = function(self, card, dt)

    end
}