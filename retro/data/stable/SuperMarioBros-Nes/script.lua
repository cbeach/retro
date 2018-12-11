previous_score = 0
previous_pos = 0
previous_time = 0

data.prev_lives = 3

function done()
    if data.lives < 0 then
        return true
    end

    return false
end

function correct_reward ()
  print('data', data)
  if data.xscrollLo == 0 and data.xscrollHi == 0 then
    previous_pos = 0
  end

  if data.prev_lives > data.lives then
    data.prev_lives = data.lives
  end

  local score = data.score * 10
  local pos = data.xscrollLo + data.xscrollHi * 256
  local delta_score = 0
  local delta_pos = 0
  local delta_lives = 0
  local scaled_delta_score = 0
  local delta_time = 0

  delta_score = score - previous_score
  previous_score = score
  scaled_delta_score = delta_score / 10

  if data.time > previous_time then
    previous_time = data.time
  elseif data.time < data. then
    previous_time = data.time
    delta_time = previous_time - data.time
  end

  if pos > previous_pos then
    delta_pos = pos - previous_pos
    previous_pos = pos
  end  
  -- print('pos', pos, 'previous_pos', previous_pos, 'd_pos', delta_pos, 'xscrollLo', data.xscrollLo, 'xscrollHi', data.xscrollHi)

  --delta_lives = (data.lives - data.prev_lives)

  return delta_pos + scaled_delta_score + delta_time
end
