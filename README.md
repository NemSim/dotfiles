# dotfiles

@nemsim

## setup
```
git clone https://github.com/NemSim/dotfiles
cd dotfiles
bash bootstrap/init.sh
```

## vagrant setup
if you don't want to take any risks even though it backs up your existing dotfiles

```
git clone https://github.com/NemSim/dotfiles
cd dotfiles/vagrant
vagrant up
vagrant ssh
cd dotfiles
bash bootstrap/init.sh
```
