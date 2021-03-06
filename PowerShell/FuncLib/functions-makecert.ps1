###----------------MakeCert Options----------------###
# -sk  <keyName>      Subject's key container name; To be created if not present
# -pe                 Mark generated private key as exportable
# -ss  <store>        Subject's certificate store name that stores the output certificate
# -sr  <location>     Subject's certificate store location. <CurrentUser|LocalMachine>.  Default to 'CurrentUser'
# -    <number>       Serial Number from 1 to 2^31-1.  Default to be unique
# -$   <authority>    The signing authority of the certificate <individual|commercial>
# -n   <X509name>     Certificate subject X500 name (eg: CN=Fred Dews)
# -tbs <file>         Certificate or CRL file to be signed
# -sc  <file>         Subject's certificate file
# -sv  <pvkFile>      Subject's PVK file; To be created if not present
# -ic  <file>         Issuer's certificate file
# -ik  <keyName>      Issuer's key container name
# -iv  <pvkFile>      Issuer's PVK file
# -is  <store>        Issuer's certificate store name.
# -ir  <location>     Issuer's certificate store location <CurrentUser|LocalMachine>.  Default to 'CurrentUser'
# -in  <name>         Issuer's certificate common name.(eg: Fred Dews)
# -a   <algorithm>    The signature algorithm <md5|sha1|sha256|sha384|sha512>.  Default to 'sha1'
# -ip  <provider>     Issuer's CryptoAPI provider's name
# -iy  <type>         Issuer's CryptoAPI provider's type
# -sp  <provider>     Subject's CryptoAPI provider's name
# -sy  <type>         Subject's CryptoAPI provider's type
# -iky <keytype>      Issuer key type <signature|exchange|<integer>>.
# -sky <keytype>      Subject key type <signature|exchange|<integer>>.
# -l   <link>         Link to the policy information (such as a URL)
# -cy  <certType>     Certificate types <end|authority>
# -b   <mm/dd/yyyy>   Start of the validity period; default to now.
# -m   <number>       The number of months for the cert validity period
# -e   <mm/dd/yyyy>   End of validity period; defaults to 2039
# -h   <number>       Max height of the tree below this cert
# -len <number>       Generated Key Length (Bits)
# -r                  Create a self signed certificate
# -nscp               Include Netscape client auth extension	
# -crl                Generate a CRL instead of a certificate
# -eku <oid[<,oid>]>  Comma separated enhanced key usage OIDs

function MakeCert-AzureACS([string]$acsNamespace = $(throw "$acsNamespace parameter is required."), $yearsToExpiration = 1) {
	$commonName = "$($acsNamespace).accesscontrol.windows.net"

	MakeCert-SelfSigned $commonName $yearsToExpiration
}

function MakeCert-SelfSigned([string]$commonName = $(throw "$commonName parameter is required."), $yearsToExpiration = 1) {
	$expiration = Get-Date
	$expiration = $expiration.AddYears($yearsToExpiration).ToString("MM/dd/yyyy")
	$certFile	= "$($commonName).crt"
	$certPath 	= Join-Path $HOME $certFile
		
	MakeCert -r -pe -sr "LocalMachine" -n "CN=$($commonName)" -sky exchange -ss my -len 2048 -e $expiration $certPath
	
	Write-Output "Expiration Date: $($expiration)"
	Write-Output "Certificate File: $($certPath)"
}		

