class CreateTalk

    def initialize (name, startTime, duration)
        @name = name
        @startTime = startTime
        @duration = duration
    end

    def to_s
        puts "#{@startTime.strftime("%I:%M %p")} #{@name} #{@duration} min"
    end

end