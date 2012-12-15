$mongoBinaries	= "C:\Program Files\MongoDB\bin"
$mongoStorage	= "S:\MongoDB_Data"

Function Mongo-Install-Service()
{
	$logPath 	= $mongoStorage + "\mongo.log"
	$dataPath 	= $mongoStorage + "\data"

	cd $mongoBinaries
	
	.\mongod --logpath $logPath --logappend --dbpath $dataPath --directoryperdb --install --serviceName MongoDB --serviceUser keith_beckman
	
	net start MongoDB
}

Function Mongo-Remove-Service()
{
	cd $mongoBinaries

	.\mongod --remove
}

Function Mongo-Shell()
{
	cd $mongoBinaries
	
	.\mongo
}
