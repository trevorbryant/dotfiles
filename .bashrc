# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

function update {
    flatpak update --assumeyes
    flatpak uninstall --assumeyes --unused
    sudo dnf --assumeyes offline-upgrade download --refresh && {
    sudo dnf --assumeyes offline-upgrade
    }
}

if [ -f /var/run/reboot-required ] 
then
    echo "Restart required to finalize system updates."
fi

[ -d $HOME/.rcfiles ] && for file in $HOME/.rcfiles/*; do . $file; done

unset rc
