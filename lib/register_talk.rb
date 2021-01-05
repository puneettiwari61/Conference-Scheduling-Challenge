require_relative './talk_list'
require_relative './create_talk'


class RegisterTalk

    include TalkList

    def initialize
        @updated_list = TALK_LIST
        @track1 = []
        @track2 = []
        register_track_one_before_lunch
        register_track_two_before_lunch
        register_track_one_after_lunch
        register_track_two_after_lunch
        print_talks
    end

    def register_track_one_before_lunch
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, 9)
        available_minutes_before_lunch = 180
        @updated_list.map.with_index do |x,i|
        if i == 0 
            x[:startTime] = startTime
        else
            x[:startTime] = TALK_LIST[i-1][:endTime]
        end 
        x[:endTime] =  x[:startTime] + (x[:duration] * 60)
        available_minutes_before_lunch = available_minutes_before_lunch - x[:duration]
        duration = x[:duration]
        name = x[:name]
        start = x[:startTime]
        break if available_minutes_before_lunch < 0
        talk = CreateTalk.new(name, start, duration)
        @track1 << talk
        @updated_list[i][:registered?] = true
        end

    end

    def register_track_two_before_lunch
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, 9)
        available_minutes_before_lunch = 180

        @updated_list.map.with_index do |x,i|

        if x[:registered?] == false

            available_minutes_before_lunch = available_minutes_before_lunch - x[:duration]

            break if available_minutes_before_lunch < 0
            x[:startTime] = startTime
            x[:endTime] =  x[:startTime] + (x[:duration] * 60)
            startTime = x[:endTime]
            duration = x[:duration]
            name = x[:name]
            start = x[:startTime]
            talk = CreateTalk.new(name, start, duration)
            @track2 << talk
            @updated_list[i][:registered?] = true
        end
    end


    end

    def register_track_one_after_lunch
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, 1)
        available_minutes_after_lunch = 240
        @updated_list.map.with_index do |x,i|
            if x[:registered?] == false

                available_minutes_after_lunch = available_minutes_after_lunch - x[:duration]
                break if available_minutes_after_lunch < 0
                
                x[:startTime] = startTime
                x[:endTime] =  x[:startTime] + (x[:duration] * 60)
                startTime = x[:endTime]
                duration = x[:duration]
                name = x[:name]
                start = x[:startTime]
                talk = CreateTalk.new(name, start, duration)
                @track1 << talk
                @updated_list[i][:registered?] = true
                end
            end

    end

    def register_track_two_after_lunch
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, 1)
        available_minutes_after_lunch = 240


        @updated_list.map.with_index do |x,i|
            if x[:registered?] == false
            available_minutes_after_lunch = available_minutes_after_lunch - x[:duration]
            break if available_minutes_after_lunch < 0
            x[:startTime] = startTime
        x[:endTime] =  x[:startTime] + (x[:duration] * 60)
        startTime = x[:endTime]
        duration = x[:duration]
        name = x[:name]
        start = x[:startTime]
        talk = CreateTalk.new(name, start, duration)
        @track2 << talk
        @updated_list[i][:registered?] = true
        end
    end

    end

    def print_talks
        puts "\nTrack 1"
        @track1.map {|x| x.to_s }
        puts "\nTrack2"
        @track2.each {|x| x.to_s}

    end

end

talk = RegisterTalk.new

