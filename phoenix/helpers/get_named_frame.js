
/* GET NAMED FRAME */

function getNamedFrame ( name ) {

  const dTop = ( TOP_HEIGHT_PERCENTAGE - 50 ) / 100,
        dLeft = ( LEFT_WIDTH_PERCENTAGE - 50 ) / 100;

  switch ( name ) {
    /* CENTER */
    case 'center': return [3/20, 3/20, 14/20, 14/20];
    case 'center_tall': return [4/20, 1/20, 12/20, 18/20];
    case 'center_medium': return [2/20, 2/20, 16/20, 16/20];
    case 'center_large': return [1/20, 1/20, 18/20, 18/20];
    /* SIDES */
    case 'top': return [0, 0, 1, .5 + dTop];
    case 'right': return [.5 + dLeft, 0, .5 - dLeft, 1];
    case 'bottom': return [0, .5 + dTop, 1, .5 - dTop];
    case 'left': return [0, 0, .5 + dLeft, 1];
    /* CORNERS */
    case 'top-left': return [0, 0, .5 + dLeft, .5 + dTop];
    case 'top-right': return [.5 + dLeft, 0, .5 - dLeft, .5 + dTop];
    case 'bottom-right': return [.5 + dLeft, .5 + dTop, .5 - dLeft, .5 - dTop];
    case 'bottom-left': return [0, .5 + dTop, .5 + dLeft, .5 - dTop];
    /* HALVES */
    case 'half-1': return [0/2, 0, 1/2, 1];
    case 'half-2': return [1/2, 0, 1/2, 1];
    /* THIRDS */
    case 'third-1': return [0/3, 0, 1/3, 1];
    case 'third-2': return [1/3, 0, 1/3, 1];
    case 'third-3': return [2/3, 0, 1/3, 1];
    /* SIXTHS */
    case 'sixths-1': return [0/3, 0, 1/3, 1/2];
    case 'sixths-2': return [1/3, 0, 1/3, 1/2];
    case 'sixths-3': return [2/3, 0, 1/3, 1/2];
    case 'sixths-4': return [0/3, 1/2, 1/3, 1/2];
    case 'sixths-5': return [1/3, 1/2, 1/3, 1/2];
    case 'sixths-6': return [2/3, 1/2, 1/3, 1/2];
    /* DEFAULT */
    default: throw new Error ( `Undefined frame named: "${name}"` );
  }

}
