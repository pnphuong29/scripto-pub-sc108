'use strict';
// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: 'stable',
    // default font size in pixels for all tabs
    fontSize: 12.3,
    // font family with optional fallbacks
    fontFamily:
      'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    // default font weight: 'normal' or 'bold'
    fontWeight: 'normal',
    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: 'bold',
    // line height as a relative unit
    lineHeight: 1,
    // letter spacing as a relative unit
    letterSpacing: 0,
    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,28,229,0.8)',
    // cursorColor: 'rgba(235,227,82,0.8)',
    // terminal text color under BLOCK cursor
    cursorAccentColor: '#000',
    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: 'BLOCK',
    // cursorShape: 'BEAM',
    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: true,
    // color of the text
    foregroundColor: '#fff',
    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: '#000',
    // terminal selection color
    selectionColor: 'rgba(248,28,229,0.3)',
    // border color (window, tabs)
    // borderColor: '#333',
    borderColor: '#32a852',
    // custom CSS to embed in the main window
    css: '',
    // custom CSS to embed in the terminal window
    termCSS: '',
    // set custom startup directory (must be an absolute path)
    workingDirectory: '',
    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: 'true',
    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: 'top',
    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: '12px 14px',
    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
      limeGreen: '#32CD32',
      lightCoral: '#F08080',
    },
    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Windows Subsystem for Linux (WSL) - previously Bash on Windows
    // - Example: `C:\\Windows\\System32\\wsl.exe`
    //
    // Git-bash on Windows
    // - Example: `C:\\Program Files\\Git\\bin\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    //
    // Cygwin
    // - Example: `C:\\cygwin64\\bin\\bash.exe`
    // shell: '/bin/bash',    
	// for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    // shellArgs: ['--login'],
    // shellArgs: [''],
	// for environment variables
    env: {},
    // Supported Options:
    //  1. 'SOUND' -> Enables the bell as a sound
    //  2. false: turns off the bell
    // bell: 'SOUND',
    bell: 'false',
    // An absolute file path to a sound file on the machine.
    // bellSoundURL: '/path/to/sound/file',
    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: false,
    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,
    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    quickEdit: false,
    // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
    // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
    // (inside tmux or vim with mouse mode enabled for example).
    macOptionSelectionMode: 'vertical',
    // macOptionSelectionMode: 'force',
    // Whether to use the WebGL renderer. Set it to false to use canvas-based
    // rendering (slower, but supports transparent backgrounds)
    webGLRenderer: false,
    // webGLRenderer: true,
    // keypress required for weblink activation: [ctrl|alt|meta|shift]
    // todo: does not pick up config changes automatically, need to restart terminal :/
    webLinksActivationKey: 'meta',
    // if `false` (without backticks and without quotes), Hyper will use ligatures provided by some fonts
    disableLigatures: true,
    // set to true to disable auto updates
    disableAutoUpdates: false,
    // set to true to enable screen reading apps (like NVDA) to read the contents of the terminal
    screenReaderMode: false,
    // set to true to preserve working directory when creating splits or tabs
    preserveCWD: true,
    // for advanced config flags please refer to https://hyper.is/#cfg
    modifierKeys: { altIsMeta: true },

    // Hyper Resource Collection
    // https://github.com/bnb/awesome-hyper

    // Theme: https://www.npmjs.com/package/verminal
    // verminal: {
    // fontFamily: '"My favourite font"',
    // fontSize: 16
    // },

    // Theme: https://www.npmjs.com/package/hyper-adventure-time

    // Theme: https://www.npmjs.com/package/hyperterm-horizon
    horizonTheme: '',
    // horizonTheme: 'bright',
    // horizonTheme: 'normal',

    // https://www.npmjs.com/package/hyperterm-atom-dark

    // https://www.npmjs.com/package/hyper-systray
    systray: {
      hotkey: 'Alt+Shift+`',
    },

    // https://www.npmjs.com/package/hyperterm-summon
    summon: {
      hideDock: true,
      hideOnBlur: false,
      hotkey: 'Alt+Shift+`',
    },

    // https://www.npmjs.com/package/hyperterm-visor
    visor: {
      hotkey: 'CommandOrControl+Shift+Z',
      position: 'top', // or left, right, bottom
      width: 200, // Optional, defaults to half of viewable area for horizontal positions, 100% for vertical
      height: 900, // Optional, defaults to half of viewable area for vertical positions, 100% for horizontal
    },

    // https://www.npmjs.com/package/hyperterm-overlay
    overlay: {
      alwaysOnTop: true,
      animate: false,
      hasShadow: false,
      hideDock: true,
      hideOnBlur: false,
      hotkeys: ['Alt+Shift+`'],
      position: 'top',
      primaryDisplay: false,
      resizable: true,
      startAlone: false,
      startup: false,
      size: 0.5,
      tray: true,
      unique: false,
    },

    // https://www.npmjs.com/package/hyper-window-size
    hyperWindowSize: {
      transform: true,
      width: 200,
      height: 50,
      // startX: 70,
      // startY: 70,
    },

    // https://www.npmjs.com/package/hyperborder
    hyperBorder: {
      borderColors: ['random', 'random'],
      borderWidth: '8px',
    },

    // https://www.npmjs.com/package/hyper-tabs-enhanced
    hyperTabs: {
      trafficButtons: true,
      border: true,
      tabIcons: true,
      tabIconsColored: true,
      activityColor: 'salmon',
      closeAlign: 'right',
      activityPulse: false,
    },

    // https://www.npmjs.com/package/hyper-reorderable-tabs
    hyperTabs: {
      // The height(unit px) of zone over tabs to drag the window
      navMoveable: 0,
      // The hotkeys of move tabs
      hotkeys: {
        moveLeft: 'ctrl+shift+left',
        moveRight: 'ctrl+shift+right',
      },
    },

    // https://www.npmjs.com/package/hyper-pane
    paneNavigation: {
      debug: false,
      hotkeys: {
        navigation: {
          up: 'ctrl+alt+up',
          down: 'ctrl+alt+down',
          left: 'ctrl+alt+left',
          right: 'ctrl+alt+right',
        },
        jump_prefix: 'ctrl+alt', // completed with 1-9 digits
        permutation_modifier: 'shift', // Added to jump and navigation hotkeys for pane permutation
        maximize: 'meta+enter',
      },
      showIndicators: true, // Show pane number
      indicatorPrefix: '^⌥', // Will be completed with pane number
      indicatorStyle: {
        // Added to indicator <div>
        position: 'absolute',
        top: 0,
        left: 0,
        fontSize: '10px',
      },
      focusOnMouseHover: false,
      inactivePaneOpacity: 0.6, // Set to 1 to disable inactive panes dimming
    },

    // https://www.npmjs.com/package/hyperline
    hyperline: {
      plugins: [
        'hostname',
        'ip',
        'network',
        'cpu',
        'memory',
        'battery',
        // "spotify",
      ],
    },

    // https://www.npmjs.com/package/hyper-statusline
    hyperStatusLine: {
      dirtyColor: 'salmon',
      aheadColor: 'ivory',
      footerTransparent: false,
    },

    // https://www.npmjs.com/package/hyper-confirm
    confirmQuit: true,

    // https://www.npmjs.com/package/hyper-cat
    hyperCat: {
      // The number of pixels the cat and rainbow should jump up and down.
      staggerHeight: 2,
      // The max opacity of the rainbow.
      rainbowMaxAlpha: 1,
      // When nyan audio shall be enabled:
      //   true will always play nyan audio
      //   false will never play nyan audio
      //   "whileTyping" will play nyan audio while typing
      audioEnabled: 'whileTyping',
      // When nyan video shall be enabled:
      //   true will always play nyan video
      //   false will never play nyan video
      //   "whileTyping" will play nyan video while typing
      videoEnabled: 'whileTyping',
    },

    // https://www.npmjs.com/package/hyper-cat-cursor
    catCursor: {
      speed: 3000, // length of the sequence in milliseconds
      fontSize: 60, // font size of the cat in css pixels
      cats: ['🐱', '🙀', '😾', '😿', '😹', '😼', '😺', '😻', '😸', '😽'], // custom cat sequence. only cats are accepted, of course
    },
  },
  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    // 'hyperterm-horizon',
    // 'hyper-adventure-time',
    // 'verminal',
    'hyperterm-atom-dark',
	// 'hyper-aura-theme',
	// 'hyper-solarized-light',
	// 'hyper-npm-theme',

    'hyper-window-size',
    // 'hyperborder',
    'hyper-tabs-enhanced',
    'hyper-reorderable-tabs',
    // 'hyper-pane',
    // 'hyperline',
    'hyper-statusline',

    // 'hyperterm-visor',
    'hyperterm-summon',
    // 'hyper-systray',
    // 'hyperterm-overlay',
    // 'hyper-confirm',

    // 'hyperpower',
    // 'hyper-cat-cursor',
    // 'hyper-cat',
  ],
  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],
  keymaps: {
    'window:devtools': 'meta+alt+i',
    // 'window:reload': 'meta+shift+r',
    'window:reloadFull': 'meta+ctrl+,',
    'window:preferences': 'meta+,',
    'zoom:reset': 'meta+0',
    'zoom:in': ['meta+plus', 'meta+='],
    'zoom:out': 'meta+-',
    'window:new': 'meta+n',
    'window:minimize': 'meta+m',
    'window:zoom': 'meta+shift+z',
    'window:toggleFullScreen': 'meta+enter',
    'window:close': 'meta+shift+w',
    'tab:new': 'meta+t',
    'tab:next': ['meta+ctrl+right'],
    'tab:prev': ['meta+ctrl+left'],
    'tab:jump:prefix': 'meta',
    'pane:next': 'meta+right',
    'pane:prev': 'meta+left',
    'pane:splitRight': 'meta+d',
    'pane:splitDown': 'meta+shift+d',
    'pane:close': 'meta+w',
    'editor:undo': 'meta+z',
    'editor:redo': 'meta+shift+z',
    'editor:cut': 'meta+x',
    'editor:copy': 'meta+c',
    'editor:paste': 'meta+v',
    'editor:selectAll': 'meta+a',
    'editor:search': 'meta+f',
    'editor:search-close': 'esc',
    'editor:movePreviousWord': '',
    'editor:moveNextWord': '',
    'editor:moveBeginningLine': '',
    'editor:moveEndLine': '',
    'editor:deletePreviousWord': '',
    'editor:deleteNextWord': '',
    'editor:deleteBeginningLine': '',
    'editor:deleteEndLine': '',
    'editor:clearBuffer': '',
    'editor:break': '',
    'plugins:update': 'meta+shift+u',
  },
};
//# sourceMappingURL=config-default.js.map
