const spacesDict = {};

const keyCodes = [18, 19, 20, 21, 23, 22, 26, 28, 25];

// _.each(Space.all(), (v, idx, spaces) => {
//   if (idx < keyCodes.length) {
//     spacesDict[v.hash()] = {
//       name: 'Desktop ' + (idx + 1),
//       idx: idx,
//       keyCode: keyCodes[idx]
//     };
//   }
// });

// const dump = JSON.stringify({
//   items: _.map(spacesDict, (v, hash, coll) => {
//     return {
//       title: v.name,
//       arg: v.keyCode,
//       idx: v.idx 
//     };
//   }).sort((v1, v2) => {return v1.idx > v2.idx;})
// });

// Task.run(
//   '/usr/local/bin/bash',
//   ['-c', 'echo \'' + dump + '\' >~/.local/share/phoenix/spaces.json'],
//   _.noop
// );


Task.run(
  '/bin/cat',
  ['/Users/darth/.local/share/phoenix/spaces.json'],
  (t) => {
    const spacesFromFile = JSON.parse(t.output).items;
    const spaces = Space.all();
    for (let i = 0; i < spacesFromFile.length; ++i) {
      const name = spacesFromFile[i].title;
      const hash = spaces[i].hash();
      spacesDict[hash] = {
        name: name
      };
    }
  }
);

const showSpaceName = () => {
  const hash = Space.active().hash();
  if (hash in spacesDict) {
    const m = new Modal();
    m.text = spacesDict[hash].name;
    const frame = m.frame();
    const screenFrame = Screen.main().frame();
    m.origin = {
      x: (screenFrame.width - frame.width) / 2,
      y: (screenFrame.height - frame.height) / 2
    };
    m.duration = 1;
    m.show();
  }
}

const spaceNameKeyHandler = new Key('n', MOD, () => {
  showSpaceName();
});

const spaceDidChangeHandler = new Event('spaceDidChange', () => {
  showSpaceName();
});

let lastWorkspaceTimestamp = 0;

const spacesListKeyHandler = new Key( 'f18', [], () => {
  const timestamp = Date.now();
  if ( timestamp - lastWorkspaceTimestamp <= DOUBLE_KEY_INTERVAL ) {
    Phoenix.log('foo!');
    lastWorkspaceTimestamp = 0;
    // updateSpacesLists ();
    osascript (`tell application "Alfred 4" to search "spaces "`);
  }
  else {
    lastWorkspaceTimestamp = timestamp;
  }
});
