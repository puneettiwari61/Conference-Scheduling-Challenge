class Talk

    def initialize (talk)
        @name = talk[:name]
        @startTime = talk[:startTime]
        @duration = talk[:duration]
    end

    def to_s
        puts "#{@startTime.strftime("%I:%M %p")} #{@name} #{@duration} min"
    end

end