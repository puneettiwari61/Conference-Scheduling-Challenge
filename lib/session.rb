require_relative './talk'


class Session 

    def initialize(track, talk_list, session)
        @track = track
        @talk_list = talk_list
        @available_minutes = get_available_minutes(session)
        @start_time = get_start_time(session)

    end

    def create_track_and_update_list
        @talk_list.map.with_index do |talk,i|
            if talk[:registered?] == false
                @available_minutes = @available_minutes - talk[:duration]
                break if @available_minutes < 0
                talk[:startTime] = @start_time
                talk[:endTime] =  talk[:startTime] + (talk[:duration] * 60)
                @start_time = talk[:endTime]
                new_talk = Talk.new(talk)
                @track << new_talk
                @talk_list[i][:registered?] = true
                end
            end

    [@track, @talk_list]

    end

    def get_start_time(session) 
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        start_hour = session == "morning" ? 9 : 13
        Time.local(year, month, day, start_hour)
    end

    def get_available_minutes(session)
        session == "morning" ? 180 : 240
    end

end