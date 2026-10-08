# Macro args: dim, bx, bz. Skips chunks already done or not fully loaded.
$execute if data storage chunkrand:done chunks."$(dim)|$(bx)|$(bz)" run return 0
$execute unless loaded $(bx) 0 $(bz) run return 0
function chunkrand:chunk/process
