const calcSize = (n, k, padding) => {
  return k * (1 - (n + 1) * padding) / n + (k - 1) * padding;
}

const calcOffset = (n, i, padding) => {
  return (i + 1) * padding + i * calcSize(n, 1, padding);
};

const calcFrame = (confX, confY) => {
  return {
    x: calcOffset(confX.n, confX.i, confX.padding),
    y: calcOffset(confY.n, confY.i, confY.padding),
    width: calcSize(confX.n, confX.k, confX.padding),
    height: calcSize(confY.n, confY.k, confY.padding)
  };
};

const setFrame = (frame, window = Window.focused()) => {
  const winFrame = window.screen().flippedVisibleFrame();
  window.setFrame({
    x: winFrame.x + winFrame.width * frame.x,
    y: winFrame.y + winFrame.height * frame.y,
    width: winFrame.width * frame.width,
    height: winFrame.height * frame.height
  });
};

const osascript = (script, cb = _.noop) => {
  Task.run('/usr/bin/osascript', ['-e', script], cb)
}

const appKey = (key, mod, name, script, frame, exceptions) => {
  const keyHandler = new Key(key, mod, () => {
    Phoenix.log(name);
    const r = new RegExp(name);
    const win = Space.active().windows().find(w => r.test(w.app().name()));
    if (!win) {
      osascript(`
        tell application "${name}"
          ${script}
        end tell
      `);
    }
    else {
      win.focus();
    }
  });

  const evHandler = new Event('windowDidOpen', (win) => {
    if (!win.isNormal() || !win.isMain()) return;

    const wName = win.app().name();
    const wTitle = win.title();

    const r = new RegExp(name);
    if (!r.test(wName)) return;

    if (!wTitle) return;

    if (exceptions.length > 0) {
      const rTitle = new RegExp(exceptions.join('|'));
      if (!wTitle || rTitle.test(wTitle)) return;
    }
    setFrame(frame, win);
  });

  return [keyHandler, evHandler];
};
