previous_score = 0
previous_hvel = 0
previous_vvel = 0
previous_time = 0

data.prev_lives = 4

function done()
    if data.lives < 0 then
        return true
    end
    return false
end

function correct_reward ()
  if data.prev_lives > data.lives then
    data.prev_lives = data.lives
  end

  local score = data.score
  local hvel = 0
  local delta_score = 0
  local delta_lives = 0
  local scaled_delta_score = 0
  local delta_time = 0

  delta_score = score - previous_score
  previous_score = score
  scaled_delta_score = delta_score / 10

  if data.time > previous_time then
    previous_time = data.time
  elseif data.time < previous_time then
    previous_time = data.time
    delta_time = previous_time - data.time
  end

  if data.hvel > 0 then
    hvel = data.hvel / 10
  end

  return hvel + scaled_delta_score + delta_lives + delta_time
end
