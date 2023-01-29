# Notice! You need to run the following command first
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process -Force

# Setup WinRM service
Set-Service -Name "WinRM" -StartupType Automatic
Start-Service -Name "WinRM"

if (-not (Get-PSSessionConfiguration) -or (-not (Get-ChildItem WSMan:\localhost\Listener))) {
    ## Use SkipNetworkProfileCheck to make available even on Windows Firewall public profiles
    ## Use Force to not be prompted if we're sure or not.
    Enable-PSRemoting -SkipNetworkProfileCheck -Force
}

# Create Ansible user and add to windows Administrators group 
$ansibleUserAccountName = 'ansible'
$ansibleUserAccountPassword = (ConvertTo-SecureString -String 'password' -AsPlainText -Force)
if (-not (Get-LocalUser -Name $ansibleUserAccountName -ErrorAction Ignore)) {
    $newUserParams = @{
        Name                 = $ansibleUserAccountName
        AccountNeverExpires  = $true
        PasswordNeverExpires = $true
        Password             = $ansibleUserAccountPassword
        Description          = "Ansible User"
    }
    $null = New-LocalUser @newUserParams
    $null = Add-LocalGroupMember -Group "Administrators" -Member $ansibleUserAccountName
}


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file
