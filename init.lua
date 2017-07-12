-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, 'F17')


pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 is pressed,
--   send ESCAPE if no other keys are pressed.

releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end


-- Screensaver
afun = function()
  hs.eventtap.keyStroke({'ctrl', 'shift'}, 'space')
  k.triggered = true
end
k:bind({}, 'space', nil, afun)

-- HYPER+hjkl: VIM arrow keys
afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'left', true):post()
end
k:bind({}, 'h', afun, nil, afun)

afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'down', true):post()
end
k:bind({}, 'j', afun, nil, afun)

afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'up', true):post()
end
k:bind({}, 'k', afun, nil, afun)

afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'right', true):post()
end
k:bind({}, 'l', afun, nil, afun)

-- HYPER+tab: enter
afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'return', true):post()
end
k:bind({}, 'tab', afun, nil, afun)  

-- HYPER+wasd: arrow keys
afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'left', true):post()
end
k:bind({}, 'a', afun, nil, afun)

afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'down', true):post()
end
k:bind({}, 's', afun, nil, afun)

afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'up', true):post()
end
k:bind({}, 'w', afun, nil, afun)

afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'right', true):post()
end
k:bind({}, 'd', afun, nil, afun)

-- HYPER+io: Back and Forward 1 word
afun = function()
  hs.eventtap.keyStroke({'alt'}, 'left')
  k.triggered = true
end
k:bind({}, 'i', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'alt'}, 'right')
  k.triggered = true
end
k:bind({}, 'o', nil, afun)

-- HYPER+backspace: Forward delete
k:bind({}, 'delete', nil, afun)
afun = function()
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, 'forwarddelete', true):post()
end
k:bind({}, 'delete', afun, nil, afun)


-- For tmux
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'up')
  k.triggered = true
end
k:bind({}, 'y', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'right')
  k.triggered = true
end
k:bind({}, 'n', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'left')
  k.triggered = true
end
k:bind({}, 'p', nil, afun)



afun = function()
  hs.eventtap.keyStroke({'ctrl'}, 'f')
  k.triggered = true
end
k:bind({}, 'f', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '1')
  k.triggered = true
end
k:bind({}, '1', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '2')
  k.triggered = true
end
k:bind({}, '2', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '3')
  k.triggered = true
end
k:bind({}, '3', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '4')
  k.triggered = true
end
k:bind({}, '4', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '5')
  k.triggered = true
end
k:bind({}, '5', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '6')
  k.triggered = true
end
k:bind({}, '6', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '7')
  k.triggered = true
end
k:bind({}, '7', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '8')
  k.triggered = true
end
k:bind({}, '8', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl'}, '9')
  k.triggered = true
end
k:bind({}, '9', nil, afun)

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
end

-- Bind the Hyper key
f17 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
