### Deploy App to Heroku

1. Create account at heroku.com
2. Install Heroku Command Line Interface https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli
3. Make sure all files are in a Git repository
4. Remove all calls to binding.pry in all files
5. Update reloader for development only: `require "sinatra/reloader" if development?`
6. Specify Ruby version in Gemfile
7. remove WEBrick and add `group :production do gem "puma" end` to Gemfile
8. rerun `bundle install`
9. in root folder: config.ru containing `require "./book_viewer" run Sinatra::Application`
10. in root folder: Procfile containing: `web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}`
11. Test locally before deployment: TERM: `heroku local` or `heroku local -p 5555` or use some other unused port.
12. Check at localhost:5000 (or assigned port, check TERM output for listening port)
13. Create Heroku app: Term: `heroku create $NAME`
14. If on MAC: update Gemfile: Term: `bundle lock --add-platform x86_64-linux`
15. Push project: Term: `git push heroku main`
16. Verify app is running: click "open app" in the top right corner of the heroku app page.
17. To shut down app:
	1. `heroku ps:scale web=0 (must be done for each service in Procfile)
	2. Enable maintenance mode under app settings
18. To restart app:
	1. `heroku ps:scale web=1`
