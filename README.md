My personalized Emacs config, largely stolen from various people.

This README contains my own notes for settings/configurations that
can't be put into Emacs Lisp.

### Installing Emacs on Mac OS X

```
brew install emacs --HEAD --use-git-head --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-d-bus --with-mailutils
```

http://emacs.stackexchange.com/questions/271/what-is-the-difference-between-aquamacs-and-other-mac-versions-of-emacs

### Using Command as Meta in iTerm Emacs

* Install cmd-key-happy: https://github.com/frobware/cmd-key-happy
* Under "Keys", set option keys to command, set command keys to option.
* Under "Profiles -> Keys", set option keys to act as "+Esc".
* Under "Preferences", check "Allow clipboard access to terminal apps"

Note: this change makes the option key work as command for iTerm,
i.e., quitting is ⌥Q and opening a new tab is ⌥T, but the the keyboard
shortcuts in the menu bar will still show ⌘.

### Use Windows "menu" key as a modifier key

In Mac OS X Emacs, the Menu key seems to defaul to `C-p`. To use it as `Hyper`:

* Install [Karabiner](https://pqrs.org/osx/karabiner/)
* Configure: Change Key > For PC Users > Change PC Application Key
  (Menu Key) > Application Key to Fn (check this checkbox)
* `(setq ns-function-modifier 'hyper)`

### Dependencies for Emacs Packages

#### Elpy

```
pip install rope jedi flake8 importmagic autopep8 yapf nose
```
