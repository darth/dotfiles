const leftHalfFrame = calcFrame(
  {n: 2, k: 1, i: 0, padding: PADDING},
  {n: 1, k: 1, i: 0, padding: PADDING}
);
const leftHalfKey = new Key('h', MOD_SHIFT, () => {
  setFrame(leftHalfFrame);
});

const bottomHalfFrame = calcFrame(
  {n: 1, k: 1, i: 0, padding: PADDING},
  {n: 2, k: 1, i: 1, padding: PADDING}
);
const bottomHalfKey = new Key('j', MOD_SHIFT, () => {
  setFrame(bottomHalfFrame);
});

const topHalfFrame = calcFrame(
  {n: 1, k: 1, i: 0, padding: PADDING},
  {n: 2, k: 1, i: 0, padding: PADDING}
);
const topHalfKey = new Key('k', MOD_SHIFT, () => {
  setFrame(topHalfFrame);
});

const rightHalfFrame = calcFrame(
  {n: 2, k: 1, i: 1, padding: PADDING},
  {n: 1, k: 1, i: 0, padding: PADDING}
);
const rightHalfKey = new Key('l', MOD_SHIFT, () => {
  setFrame(rightHalfFrame);
});

const maxFrame = calcFrame(
  {n: 1, k: 1, i: 0, padding: PADDING},
  {n: 1, k: 1, i: 0, padding: PADDING}
);
const maxKey = new Key('space', MOD, () => {
  setFrame(maxFrame);
});

const centerFrame = calcFrame(
  {n: 1, k: 1, i: 0, padding: 0.265},
  {n: 1, k: 1, i: 0, padding: 0.120}
);
const centerKey = new Key('x', MOD, () => {
  setFrame(centerFrame);
});

const leftTermFrame = calcFrame(
  {n: 9, k: 5, i: 0, padding: PADDING},
  {n: 1, k: 1, i: 0, padding: PADDING}
);
const leftTermKey = new Key('[', MOD, () => {
  setFrame(leftTermFrame);
});

const rightTermFrame = calcFrame(
  {n: 9, k: 4, i: 5, padding: PADDING},
  {n: 1, k: 1, i: 0, padding: PADDING}
);
const rightTermKey = new Key(']', MOD, () => {
  setFrame(rightTermFrame);
});
