require_relative './create_talk'


class Session 

    def initialize(track, talk_list, session)
        @track = track
        @talk_list = talk_list
        @available_minutes = session == "morning" ? 180 : 240
        @start_time = session == "morning" ? 9 : 13

    end

    def create_track
           day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, @start_time)
        available_minutes = @available_minutes
        @talk_list.map.with_index do |x,i|
            if x[:registered?] == false

                available_minutes = available_minutes - x[:duration]
                break if available_minutes < 0
                
                x[:startTime] = startTime
                x[:endTime] =  x[:startTime] + (x[:duration] * 60)
                startTime = x[:endTime]
                duration = x[:duration]
                name = x[:name]
                start = x[:startTime]
                talk = CreateTalk.new(name, start, duration)
                @track << talk
                @talk_list[i][:registered?] = true
                end
            end

    [@track, @talk_list]

    end


end