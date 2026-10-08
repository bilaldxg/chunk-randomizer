execute unless score #enabled chunkrand matches 1 run return 0
scoreboard players operation #budget chunkrand = #chunks_per_tick chunkrand
execute as @a at @s run function chunkrand:player/tick
