terminal = appKey('t', MOD, 'iTerm', `
  create window with default profile
`, maxFrame, []);

browser = appKey('b', MOD, 'Safari', `
  if it is running
    make new document
  end if
  activate
`, maxFrame, [
  'General',
  'Tabs',
  'Autofill',
  'Passwords',
  'Search',
  'Security',
  'Privacy',
  'Websites',
  'Extensions',
  'Advanced'
]);

finder = appKey('f', MOD, 'Finder', `
  make new Finder window to (path to home folder)
  activate
`, centerFrame, [
  'Quick Look',
  'About Finder',
  'Finder Preferences',
  ' Info$'
]);
