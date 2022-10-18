// Internal
// Dell 27
// Dell 25
// Kogoda
// HDMI Strip
const windowIds = [
                    "37D8832A-2D66-02CA-B9F7-8F30A301B230",
                    "95458444-A649-45C1-94AA-7D8880A7144F",
                    "AA4129F8-E94C-455C-A2CE-F3C7DF605E8E",
                    "B2085621-B801-4448-8FB9-30E7D08C1419",
                    "3913815D-56F0-4FE7-90F7-6CB91892A81D"
                   ];

function frameRatio(a, b){
  const widthRatio = b.width / a.width;
  const heightRatio = b.height / a.height;

  return ({width, height, x, y}) => {
    width = Math.round(width * widthRatio);
    height = Math.round(height * heightRatio);
    x = Math.round(b.x + (x - a.x) * widthRatio);
    y = Math.round(b.y + (y - a.y) * heightRatio);

    return {width, height, x, y};
  };
};

function moveToDisplayWithUUID(uuid) {
  const window = Window.focused ();
  if ( !window ) return;

  const oldScreen = window.screen(); 

  const newScreen = Screen.all().find(screen => screen.identifier() === uuid)

  if(oldScreen.isEqual(newScreen) || newScreen === undefined) {
     return; 
  }

  const ratio = frameRatio(
     oldScreen.flippedVisibleFrame(), 
     newScreen.flippedVisibleFrame(),
  )

  window.setFrame(ratio(window.frame()));
}

setKeyHandler ('1', HYPER, () => {
  moveToDisplayWithUUID(windowIds[0])
});
setKeyHandler ('2', HYPER, () => {
  moveToDisplayWithUUID(windowIds[1])
});
setKeyHandler ('3', HYPER, () => {
  moveToDisplayWithUUID(windowIds[2])
});
setKeyHandler ('4', HYPER, () => {
  moveToDisplayWithUUID(windowIds[3])
});
setKeyHandler ('5', HYPER, () => {
  moveToDisplayWithUUID(windowIds[3])
});
