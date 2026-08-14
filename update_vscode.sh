#!/bin/bash

cp ./vscode_settings/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
cp ./vscode_settings/settings.json ~/Library/Application\ Support/Code/User/settings.json
cat ./vscode_settings/extensions.json | xargs -n 1 code --install-extension

