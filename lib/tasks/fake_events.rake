namespace :requester do
  desc "Create some fake events"
  task :fake_events => :environment do
    abbrs = Site.all.map(&:abbr)
    titles = File.new(Rails.root + "lib/faker/lit").map(&:chomp)
    names = File.new(Rails.root + "lib/faker/names").map(&:chomp)
    areas = ['MPR', 'Room 10', 'Room 15', 'Playground', 'Ballfield', 'Outdoor Stage', 'Lunch Tables']
    states = ['pending', 'approved', 'denied']
    
    100.times do
      r_name = names[rand(names.count)]
      start_time = Time.now + rand(100).days
      e = Event.create(
        :requester => r_name,
        :requester_email => r_name + "@example.com",
        :title => titles[rand(titles.count)],
        :start_time => start_time,
        :end_time => start_time + rand(8).hours,
        :site => Site.find_by_abbr( abbrs[rand(abbrs.count)] ),
        :area => areas[0..rand(areas.count)].join(', '),
        :state => states[rand(states.count)]        
        )
      e.errors.each do |err|
        puts err
      end
    end
    
  end
  
  task :clear_events => :environment do
    Event.delete_all
  end
end

