
# Setup process and initial configuration for OpenSSL...
function OpenSSL-Setup() {
	$dir 	= Join-Path $HOME "\OpenSSL"
	$caDir 	= Join-Path $dir "\myCA"
	
	# Setup directory structure and required files...
	mkdir (Join-Path $caDir "\Certificate\private")
	mkdir (Join-Path $caDir "\Reuests")
	mkdir (Join-Path $caDir "\Signed")
	mkdir (Join-Path $dir "\Self-Signed")

	New-Item $caDir\serial -type file -value "01"
	New-Item $caDir\index -type file
	#echo '01' > $HOME/OpenSSL/myCA/serial && touch $HOME/OpenSSL/myCA/index
  
	## Create local Certificate Authority ##
	cp $sysGitHub/Scripts-Settings/PowerShell/FuncLib/caconfig.cnf $HOME/OpenSSL/myCA/
	$config = Join-Path $caDir caconfig.cnf
	# Create the Root CA certificate...
	openssl req -config $config -x509 -newkey rsa:4096 -out $caDir\cacert.pem -outform PEM -days 1825
	# Strip all certificate metadata leaving only the CERTIFICATE section...
	openssl x509 -in $caDir\cacert.pem -out $caDir\cacert.crt
}


#  Generate RSA key...
#  openssl genrsa -aes256 -out requests/keys/Stub.IdSrv.Signing.pem 2048


#  Create a certificate from IIS request file, and sign it using CA certificate...
#  openssl ca -policy open_policy -days 365 -cert myCA/cacert.pem -keyfile myCA/private/cakey.pem -in requests/Stub.IdSrv.Signing_req.txt -out signed_certs/Stub.IdSrv.Signing.crt
#  openssl x509 -in signed_certs/Stub.IdSrv.Signing.crt -out signed_certs/Stub.IdSrv.Signing.cer


# Create a self-signed certificate...
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out ~/OpenSSL/signed_certs/Stub.IdSrv.Signing-SS.crt -keyout ~/OpenSSL/signed_certs/mykey.pem
# openssl x509 -in ~/OpenSSL/signed_certs/Stub.IdSrv.Signing-SS.crt -out ~/OpenSSL/signed_certs/Stub.IdSrv.Signing-SS.cer -outform DER
# openssl pkcs12 -in ~/OpenSSL/Self-Signed/Stub.IdSrv.Signing-SS.crt -inkey ~/OpenSSL/Self-Signed/Stub.IdSrv.Signing-SS.key -out ~/OpenSSL/Self-Signed/Stub.IdSrv.Signing-SS.p12 -nodes



#openssl req -x509 -newkey rsa:2048 -out ~/OpenSSL/Self-Signed/cacert.pem -outform PEM -days 1825
  # Strip all certificate metadata leaving only the CERTIFICATE section...
 # openssl x509 -in ~/OpenSSL/myCA/cacert.pem -out ~/OpenSSL/myCA/cacert.crt