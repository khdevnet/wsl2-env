# RegisterWSLDockerAlias.ps1

$doskeyMacro = "doskey docker=wsl -e docker `$*"
$regKeyPath = "HKCU:\Software\Microsoft\Command Processor"
$regValueName = "AutoRun"

# Get existing AutoRun value
$existingValue = Get-ItemProperty -Path $regKeyPath -Name $regValueName -ErrorAction SilentlyContinue

if ($existingValue) {
    $existingValueData = $existingValue.$regValueName
    if (-not $existingValueData.Contains($doskeyMacro)) {
        # Append the doskey macro if it's not in the existing value
        $newValueData = "$existingValueData & $doskeyMacro"
        Set-ItemProperty -Path $regKeyPath -Name $regValueName -Value $newValueData
    }
} else {
    # Create the AutoRun value with the doskey macro
    New-ItemProperty -Path $regKeyPath -Name $regValueName -Value $doskeyMacro -PropertyType String
}

Write-Host "WSL Docker alias has been registered globally for CMD."
