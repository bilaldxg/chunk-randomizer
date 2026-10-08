# Macro args: dx, dz = chunk offset from the player's chunk
$scoreboard players set #cx chunkrand $(dx)
$scoreboard players set #cz chunkrand $(dz)
scoreboard players operation #cx chunkrand += #pcx chunkrand
scoreboard players operation #cz chunkrand += #pcz chunkrand
execute store result storage chunkrand:tmp c.bx int 16 run scoreboard players get #cx chunkrand
execute store result storage chunkrand:tmp c.bz int 16 run scoreboard players get #cz chunkrand
function chunkrand:scan/check with storage chunkrand:tmp c
