[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $HostName,
    [Parameter(Mandatory=$true)]
    [string]
    $CertificatePassword,
    [Parameter(Mandatory=$true)]
    [string]
    $KeyvaultName,
    [Parameter(Mandatory=$true)]
    [string]
    $SecretName
)

Write-Host "Generate self-signed certificate"
$todaydt = Get-Date
$3years = $todaydt.AddYears(3)
$result = New-SelfSignedCertificate -dnsname $HostName -notafter $3years -CertStoreLocation cert:\LocalMachine\My

Write-Host "Export generated certificate to file"
$certPassword = ConvertTo-SecureString -String "$($CertificatePassword)" -Force -AsPlainText
$pfxFilePath = "$($PSScriptRoot)\$($HostName).pfx"
Export-PfxCertificate -Cert "cert:\LocalMachine\My\$($result.Thumbprint)" -FilePath $pfxFilePath -Password $certPassword

Write-Host "Uploading cert to key vault"
$flag = [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]::Exportable
$collection = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection
$collection.Import($pfxFilePath, $CertificatePassword, $flag)
$pkcs12ContentType = [System.Security.Cryptography.X509Certificates.X509ContentType]::Pkcs12
$clearBytes = $collection.Export($pkcs12ContentType)
$fileContentEncoded = [System.Convert]::ToBase64String($clearBytes)
$secret = ConvertTo-SecureString -String $fileContentEncoded -AsPlainText -Force
$secretContentType = 'application/x-pkcs12'
Set-AzKeyVaultSecret -VaultName $KeyvaultName -Name $SecretName -SecretValue $secret -ContentType $secretContentType # Change Key Vault name and Secret name

Write-Host "Grant AzureAppService resource provider access to keyvault"
Set-AzKeyVaultAccessPolicy -VaultName $KeyvaultName -ServicePrincipalName "abfa0a7c-a6b6-4736-8310-5855508787cd" -PermissionsToSecrets get

Write-Host "Done."