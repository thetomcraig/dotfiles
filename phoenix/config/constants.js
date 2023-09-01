
/* KEYS */

const HYPER = ['shift', 'alt', 'ctrl'];
const HYPER_SHIFT = [...HYPER, 'shift'];
const CMD_ALT = ['cmd', 'alt'];
const DOUBLE_KEY_INTERVAL = 250;

/* OTHERS */

const SHELL_PATH = '/bin/zsh';
const OSASCRIPT_PATH = '/usr/bin/osascript';

const CENTER_WIDTH = 900;
const CENTER_HEIGHT = 600;

const DEVTOOLS_SHRINK_HEIGHT = 75;

const FOCUS_WINDOW_CHECK_CYCLES = 10;
const FOCUS_WINDOW_CHECK_INTERVAL = 250;

const GROW_AMOUNT = 50;

const JSON_INDENTATION = 2;

const MODAL_APPEARANCE = 'dark';
const MODAL_DURATION = 1;
const MODAL_ANIMATION_DURATION = .2;
const MODAL_WEIGHT = 24;

const LEFT_WIDTH_PERCENTAGE = 50; // Set it to 50 if you want symmetric left and right sides' widths
const TOP_HEIGHT_PERCENTAGE = 50; // Set it to 50 if you want symmetric top and bottom sides' heights

const QUIT_BLACKLIST = ['Finder'];

const SPACES_SWITCH_WRAP = true;
const SPACES_OVERLAY_DURATION = MODAL_DURATION / 2;
const SPACES_LIST_RAW_PATH = '~/.config/phoenix/spaces/list_raw.json';
const SPACES_LIST_PATH = '~/.config/phoenix/spaces/list.json';
const SPACES_ALFRED_PRESELECT = true;
const SPACES_ALFRED_PRESELECT_DELAY = 0.1;
const SPACES_UPDATE_CYCLES = 5;
const SPACES_UPDATE_INTERVAL = 500;

// Can use "displayplacer" to update these
const DISPLAY_IDS = 
[
  // Internal
  "37D8832A-2D66-02CA-B9F7-8F30A301B230",
  // Dell 27
  "95458444-A649-45C1-94AA-7D8880A7144F",
  // Dell 25
  "912EDD5D-2AB5-4DAA-9A74-674C7BBD99FD",
  // Kogoda
  "B2085621-B801-4448-8FB9-30E7D08C1419",
  // HDMI Strip
  "3913815D-56F0-4FE7-90F7-6CB91892A81D"
];
