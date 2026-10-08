scoreboard objectives add chunkrand dummy
scoreboard objectives add chunkrand.lx dummy
scoreboard objectives add chunkrand.lz dummy
scoreboard objectives add chunkrand.timer dummy
scoreboard objectives add chunkrand.busy dummy

# Settings (only set when missing, so your changes survive /reload)
execute unless score #enabled chunkrand matches 0.. run scoreboard players set #enabled chunkrand 1
execute unless score #radius chunkrand matches 0.. run scoreboard players set #radius chunkrand 10
execute unless score #chunks_per_tick chunkrand matches 1.. run scoreboard players set #chunks_per_tick chunkrand 2
execute unless score #structure_radius chunkrand matches 0.. run scoreboard players set #structure_radius chunkrand 160
execute if score #radius chunkrand matches 33.. run scoreboard players set #radius chunkrand 32

scoreboard players set #16 chunkrand 16
function chunkrand:blocks
execute store result score #block_count chunkrand run data get storage chunkrand:config blocks

tellraw @a [{"text":"[Chunk Randomizer] ","color":"gold"},{"text":"Loaded with ","color":"gray"},{"score":{"name":"#block_count","objective":"chunkrand"},"color":"yellow"},{"text":" possible blocks.","color":"gray"}]
