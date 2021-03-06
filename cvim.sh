let barposition = "bottom"
let smoothscroll = "true"
let mapleader = " "
let defaultnewtabpage = "true"
map <C-;> :
map <C-o> lastUsedTab
let blacklists = [
      \ "http://10.0.1.3/*",
      \ "http://127.0.0.1/*",
      \ "http://localhost*",
      \ "https://slack.com/",
      \ "https://www.youtube.com/",
      \ "https://www.icloud.com",
      \ "https://www.notion.so",
      \ "https://www.lucidchart.com/",
      \ "https://realtimeboard.com/",
      \ "https://app.codesignal.com",
      \ "https://practice.geeksforgeeks.org",
      \ "https://www.google.com/maps",
      \ "https://docs.google.com/",
      \ "https://w3c.github.io/uievents/tools/key-event-viewer.html",
      \ "https://www.hackerrank.com/*",
      \ "https://miro.com/*"
\ ]

site 'https://github.com' {
      unmap t
      unmap s
      unmap /
      unmap l
      unmap b
}


"site '.*.atlassian.net' {
"      unmap g
"}

map <C-k> :script (function(){(function () {var i, elements = document.querySelectorAll('body *');for (i = 0; i < elements.length; i++) {if (getComputedStyle(elements[i]).position === 'fixed') {elements[i].parentNode.removeChild(elements[i]);}}})()})()<CR>
