### Home docker - your home in a Docker container

#### Build
```sh.
/build
```

#### Run
Run `bash` in the docker with the `home` directory mounted:
```sh
./run
```
Modifications in the `home` directory are persistent.

Install an run what you want in the home directory.  
Add extra directory to mount with the `EXTRA_MOUNT` variable.
