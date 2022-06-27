Notes on how to do things in certain programs (so I don't forget).


ModelSim
========

* Recompile and run current thing:  assumes "work" is the name of the library
  `vlog -work work /path/to/top.sv; restart -f; run 10us`
* Don't forget to move import keymap file.



GTKWave
=======

* ./configure --enable-judy --with-gsettings --enable-struct-pack

Lots of dependencies:

    sudo apt install libgconf2-dev libgtk2.0-dev gtk+2.0 liblzma-dev \
        libjudy-dev libbz2-dev gperf tk-dev tcl-dev libglib2.0-dev


nodejs
======

Nodejs needs to be installed so that Vim plug stuff works

```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

Colors
======

git clone https://github.com/Gogh-Co/Gogh
sudo apt install dconf-cli uuid-runtime

Use frontend delight scheme, change third color to `#52A500`
