#!/bin/sh

DEVENV_DIRECTORY=/opt/devenv
BKP_DIRECTORY=$DEVENV_DIRECTORY/.devenv.old
SUBLIME_DIRECTORY=~/.config/sublime-text-3/Packages/User

# BKP directory
if [ -d "$BKP_DIRECTORY" ]; then
	echo "$BKP_DIRECTORY already exists"
else
	echo "Creating $BKP_DIRECTORY"
	mkdir $BKP_DIRECTORY
fi

# .bashrc
if [ -f "$BKP_DIRECTORY/.bashrc" ]; then
	echo ".bashrc backup already exists"
else
	echo "Creating .bashrc backup file"
	cp ~/.bashrc $BKP_DIRECTORY/
fi
if [ -h "~/.bashrc" ]; then
	echo ".bashrc symlink already exists"
else
	echo "Removing .bashrc file and creatink symlink"
	rm ~/.bashrc
	ln -s $DOT_DIRECTORY/.bashrc ~/.bashrc
fi

# .git-completion.bash
if [ -f "$BKP_DIRECTORY/.git-completion.bash" ]; then
	echo ".git-completion.bash backup already exists"
else
	echo "Creating .git-completion.bash backup file"
	cp ~/.git-completion.bash $BKP_DIRECTORY/
fi
if [ -h "~/.git-completion.bash" ]; then
	echo ".git-completion.bash symlink already exists"
else
	echo "Removing .git-completion.bash file and creatink symlink"
	rm ~/.git-completion.bash
	ln -s $DOT_DIRECTORY/.git-completion.bash ~/.git-completion.bash
fi

# .git-prompt.sh
if [ -f "$BKP_DIRECTORY/.git-prompt.sh" ]; then
	echo ".git-prompt.sh backup already exists"
else
	echo "Creating .git-completion.bash backup file"
	cp ~/.git-prompt.sh $BKP_DIRECTORY/
fi
if [ -h "~/.git-prompt.sh" ]; then
	echo ".git-prompt.sh symlink already exists"
else
	echo "Removing .git-completion.bash file and creatink symlink"
	rm ~/.git-prompt.sh
	ln -s $DOT_DIRECTORY/.git-prompt.sh ~/.git-prompt.sh
fi

# Sublime Text
if [ -f "$SUBLIME_DIRECTORY/Preferences.sublime-settings" ]; then
	echo "Preferences.sublime-settings backup already exists"
else
	echo "Creating Preferences.sublime-settings backup file"
	cp $SUBLIME_DIRECTORY/Preferences.sublime-settings $BKP_DIRECTORY/
fi
if [ -h "$SUBLIME_DIRECTORY/Preferences.sublime-settings" ]; then
	echo "Preferences.sublime-settings symlink already exists"
else
	echo "Removing Preferences.sublime-settings file and creatink symlink"
	rm $SUBLIME_DIRECTORY/Preferences.sublime-settings
	ln -s $DOT_DIRECTORY/sublime-text-3/Preferences.sublime-settings $SUBLIME_DIRECTORY/Preferences.sublime-settings
fi
if [ -f "$SUBLIME_DIRECTORY/Default\ \(Linux\).sublime-keymap" ]; then
	echo "Default (Linux).sublime-keymap backup already exists"
else
	echo "Creating Default (Linux).sublime-keymap backup file"
	cp $SUBLIME_DIRECTORY/Default\ \(Linux\).sublime-keymap $BKP_DIRECTORY/
fi
if [ -h "$SUBLIME_DIRECTORY/Default\ \(Linux\).sublime-keymap" ]; then
	echo "Default (Linux).sublime-keymap symlink already exists"
else
	echo "Removing Default (Linux).sublime-keymap file and creatink symlink"
	rm $SUBLIME_DIRECTORY/Default\ \(Linux\).sublime-keymap
	ln -s $DOT_DIRECTORY/sublime-text-3/Default\ \(Linux\).sublime-keymap $SUBLIME_DIRECTORY/Default\ \(Linux\).sublime-keymap
fi
if [ -f "$SUBLIME_DIRECTORY/Package\ Control.sublime-settings" ]; then
	echo "Package Control.sublime-settings backup already exists"
else
	echo "Creating Package Control.sublime-settings backup file"
	cp $SUBLIME_DIRECTORY/Package\ Control.sublime-settings $BKP_DIRECTORY/
fi
if [ -h "$SUBLIME_DIRECTORY/Package\ Control.sublime-settings" ]; then
	echo "Package Control.sublime-settings symlink already exists"
else
	echo "Removing Package Control.sublime-settings file and creatink symlink"
	rm $SUBLIME_DIRECTORY/Package\ Control.sublime-settings
	ln -s $DOT_DIRECTORY/sublime-text-3/Package\ Control.sublime-settings $SUBLIME_DIRECTORY/Package\ Control.sublime-settings
fi