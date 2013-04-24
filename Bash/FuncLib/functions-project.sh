#!/bin/bash

# Gets the latest for all branches on a git project repo [staging, qa, master]...
function get-latest
{
	project_branches=(staging qa master)

	for branch in "${project_branches[@]}"
	do
		git checkout $branch && git pull --rebase
	done
}
alias pgl='get-latest'

function update-rails-proj
{
	git checkout master
	
	bundle install
	echo "Running rake db:migrate..."
	bundle exec rake db:migrate
	echo "Running rake db:seed..."
	bundle exec rake db:seed
	echo "Running rake db:test:prepare..."
	bundle exec rake db:test:prepare
	echo "Running rake deployment:run_deploy_tasks..."
	bundle exec rake deploment:run_deploy_tasks
}
alias pup='update-rails-proj'
