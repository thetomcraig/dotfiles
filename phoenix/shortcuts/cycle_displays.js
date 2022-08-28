// screen ids:
// AA4129F8-E94C-455C-A2CE-F3C7DF605E8E
// 95458444-A649-45C1-94AA-7D8880A7144F
// 37D8832A-2D66-02CA-B9F7-8F30A301B230
// B2085621-B801-4448-8FB9-30E7D08C1419
const window_ids = [
                    "AA4129F8-E94C-455C-A2CE-F3C7DF605E8E",
                    "95458444-A649-45C1-94AA-7D8880A7144F",
                    "37D8832A-2D66-02CA-B9F7-8F30A301B230",
                    "B2085621-B801-4448-8FB9-30E7D08C1419"
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

setKeyHandler ( 'x', HYPER, () => {

  const window = Window.focused ();

  if ( !window ) return;

  const oldScreen = window.screen(); 
  const newScreen = oldScreen.next();

  // console.log(window);
  // console.log(window.screen());
  // console.log(oldScreen.spaces());
  // console.log(oldScreen.currentSpace());
  // console.log(oldScreen.windows());
  // console.log(oldScreen.identifier());
  // console.log(oldScreen.screenForIdentifier("37D8832A-2D66-02CA-B9F7-8F30A301B230"));
  // console.log("spaces");
  // console.log(oldScreen.spaces());
  // console.log(oldScreen.spaces().all());



  if(oldScreen.isEqual(newScreen)){
     return; 
  }

  const ratio = frameRatio(
     oldScreen.flippedVisibleFrame(), 
     newScreen.flippedVisibleFrame(),
  )

  window.setFrame(ratio(window.frame()));

});

setKeyHandler ( '1', HYPER, () => {

  const window = Window.focused ();

  if ( !window ) return;

  const oldScreen = window.screen(); 
  const newScreen = oldScreen.next();

  if(oldScreen.isEqual(newScreen)){
     return; 
  }

  const ratio = frameRatio(
     oldScreen.flippedVisibleFrame(), 
     newScreen.flippedVisibleFrame(),
  )

  window.setFrame(ratio(window.frame()));

});


