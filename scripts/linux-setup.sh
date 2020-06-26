#!/bin/bash
# This script does (highly opinionated) Linux setup on Ubuntu.
# Some of the git repos cloned below are private to @alichtman and will require access.
# Written by: Aaron Lichtman (@alichtman on GitHub)

# To run this script, use the following bash command:
# $ wget https://raw.githubusercontent.com/alichtman/scripts/master/setup/linux-setup.sh && chmod +x linux-setup.sh && ./linux-setup.sh

# TODO: Better debug output
#       Clean up package installs
#       Function to download latest GitHub release: https://www.google.com/search?hl=en&q=curl%20latest%20github%20release%20deb

error() {
  printf '\E[31m'; echo "$@"; printf '\E[0m'
}

if [[ $(uname -s) != "Linux" ]]; then
    error "ERROR: OS is not Linux!"
    exit 1
fi

if [[ $EUID -eq 0 ]]; then
    error "Must NOT be root user"
    exit 1
fi

# Remove bloat
sudo apt-get purge thunderbird* totem totem-plugins -y
sudo apt remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku

# Set up repos for installation
sudo apt install software-properties-common curl
sudo apt-add-repository multiverse
sudo apt-add-repository universe
sudo apt-add-repository main
sudo apt-add-repository restricted
sudo apt-add-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"

echo "Have you added contrib and non-free to the /etc/apt/sources.list file?"
echo "    -> https://wiki.debian.org/SourcesList"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Continuing."; break;;
        No ) exit;;
    esac
done


# Gen new SSH key
echo "Place this key at ~/.ssh/alichtman-GitHub, and upload the public key to GitHub"
ssh-keygen -t rsa -b 4096 -C "aaronlichtman@gmail.com"

echo "Have you added the public key to GitHub?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) break;;
    esac
done

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/alichtman-GitHub

sudo apt-update

# zsh
sudo apt install zsh -y
echo "Changing shell to zsh"
chsh -s "$(command -v zsh)"

sudo apt install python3-pip -y
export PATH="$PATH:$HOME/.local/bin"
pip3 install shallow-backup pynvim thefuck

# shallow-backup + dotfiles
mkdir ~/shallow-backup
git clone https://github.com/alichtman/dotfiles ~/shallow-backup/dotfiles
cp ~/shallow-backup/dotfiles/.config/shallow-backup.conf ~/.config
shallow-backup -reinstall-dots
# Will reclone later with SSH so I can use it as a git repo
rm -rf ~/shallow-backup/dotfiles

source "$HOME"/.zshenv
source "$HOME"/.config/zsh/.zshrc

if [ -z "$PYENV_ROOT" ]; then
    PYENV_ROOT="/usr/local/var/pyenv"
fi

# Install pyenv
sudo git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT

# vim-plug for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install ctags for Vista.vim
sudo snap install universal-ctags
sudo snap connect universal-ctags:dot-ctags

# zinit
mkdir ~/.config/zsh/.zinit
git clone https://github.com/zdharma/zinit.git ~/.config/zsh/.zinit/bin

# rvm
sudo apt-add-repository -y ppa:rael-gc/rvm

# install yq
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CC86BB64
sudo add-apt-repository ppa:rmescandon/yq

# install spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# install flatpak
sudo add-apt-repository ppa:alexlarsson/flatpak

sudo apt update

sudo apt install -y \
    chromium-browser \
    ddgr \
    fzf \
    flatpak \
    g++ \
    gcc \
    git \
    git-extras \
    gnome-software-plugin-flatpak \
    gnupg2 \
    golang-1.14-go \
    htop \
    hub \
    libclang-dev \
    libjansson-dev \
    libssl-dev \
    make \
    neovim \
    neofetch \
    openssh-server \
    plymouth \
    plymouth-x11 \
    plymouth-themes \
    polybar \
    ranger \
    silversearcher-ag \
    sxhkd \
    spotify-client \
    steam \
    tmux \
    xsel \
    wireshark \
    virtualbox \
    vlc \
    yq \
    p7zip-full \
    p7zip-rar

ln -s /usr/lib/go-1.14/bin/go /usr/local/bin/go

go get github.com/charmbracelet/glow

# Set up flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install nvim plugins
nvim '+PlugUpdate' '+PlugUpgrade' '+CocUpdate' '+qall'

# Install rvm
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install node
sudo snap install --classic node

# Install PyCharm and CLion
sudo snap install pycharm-community --classic
sudo snap install clion --classic

# Install Signal Desktop
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
# Yeah, I know xenial is weird here... It works though.
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# Install Discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
rm discord.deb

# Install Caprine
sudo snap install caprine

# Install VSCode
sudo snap install --classic code

mkdir ~/open-source-software

# Install trash-cli
git clone https://github.com/andreafrancia/trash-cli.git ~/open-source-software/trash-cli
cd ~/open-source-software/trash-cli
sudo python3 setup.py install --user

# Install transcrypt
git clone https://github.com/elasticdog/transcrypt.git ~/open-source-software/transcrypt
cd ~/open-source-software/transcrypt
ln -s $(realpath transcrypt) ~/bin/transcrypt

cd

# tmux setup
mkdir ~/.config/tmux/plugins
mkdir ~/.config/tmux/resurrect
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
# Install tpm packages
~/.config/tmux/plugins/tpm/bin/install_plugins

# Install diff-so-fancy and prettyping
mkdir ~/bin
curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o ~/bin/diff-so-fancy && chmod +x ~/bin/diff-so-fancy
curl https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping -o ~/bin/prettyping && chmod +x ~/bin/prettyping

# Clone my repos
mkdir ~/Desktop/Development
git clone --recursive git@github.com:alichtman/notes.git ~/Desktop/Development/notes
git clone git@github.com:alichtman/writeups.git ~/Desktop/Development/writeups
git clone git@github.com:alichtman/scripts.git ~/Desktop/Development/scripts
git clone git@github.com:alichtman/fzf-notes.git ~/Desktop/Development/fzf-notes
git clone git@github.com:alichtman/dotfiles.git ~/shallow-backup/dotfiles

# Install my scripts
mkdir ~/bin
(cd ~/Desktop/Development/fzf-notes && chmod +x fzf-notes && ln -s "$(realpath fzf-notes)" ~/bin/fzf-notes)
(cd ~/Desktop/Development/scripts && chmod +x INSTALL.sh && ./INSTALL.sh)

# Install fonts with glyph support
# TODO: Actually install the font
git clone git@github.com:alichtman/patched-nerd-fonts.git ~/Desktop/Development/patched-nerd-fonts

# Install cargo
curl https://sh.rustup.rs -sSf | sh

cargo install ripgrep bat fd-find starship lsd

rm ~/.bashrc ~/.bash_history ~/.bash_logout ~/.sudo_as_admin_successful ~/.wget-hsts ~/.profile

# Configure Plymouth

sudo apt install plymouth plymouth-themes v86d
git clone https://github.com/adi1090x/plymouth-themes.git ~/open-source-software/plymouth-themes
cd ~/open-source-software/plymouth-themes
sudo cp -r \
    pack_1/colorful \
    pack_1/colorful_loop \
    pack_1/colorful_sliced \
    pack_1/cuts \
    pack_1/cuts_alt \
    pack_4/rings \
    pack_4/rings \
    pack_4/sliced \
    pack_4/sphere \
    pack_4/splash \
    /usr/share/plymouth/themes/

# Configure Ranger plugins
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons


echo -e "## Setup Complete"
echo -e "## Remember to install the fonts you want to use!"
echo -e "## Remember to finish installing plymouth!"
echo -e "## Remember to set up SSH, SSH keys and disable password-based logins!"
echo -e "## Remember to to restart!"
