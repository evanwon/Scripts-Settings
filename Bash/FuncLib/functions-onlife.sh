#!/bin/bash

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