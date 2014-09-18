require 'cuba'
require 'cuba/render'
require 'cuba/mote'
require 'tilt/mote'

require 'json'

Cuba.use Rack::Static, urls: ['/media']

Cuba.plugin Cuba::Render
Cuba.plugin MoteHelper

Cuba.define do
  on root do
    render('home', app: self, jobs: jobs)
  end
end

def jobs
  JSON.parse(jobs_file)
end

def jobs_file
  File.open('data/jobs.json').read
end
