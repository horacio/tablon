require 'cuba'
require 'mote'
require 'mote/render'

Cuba.use Rack::Static, urls: ['/media']

Cuba.plugin(Mote::Render)

Cuba.define do
  on root do
    render('home', jobs: fake_jobs)
  end
end

def fake_jobs
  5.times.map do
    Struct.new(:title, :company, :description, :posted_on, :email)
      .new("Software Engineer - Bathroom Naps",
           "Intel",
           "Some of the brightest minds of our generation...",
           "2014-09-12 18:45:07",
           "jobs+argentina@intel.com")
  end
end
