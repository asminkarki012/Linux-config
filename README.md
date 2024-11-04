# Linux-config

### Intial Setup for ansible playbook run in terminal

```
sudo apt install ansible
```

#### run check first

```
sudo ansible-playground ubuntu-playbook.yml --check
```

#### execute ansible playbook make sure to run on

```
sudo ansible-playground ubuntu-playbook.yml
```

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

```

```
