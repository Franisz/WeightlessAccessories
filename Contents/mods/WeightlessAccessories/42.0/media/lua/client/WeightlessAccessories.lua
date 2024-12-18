
if not TweakItemData then TweakItemData = {} end

if not WeightlessAccessories then WeightlessAccessories = {} end

function WeightlessAccessories.IsEligible(item)
  if item:getTypeString() ~= "Clothing" 
  then
    return false
  end

  local location = item:getBodyLocation();

  if location:contains("Underwear") 
  or location:contains("UnderwearInner") 
  or location:contains("UnderwearTop") 
  or location:contains("UnderwearBottom") 
  or location:contains("UnderwearExtra1") 
  or location:contains("UnderwearExtra2") 
  then
    return true
  end

  if not item:isCosmetic()
  then
    return false
  end

  -- if item:getActualWeight() > 0.2 then
  --   return false
  -- end

  if location:contains("Neck")
  or location:contains("Tail") 
  or location:contains("RightWrist") 
  or location:contains("LeftWrist") 
  or location:contains("BellyButton") 
  or location:contains("Necklace") 
  or location:contains("Necklace_Long") 
  or location:contains("Nose") 
  or location:contains("Ears") 
  or location:contains("EarTop") 
  or location:contains("Right_MiddleFinger") 
  or location:contains("Left_MiddleFinger") 
  or location:contains("Right_RingFinger") 
  or location:contains("Left_RingFinger") 
  then
    return true
  end

  return false
end

function WeightlessAccessories.AlterWeight()
  print("--- WeightlessAccessories: Altering Weight");

  local items = getAllItems();

  for i = 0, items:size() - 1, 1 do
    local item = items:get(i);

    if WeightlessAccessories.IsEligible(item) then
      if not TweakItemData[item:getFullName()] or (TweakItemData[item:getFullName()] and not TweakItemData[item:getFullName()]["Weight"]) then
        item:DoParam("Weight = 0");
        print(item:getFullName()..": Weight = 0");
      else
        print(item:getFullName()..": Found in TweakItemData (Skipping)");
      end
    end

  end

  print("--- WeightlessAccessories: Finished");
end

Events.OnGameBoot.Add(WeightlessAccessories.AlterWeight)