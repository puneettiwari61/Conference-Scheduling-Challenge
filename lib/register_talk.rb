require_relative './talk_list'


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
        # puts "\n#{@track1}"
        # puts "\n#{@track2}"
        print_talks
    end

    def register_track_one_before_lunch
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, 9)
        available_minutes_before_lunch = 180
        # puts @updated_list
        @updated_list.map.with_index do |x,i|
        if i == 0 
            x[:startTime] = startTime
        else
            x[:startTime] = TALK_LIST[i-1][:endTime]
        end 
        x[:endTime] =  x[:startTime] + (x[:duration] * 60)
        available_minutes_before_lunch = available_minutes_before_lunch - x[:duration]
        break if available_minutes_before_lunch < 0
        # puts available_minutes_before_lunch
        @track1 << x 
        @updated_list[i][:registered?] = true
        # print TALK_LIST
        end
        # @track1.map {|x| puts x}
        # puts @updated_list
    end

    def register_track_two_before_lunch
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, 9)
        available_minutes_before_lunch = 180
        # unregistered_list = @updated_list.reject {|x|  x[:registered?] || x[:duration] == 5}
        # puts unregistered_list
        @updated_list.map.with_index do |x,i|
            # puts x
            # next if x[:duration] == 5
            # puts "hello #{i}"
        if x[:registered?] == false
            # if i == 0 
            # else
            # x[:startTime] = @updated_list[i-1][:endTime]
            # end 
            available_minutes_before_lunch = available_minutes_before_lunch - x[:duration]
            break if available_minutes_before_lunch < 0
            x[:startTime] = startTime
            x[:endTime] =  x[:startTime] + (x[:duration] * 60)
            startTime = x[:endTime]
            # puts available_minutes_before_lunch
            @track2 << x 
            @updated_list[i][:registered?] = true
            # print @track2 
        end
    end
    # @track2.map {|x| puts x}   
    # puts @updated_list

    end

    def register_track_one_after_lunch
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, 1)
        available_minutes_after_lunch = 240
        # puts @updated_list
        @updated_list.map.with_index do |x,i|
            if x[:registered?] == false

                available_minutes_after_lunch = available_minutes_after_lunch - x[:duration]
                break if available_minutes_after_lunch < 0

                x[:startTime] = startTime
                x[:endTime] =  x[:startTime] + (x[:duration] * 60)
                startTime = x[:endTime]

                # puts available_minutes_after_lunch
                @track1 << x 
                @updated_list[i][:registered?] = true
                # print TALK_LIST
                end
            end
        # @track1.map {|x| puts x}
        # puts @updated_list
    end

    def register_track_two_after_lunch
        day, month, year = Time.now.day, Time.now.month, Time.now.year
        startTime = Time.local(year, month, day, 1)
        available_minutes_after_lunch = 240
        # unregistered_list = @updated_list.reject {|x|  x[:registered?] || x[:duration] == 5}
        # puts unregistered_list

        @updated_list.map.with_index do |x,i|
            if x[:registered?] == false
            # puts x
            # next if x[:duration] == 5
            # puts "hello #{i}"
            available_minutes_after_lunch = available_minutes_after_lunch - x[:duration]
            break if available_minutes_after_lunch < 0
            x[:startTime] = startTime
        x[:endTime] =  x[:startTime] + (x[:duration] * 60)
        startTime = x[:endTime]
        # puts available_minutes_before_lunch
        @track2 << x 
        # print @track1
        @updated_list[i][:registered?] = true
        end
    end
        # @track2.map {|x| puts x}   
        # puts @updated_list
    end

    def print_talks
        puts "\nTrack 1"
        @track1.map {|x| puts "#{x[:endTime].strftime("%I:%M %p")} #{x[:name]} #{x[:duration]} min"}
        puts "\nTrack2"
        @track2.each {|x| puts "#{x[:endTime].strftime("%I:%M %p")} #{x[:name]} #{x[:duration]} min"}

    end

end

talk = RegisterTalk.new

