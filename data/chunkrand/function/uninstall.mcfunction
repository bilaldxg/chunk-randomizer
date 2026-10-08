scoreboard objectives remove chunkrand
data remove storage chunkrand:config blocks
data remove storage chunkrand:tmp c
data remove storage chunkrand:done chunks
tellraw @a [{"text":"[Chunk Randomizer] ","color":"gold"},{"text":"Uninstalled. Run /datapack disable to finish.","color":"gray"}]
