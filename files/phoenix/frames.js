const leftHalfFrame = calcFrame(
  {'n': 2, 'i': 0, 'padding': PADDING},
  {'n': 1, 'i': 0, 'padding': PADDING}
);
const leftHalfKey = new Key('h', MOD_SHIFT, () => {
  setFrame(leftHalfFrame);
});

const bottomHalfFrame = calcFrame(
  {'n': 1, 'i': 0, 'padding': PADDING},
  {'n': 2, 'i': 1, 'padding': PADDING}
);
const bottomHalfKey = new Key('j', MOD_SHIFT, () => {
  setFrame(bottomHalfFrame);
});

const topHalfFrame = calcFrame(
  {'n': 1, 'i': 0, 'padding': PADDING},
  {'n': 2, 'i': 0, 'padding': PADDING}
);
const topHalfKey = new Key('k', MOD_SHIFT, () => {
  setFrame(topHalfFrame);
});

const rightHalfFrame = calcFrame(
  {'n': 2, 'i': 1, 'padding': PADDING},
  {'n': 1, 'i': 0, 'padding': PADDING}
);
const rightHalfKey = new Key('l', MOD_SHIFT, () => {
  setFrame(rightHalfFrame);
});

const maxFrame = calcFrame(
  {'n': 1, 'i': 0, 'padding': PADDING},
  {'n': 1, 'i': 0, 'padding': PADDING}
);
const maxKey = new Key('space', MOD, () => {
  setFrame(maxFrame);
});

const centerFrame = calcFrame(
  {'n': 1, 'i': 0, 'padding': 0.27},
  {'n': 1, 'i': 0, 'padding': 0.125}
);
const centerKey = new Key('x', MOD, () => {
  setFrame(centerFrame);
});
