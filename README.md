### Configure Wsl2 development environment
1. Open powershell and enter command to install wsl2
```powershell
wsl --install
```
2. Install Ubuntu Distro
```
wsl --install Ubuntu-22.04
```
3. Install git on ubuntu
Open powershell and run wsl Distro shell
```
wsl
```
In wsl command line enter commands
```sh
curl -s https://raw.githubusercontent.com/khdevnet/wsl2-env/main/install-git.sh | sh /dev/stdin
```
4. Install docker 
```sh
curl -s https://raw.githubusercontent.com/khdevnet/wsl2-env/main/install-docker.sh | sh
```
5. Restart wsl ubuntu distro
```sh
wsl --shutdown
```

6. Run wsl shell in powershell and load project
```
cd ~
mkdir -p projects
cd ~/projects
git clone [https://github.com/khdevnet/wsl2-env.git](https://github.com/khdevnet/httpvsgrpc.git)
cd ~/projects/httpvsgrpc
```


# Wsl helpers
Remove registered instance
```
wsl --unregister u2204
```

Run distribution
```
wsl -d ut -u ant
```

Export installed distro to folder
```
wsl -l -v # Verify distro name to export
wsl --export <distroname> c:/wsl/images/ubuntu2204.tar
wsl --import <newDistroName> c:/wsl/instances/ubuntu2204 c:/wsl/images/ubuntu2204.tar
wsl --set-default <newDistroName>
```



Install wsl2 Windows 11 [Link](https://learn.microsoft.com/en-us/windows/wsl/install) 
https://www.paulsblog.dev/how-to-install-docker-without-docker-desktop-on-windows/
