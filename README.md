= yadm managed dotfiles

* Install zsh and set as default shell
* Install socat
* Download wsl2-ssh-pageant.exe to ~/.ssh


== Install yadm

```
curl -fLo ~/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x ~/.local/bin/yadm
```

=== Initialize
yadm clone git@github.com:ndt/dotfiles.git

=== Update

yadm stash
yadm pull
yadm stash apply
