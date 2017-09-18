-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, 'F17')
delay = hs.eventtap.keyRepeatDelay()


pressedF18 = function()
  k.triggered = false
  k:enter()
end

releasedF18 = function()
  k:exit()
end

-- Screensaver
afun = function()
  hs.eventtap.keyStroke({'ctrl', 'shift'}, 'space')
  k.triggered = true
end
k:bind({}, 'space', nil, afun)

-- HYPER+wasd AND +hjkl: arrow keys
afun = function()
  hs.eventtap.keyStroke({}, 'left', delay)
end
k:bind({}, 'a', nil, afun, afun)
k:bind({}, 'h', nil, afun, afun)

afun = function()
  hs.eventtap.keyStroke({}, 'right', delay)
end
k:bind({}, 'd', nil, afun, afun)
k:bind({}, 'l', nil, afun, afun)

afun = function()
  hs.eventtap.keyStroke({}, 'up', delay)
end
k:bind({}, 'w', nil, afun, afun)
k:bind({}, 'k', nil, afun, afun)

afun = function()
  hs.eventtap.keyStroke({}, 'down', delay)
end
k:bind({}, 's', nil, afun, afun)
k:bind({}, 'j', nil, afun, afun)


-- HYPER+tab: enter
afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'return', true):post()
end
k:bind({}, 'tab', afun, nil, afun)  

-- HYPER+io: Back and Forward 1 word
afun = function()
  hs.eventtap.keyStroke({'alt'}, 'right', delay)
end
k:bind({}, 'o', nil, afun, afun)

afun = function()
  hs.eventtap.keyStroke({'alt'}, 'left', delay)
end
k:bind({}, 'i', nil, afun, afun)

-- HYPER+backspace: Forward delete
afun = function()
  hs.eventtap.keyStroke({}, 'forwarddelete', delay)
end
k:bind({}, 'delete', nil, afun, afun)

-- For tmux, navigating
afun = function()
  hs.eventtap.keyStroke({'ctrl', 'shift'}, 'up', delay)
end
k:bind({}, 'y', nil, afun, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl', 'shift'}, 'right', delay)
end
k:bind({}, 'n', nil, afun, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl', 'shift'}, 'left', delay)
end
k:bind({}, 'p', nil, afun, afun)

-- HYPER+f: switch tmux panes
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, 'f', delay)
end
k:bind({}, 'f', nil, afun, afun)

-- HYPER+N: tmux window number N 
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '1', delay)
end
k:bind({}, '1', nil, afun, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '2', delay)
end
k:bind({}, '2', nil, afun, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '3', delay)
end
k:bind({}, '3', nil, afun, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '4', delay)
end
k:bind({}, '4', nil, afun, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '5', delay)
end
k:bind({}, '5', nil, afun, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '6', delay)
end
k:bind({}, '6', nil, afun, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '7', delay)
end
k:bind({}, '7', nil, afun, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '8', delay)
end
k:bind({}, '8', nil, afun, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '9', delay)
end
k:bind({}, '9', nil, afun, afun)

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
