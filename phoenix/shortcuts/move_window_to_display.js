function moveToDisplayWithUUID(uuid) {
  const window = Window.focused ();
  if ( !window ) return;

  const oldScreen = window.screen(); 

  const newScreen = Screen.all().find(screen => screen.identifier() === uuid)

  if(oldScreen.isEqual(newScreen) || newScreen === undefined) {
     return; 
  }

  const ratio = getFrameRatio(
     oldScreen.flippedVisibleFrame(), 
     newScreen.flippedVisibleFrame(),
  )

  window.setFrame(ratio(window.frame()));
}

setKeyHandler ('1', HYPER, () => {
  moveToDisplayWithUUID(DISPLAY_IDS[0])
});
setKeyHandler ('2', HYPER, () => {
  moveToDisplayWithUUID(DISPLAY_IDS[1])
});
setKeyHandler ('3', HYPER, () => {
  moveToDisplayWithUUID(DISPLAY_IDS[2])
});
setKeyHandler ('4', HYPER, () => {
  moveToDisplayWithUUID(DISPLAY_IDS[3])
});
setKeyHandler ('5', HYPER, () => {
  moveToDisplayWithUUID(DISPLAY_IDS[4])
});