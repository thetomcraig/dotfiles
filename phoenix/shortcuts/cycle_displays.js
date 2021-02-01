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
  const newScreen = oldScreen.previous(); 

  if(oldScreen.isEqual(newScreen)){
     return; 
  }

  const ratio = frameRatio(
     oldScreen.flippedVisibleFrame(), 
     newScreen.flippedVisibleFrame(),
  )

  window.setFrame(ratio(window.frame()));

});
