previous_score = 0
previous_hvel = 0

data.prev_lives = 4

function done()
    if data.lives < 0 then
        return true
    end

    return false
end

function correct_reward ()
  local score = data.score * 10
  local delta_score = 0
  local delta_lives = 0
  local scaled_delta_score = 0
  local hvel = 0

  delta_score = score - previous_score
  previous_score = score
  scaled_delta_score = delta_score / 100

  delta_lives = (data.lives - data.prev_lives)

  if data.hvel > 0 then
    hvel = data.hvel / 10
  end

  return hvel + scaled_delta_score + delta_lives
end
