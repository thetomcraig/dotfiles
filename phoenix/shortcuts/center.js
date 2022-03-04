
/* CENTER */

setKeyHandler ( 'v', HYPER, () => {

  const window = Window.focused ();

  if ( !window ) return;

  center_window ( window );

});

setKeyHandler ( 'v', HYPER_SHIFT, () => {

  const window = Window.focused ();

  if ( !window ) return;

  const frame = window.frame ();

  window.setFrame ({
    x: frame.x,
    y: frame.y,
    width: CENTER_WIDTH,
    height: CENTER_HEIGHT
  });

  center_window ( window );

});


/* SHIRNK AND CENTER */
setKeysHandler ( setFrame, [['r', HYPER, ['center']]]);
setKeysHandler ( setFrame, [['t', HYPER, ['center_tall']]]);
setKeysHandler ( setFrame, [['g', HYPER, ['center_medium']]]);
setKeysHandler ( setFrame, [['v', HYPER, ['center_large']]]);
