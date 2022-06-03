# SSH Keys
ssh-keygen -t rsa -b 4096 -C "thetomcraig@icloud.com"
eval "$(ssh-agent -s)"
echo "Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config

pbcopy < ~/.ssh/id_rsa.pub
open "https://github.com/settings/ssh/new"
echo "Paste the key into the GitHub website"

git config --global user.name "Tom Craig"
git config --global user.email thetomcraig@icloud.com

cd "${HOME}"

git clone git@github.com:thetomcraig/dotfiles.git
