cat global | sed '/MODULES_HERE/{
s/.*//g
r Omen
}' > config
