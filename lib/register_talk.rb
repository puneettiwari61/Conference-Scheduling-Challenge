require_relative './talk_list'
require_relative './create_talk'
require_relative './create_morning_session'
require_relative './create_afternoon_session'


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

    session = CreateMorningSession.new(@track1, @updated_list)

    @track1, @updated_list = session.create_track

    end

    def register_track_two_before_lunch

    session = CreateMorningSession.new(@track2, @updated_list)

    @track2, @updated_list = session.create_track

    end

    def register_track_one_after_lunch

        session = CreateAfternoonSession.new(@track1, @updated_list)

        @track1, @updated_list = session.create_track

    end

    def register_track_two_after_lunch
    session = CreateAfternoonSession.new(@track2, @updated_list)

    @track2, @updated_list = session.create_track

    end

    def print_talks
        puts "\nTrack 1"
        @track1.map {|x| x.to_s }
        puts "\nTrack2"
        @track2.each {|x| x.to_s}

    end

end

talk = RegisterTalk.new

