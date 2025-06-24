# Liquid Glass Ulauncher

A theme for Ulauncher based on macOS Tahoe Liquid Glass theme.

## Screenshot

<div>
  <img src="static/liquid-glass-light.png" alt="Light Screenshot" width="45%"/>
  <img src="static/liquid-glass-dark.png" alt="Dark Screenshot" width="45%"/>
</div>

## Installation

To install this theme, just copy paste the command below in your terminal:

```sh
mkdir -p ~/.config/ulauncher/user-themes
git clone https://github.com/kayozxo/ulauncher-liquid-glass.git \
  ~/.config/ulauncher/user-themes/liquid-glass
```

## How to achieve blur - **GNOME ONLY**

- To achieve true liquid glass finish, you need some amount of blur for the launcher.
- But GTK doesn't support any blur filter through CSS.
- Install [Blur My Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)
- Apply the settings as follows:

![Blur My Shell settings](static/settings.png)
