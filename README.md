# Linux-config

### NERD font for lazyvim
```
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
```

### NVIM dependency LUA ROCK 
```
dnf: sudo dnf install compat-lua-devel-5.1.5
```
