# Aseprite listener

Listen changes on .ase/.aseprite files in specific folder and export .png and .json to a target folder

## Getting started

### Installing

Download aseprite_listener or clone:
```
git clone git://stephanngamedev@github.com/aseprite_listener
```

Go to aseprite_listener's folder and install dependencies:
```
cd /path/to/aseprite_listener

bundle install
```

### Using
Starting listener:
```
ruby aseprite_listener.rb \
  -a /path/to/aseprite executable \
  -p /path/you/want/listen \
  -t /target/folder/to/png \
  -d /target/folder/to/json \
  -s 4 \
  -i 1
```

### Options
#### `-a` or `--aseprite` | String | Required
Aseprite executable path.

If you installed Aseprite on Ubuntu via Steam:

`~/.local/share/Steam/steamapps/common/Aseprite/aseprite`

If you installed Aseprite on MacOS via Steam:

```~/Library/Application\ Support/Steam/steamapps/common/Aseprite/Aseprite.app/Contents/MacOS/aseprite```



#### `-p` or `--path` | String | Required
Path to listen

#### `-t` or `--target` | String | Required
Sprite sheet (.png) folder target

#### `-d` or `--data` | String | Required
JSON data folder target

#### `s` or `--scale` | Integer | Default: 1
Scale factor

#### `i` or `--inner-padding` | Integer | Default: 0
Add padding inside each frame

#### `-o` or `--only` | String | Default: `\.ase$`
Listen to a specific type of file
