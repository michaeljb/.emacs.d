My personalized Emacs config, largely stolen from various people.

This README contains my own notes for settings/configurations that
can't be put into Emacs Lisp.

### Installing Emacs on Mac OS X

```
./install_emacs_macos.sh
```

### Using Command as Meta in iTerm Emacs

* Install cmd-key-happy: https://github.com/frobware/cmd-key-happy
* Under "Keys", set option keys to command, set command keys to option.
* Under "Profiles -> Keys", set option keys to act as "+Esc".
* Under "Preferences", check "Allow clipboard access to terminal apps"

Note: this change makes the option key work as command for iTerm,
i.e., quitting is ⌥Q and opening a new tab is ⌥T, but the the keyboard
shortcuts in the menu bar will still show ⌘.

### Use Windows "menu" key as a modifier key

In Mac OS X Emacs, the Menu key seems to default to `C-p`. To use it as `Hyper`:

* Install [Karabiner](https://pqrs.org/osx/karabiner/)
* Configure: Change Key > For PC Users > Change PC Application Key
  (Menu Key) > Application Key to Fn (check this checkbox)
* `(setq ns-function-modifier 'hyper)`

### Dependencies for Emacs Packages

#### ag.el

If not already installed, Ag is installed on automatically startup on Mac OS X
(provided `brew` is available) or on Ubuntu/Debian (provided `apt-get` is
available), using these commands:

Mac OS X:

```
brew install the_silver_searcher
```

Ubuntu/Debian:

```
apt-get install -y silversearcher-ag
```

#### Elpy

```
pip install rope jedi flake8 importmagic autopep8 yapf nose
```
