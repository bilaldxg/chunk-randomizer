scoreboard objectives remove chunkrand
scoreboard objectives remove chunkrand.lx
scoreboard objectives remove chunkrand.lz
scoreboard objectives remove chunkrand.timer
scoreboard objectives remove chunkrand.busy
data remove storage chunkrand:config blocks
data remove storage chunkrand:tmp c
data remove storage chunkrand:done chunks
tellraw @a [{"text":"[Chunk Randomizer] ","color":"gold"},{"text":"Uninstalled. Run /datapack disable to finish.","color":"gray"}]
