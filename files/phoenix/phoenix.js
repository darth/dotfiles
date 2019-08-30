require('./constants.js');
require('./helpers.js');
require('./frames.js');
require('./apps.js');
require('./focus.js');

const reloadHandler = new Key('r', MOD, () => {
  Phoenix.reload();
  showCenteredModal('Config reloaded!');
});

Phoenix.set({
  daemon: true,
  openAtLogin: true
});
