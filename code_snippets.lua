local debug = false
local roadBlock=""
local roadBlock = {}
function init() --things to do when turtle is first started up
  for i=1, 16 do
    table.insert(roadBlock, false)
  end
  if debug then 
    for i=1,#Table do
      write( Table[i] )
    end
  end
end

function updateRoadBlockTable() -- scans through all 16 slots to see if there are blocks in a specified slot
  
function updateBlock() -- checks the block below to see if it is roadBlock, and if not replaces it.
  local success, data = turtle.inspectDown()
  if success and roadBlock ~= data.name..data.metadata -- ~= is not equal
      turtle.digDown
      turtle.select() -- check roadBlock table for which slot has road blocks in it
      turtle.placeDown
  end
end
