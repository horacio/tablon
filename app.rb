require 'cuba'
require 'mote'
require 'mote/render'

require 'json'

Cuba.use Rack::Static, urls: ['/media']

Cuba.plugin(Mote::Render)

Cuba.define do
  on root do
    render('home', jobs: jobs)
  end
end

def jobs
  JSON.parse(jobs_file)
end

def jobs_file
  File.open('data/jobs.json').read
end
