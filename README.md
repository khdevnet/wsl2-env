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
git clone https://github.com/khdevnet/httpvsgrpc.git
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
wsl --setdefault u2204c
```

Test prots connection beetween WSL and windows
```

sudo lsof -i -P -n | grep LISTEN # wsl ports
netstat -ano | findstr 1433 # windows ports
```

Set default user to WSL distro
```
sudo chmod 777 /etc/wsl.conf && echo "[user]" >> /etc/wsl.conf && echo "default=USER_NAME" >> /etc/wsl.conf
```

## Create wsl docker alias
To create a WSL Docker alias in PowerShell, you can add a custom function in your PowerShell profile. Follow these steps:
1 Open your PowerShell profile file or create one if it doesn't exist. You can use the following command to open the profile file in the default text editor:
powershell
Copy code
```
if (!(Test-Path -Path $PROFILE)) { New-Item -Type File -Path $PROFILE -Force }
notepad.exe $PROFILE
```
2 Add the following function to the profile file, Save and close the profile file.:

```
function docker {
    param (
        [Parameter(ValueFromRemainingArguments = $true)]
        $args
    )
    $wslDist = "Ubuntu" # Replace with your WSL distribution name
    $dockerCommand = "docker"
    wsl -d $wslDist -e $dockerCommand $args
}
```


Restart PowerShell and Remote Sign new powershell script:
```
Set-ExecutionPolicy RemoteSigned
```

## Dotnet instalation
https://github.com/dotnet/sdk/issues/27082      
install dotnet on ubuntu 22.04 https://github.com/dotnet/core/issues/7699
```
Install specific version of dotnet
sudo apt list --all-versions dotnet-sdk-6.0
sudo apt install dotnet-sdk-6.0=6.0.107-1
```


## Mount network drive
```
sudo mkdir /mnt/wslinstall && sudo mount -t drvfs '\\zdevfs2\zdevfs_public\Scripts\wsl2' /mnt/wslinstall 
```

Install wsl2 Windows 11 [Link](https://learn.microsoft.com/en-us/windows/wsl/install) 
https://www.paulsblog.dev/how-to-install-docker-without-docker-desktop-on-windows/
