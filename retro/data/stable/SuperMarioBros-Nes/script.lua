previous_score = 0
previous_pos = 0

data.prev_lives = 3

function done()
    if data.lives < 0 then
        return true
    end

    return false
end

function correct_reward ()
  local score = data.score * 10
  local pos = data.xscrollLo + data.xscrollHi * 256
  -- print("lua score", score)
  -- print("lua pos", pos)
  local delta_score = 0
  local delta_pos = 0
  local delta_lives = 0
  local scaled_delta_score = 0

  delta_score = score - previous_score
  previous_score = score
  scaled_delta_score = delta_score / 100

  if pos > previous_pos then
    delta_pos = pos - previous_pos
    previous_pos = pos
  end  

  delta_lives = (data.lives - data.prev_lives)

  return delta_pos + scaled_delta_score + delta_lives
end
