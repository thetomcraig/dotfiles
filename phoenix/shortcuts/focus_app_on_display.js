function focusAppOnDisplay(uuid) {
  const window = Window.focused ();
  if ( !window ) return;

  const allRecentAppsForScreen = new Set(Window.recent().map(win => {
      if (win.screen() !== undefined) {
        if  (win.screen().identifier() === uuid) {
          if (win !== undefined) {
            return win.app()
          }
        }
      }
  }))
  const frontMostAppOnScreen = Array.from(allRecentAppsForScreen).filter(app => app !== undefined)[0]
  frontMostAppOnScreen.focus()
}

setKeyHandler ('1', CMD_ALT, () => {
  focusAppOnDisplay(DISPLAY_IDS[0])
});
setKeyHandler ('2', CMD_ALT, () => {
  focusAppOnDisplay(DISPLAY_IDS[1])
});
setKeyHandler ('3', CMD_ALT, () => {
  focusAppOnDisplay(DISPLAY_IDS[2])
});
setKeyHandler ('4', CMD_ALT, () => {
  focusAppOnDisplay(DISPLAY_IDS[3])
});
setKeyHandler ('5', CMD_ALT, () => {
  focusAppOnDisplay(DISPLAY_IDS[4])
});