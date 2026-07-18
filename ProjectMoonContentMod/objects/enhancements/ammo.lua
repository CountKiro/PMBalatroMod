SMODS.Enhancement {
    key = "ammo",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 6, y = 2},
    config = { },
    no_collection = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = {}}
    end,
    in_pool = function(self, args)
        return G.GAME.pool_flags.fake_ammoCard_flag
    end,
    update = function(self, card, dt)

    end
}