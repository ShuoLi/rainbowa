namespace :db do
  desc "Fill db with sampel timeline"
  task :populate => :environment do
    10.times do
      organization = Faker::Name.name
      description = Faker::Lorem.paragraphs(5)
      @timeline = Timeline.create!(:subject => organization, 
                                  :description => description
                                  )
      10.times do
        desc = Faker::Lorem.paragraphs(5)
        @timeline.events.create!(:group_id => rand(10),
                                  :time => Time.now - rand(10).years,
                                  :description => desc)
      end
    end
  end
end
