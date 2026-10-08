# Macro args: bx, bz. Clears the blocks inside every player standing in the
# chunk, so nobody gets stuck (e.g. when swimming and the water turns solid).
$execute positioned $(bx) -64 $(bz) as @a[dx=15,dy=383,dz=15] at @s run fill ~-0.3 ~ ~-0.3 ~0.3 ~1.8 ~0.3 minecraft:air replace #chunkrand:replaceable
