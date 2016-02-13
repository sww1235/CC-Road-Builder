-- Equip a diamond pick for the mining tool
-- have a function to detect presence of peripherals++
-- use compass peripheral from peripherals++ to help with direction finding
-- going to need to keep track of which column of road turtle is in to tell it which direction to move,
--  and how to build road surface
local debug = false
local roadBlock={name="",damage=""} -- chisel concrete or MFR road blocks
local roadBlockStatus = {}
function init() --things to do when turtle is first started up
  for i=1, 16 do
    table.insert(roadBlockStatus, false)
  end
  if debug then 
    for i=1,#roadBlockStatus do
      write( roadBlockStatus[i] )
    end
  end
updateRoadBlockTable()
end

function updateRoadBlockTable() -- scans through all 16 slots to see if there are blocks in a specified slot
  for i=1, 16 do 
    local data = turtle.getItemDetail(i)
    if debug and data then 
      write(data.name)
    end
    
    if (data and data.name==roadBlock.name and data.damage==roadBlock.damage) then
      roadBlockStatus[i]=true
    end
  end
end

      
  
function updateBlock() -- checks the block below to see if it is roadBlock, and if not replaces it.
  local success, data = turtle.inspectDown()
  if success and roadBlock.name ~= data.name and roadBlock.damaage ~= data.metadata then -- ~= is not equal
      turtle.digDown
      local slot=0
      for i=1,16 do 
        if (roadBlockStatus[i]==true) then
          slot=i
          break
        end
      end
      if slot==0 then 
        write("no more road blocks")
        RR()
        break
      end
      turtle.select(slot) -- check roadBlock table for which slot has road blocks in it
      turtle.placeDown
      if turtle.getItemCount==0 then -- if stack is empty then set current stack false
        roadBlockStatus[turtle.getSelectedSlot()]=false
      end
  end
end

function RR() -- when called, saves the current state of the road, and returns back to the resupply depot
  
end

