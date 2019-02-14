const focus = (d) => {
  let win;
  if (Window.focused() === undefined) {
    win = Window.recent()[0];
  }
  else {
    win = Window.focused();
  }
  const neighbours = win.neighbours(d);
  if (neighbours !== undefined || neighbours.length > 0) {
    let idx;
    for (idx = 0; idx < neighbours.length; ++idx) {
      if (neighbours[idx] === undefined) {
        return;
      }
      if (neighbours[idx].isVisible()) {
        break;
      }
    }
    if (neighbours[idx] === undefined) {
      return;
    }
    neighbours[idx].focus();
  }
};

const focusLeft = new Key('h', MOD, () => {
  focus('west');
});

const focusDown = new Key('j', MOD, () => {
  focus('south');
});

const focusUp = new Key('k', MOD, () => {
  focus('north');
});

const focusRight = new Key('l', MOD, () => {
  focus('east');
});
