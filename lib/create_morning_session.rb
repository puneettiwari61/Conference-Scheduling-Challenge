class CreateMorningSession

    def initialize(track, talk_list)
        @track = track
        @talk_list = talk_list
    end

    def create_track
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, 9)
        available_minutes_before_lunch = 180
        @talk_list.map.with_index do |x,i|

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
        @track << talk
        @talk_list[i][:registered?] = true

        end
    end

    [@track, @talk_list]

    end

end