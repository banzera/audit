web:     bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
# worker:  bundle exec rake scheduler:kickoff
release: bundle exec rake db:migrate
