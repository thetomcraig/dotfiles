-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

-- HYPER+hjkl: VIM arrow keys
afun = function()
  hs.eventtap.keyStroke({}, 'left')
  k.triggered = true
end
k:bind({}, 'h', nil, afun)

afun = function()
  hs.eventtap.keyStroke({}, 'down')
  k.triggered = true
end
k:bind({}, 'j', nil, afun)

afun = function()
  hs.eventtap.keyStroke({}, 'up')
  k.triggered = true
end
k:bind({}, 'k', nil, afun)

afun = function()
  hs.eventtap.keyStroke({}, 'right')
  k.triggered = true
end
k:bind({}, 'l', nil, afun)


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
afun = function()
  hs.eventtap.keyStroke({}, 'forwarddelete')
  k.triggered = true
end
k:bind({}, 'delete', nil, afun)



-- For opening programs
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'q')
  k.triggered = true
end
k:bind({}, 'q', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'a')
  k.triggered = true
end
k:bind({}, 'a', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'z')
  k.triggered = true
end
k:bind({}, 'z', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 's')
  k.triggered = true
end
k:bind({}, 's', nil, afun)

afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'x')
  k.triggered = true
end
k:bind({}, 'x', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'e')
  k.triggered = true
end
k:bind({}, 'e', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'd')
  k.triggered = true
end
k:bind({}, 'd', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'c')
  k.triggered = true
end
k:bind({}, 'c', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'r')
  k.triggered = true
end
k:bind({}, 'r', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'f')
  k.triggered = true
end
k:bind({}, 'f', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'v')
  k.triggered = true
end
k:bind({}, 'v', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 't')
  k.triggered = true
end
k:bind({}, 't', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'g')
  k.triggered = true
end
k:bind({}, 'g', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'b')
  k.triggered = true
end
k:bind({}, 'b', nil, afun)

-- For tmux
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'u')
  k.triggered = true
end
k:bind({}, 'u', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'n')
  k.triggered = true
end
k:bind({}, 'n', nil, afun)
afun = function()
  hs.eventtap.keyStroke({'ctrl','shift'}, 'm')
  k.triggered = true
end
k:bind({}, 'm', nil, afun)
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
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
