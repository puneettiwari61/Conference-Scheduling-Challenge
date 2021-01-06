require_relative './talk_list'
require_relative './session'


class RegisterTalk

    include TalkList

    def initialize
        @talk_list = TALK_LIST
        @track1 = []
        @track2 = []
    end

    def register_talk_sessions

        register_track_one_morning_session
        register_track_two_morning_session
        register_track_one_afternoon_session
        register_track_two_afternoon_session

    end


    def register_track_one_morning_session
    
        session = Session.new(@track1, @talk_list, "morning")
        @track1, @talk_list = session.create_track_and_update_list

    end

    def register_track_two_morning_session

        session = Session.new(@track2, @talk_list, "morning")
        @track2, @talk_list = session.create_track_and_update_list

    end

    def register_track_one_afternoon_session

        session = Session.new(@track1, @talk_list, "afternoon")
        @track1, @talk_list = session.create_track_and_update_list

    end

    def register_track_two_afternoon_session

        session = Session.new(@track2, @talk_list, "afternoon")
        @track2, @talk_list = session.create_track_and_update_list

    end

    def print_schedule
        puts "\nTrack 1"
        @track1.map {|x| x.to_s }
        puts "\nTrack2"
        @track2.each {|x| x.to_s}
    end

end




