# Linux-config

### Intial Setup for ansible playbook run in terminal

```
# ubuntu
sudo apt install ansible
# fedora
sudo dnf install ansible
```

#### run check first

```
sudo ansible-playground ubuntu-ansible-playbook.yml --check
```

#### execute ansible playbook

```
sudo ansible-playground ubuntu-ansible-playbook.yml
```

### NERD font for lazyvim

```
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
```

