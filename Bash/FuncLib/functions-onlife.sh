function get-latest-all
{
	projects[0]='~/Source Code/Onlife/assessment_service'
	projects[1]='~/Source Code/Onlife/content_service'
	projects[2]='~/Source Code/Onlife/entity_service'
	projects[3]='~/Source Code/Onlife/liveon'
	projects[4]='~/Source Code/Onlife/on_demand'
	projects[5]='~/Source Code/Onlife/platform_configuration'
	projects[6]='~/Source Code/Onlife/reporting_service'
	
	for project in "${projects[@]}"
	do
		git-get-latest $project
		bundle install
		be rake db:migrate
		be rake db:seed
		be rake db:test:prepare
		be rake deploment:run_deploy_tasks
	done
}


function config-svc-run {
	cd ~/SourceCode/Onlife/platform_configuration
	
	rails server -p 3001 -d
}

function entity-svc-run {
	cd ~/SourceCode/Onlife/entity_service
	
	rails server -p 3002 -d
}

function assessment-svc-run {
	cd ~/SourceCode/Onlife/assessment_service

	rails server -p 3003 -d
}

function run-liveon-dependencies {
	# config-svc-run
	entity-svc-run
	assessment-svc-run
}

function kill-liveon-dependencies {
	# cd ~/SourceCode/Onlife/platform_configuration	
	# kill -INT $(cat tmp/pids/server.pid)
	
	cd ~/SourceCode/Onlife/entity_service
	kill -INT $(cat tmp/pids/server.pid)
	
	cd ~/SourceCode/Onlife/assessment_service
	kill -INT $(cat tmp/pids/server.pid)
}