# Configure Wsl2 development environment
1. Install Wsl2 > Open powershell and enter command 
```powershell
wsl --install
```
2. Install Ubuntu Distro
```
wsl --install Ubuntu-22.04
```
3. Install git on ubuntu
Open powershell and wsl Distro shell
```
wsl
```
In wsl command line enter commands
```
curl -s https://raw.githubusercontent.com/khdevnet/wsl2-env/main/install-git.sh | sh /dev/stdin
```
4. Load scripts to install docker on wsl
```
cd ~
mkdir -p projects
cd ~/projects
git clone https://github.com/khdevnet/wsl2-env.git
cd ~/projects/scripts

```


# Other
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
wsl --export <distroname> .\images\<distroname>.tar
wsl --import <newDistroName> .\instances\<newDistroName> .\images\<distroname>.tar
wsl --set-default <newDistroName>
```



Install wsl2 Windows 11 [Link](https://learn.microsoft.com/en-us/windows/wsl/install) 
https://www.paulsblog.dev/how-to-install-docker-without-docker-desktop-on-windows/
