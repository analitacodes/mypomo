require "pry"

module Pomodoro
class Timer # Starts the countdown of work minutes, break minutes, and completing pomo session
    attr_reader :work_minutes, :break_minutes

    def initialize(work_minutes = 25, break_minutes = 5)
      @work_minutes = work_minutes
      @break_minutes = break_minutes
    end

    def start
      puts " Work for #{work_minutes} minutes!"
      countdown(work_minutes)

      puts "☕ Break for #{break_minutes} minutes!"
      countdown(break_minutes)

      puts "Pomodoro session complete!"
    end

    def pause
        @paused = true
        puts "Pomo is frozen"
    end

    def resume
        @paused = false
        puts "yay, pomo can eat soon!"
    end

    private

    def countdown(minutes)
      seconds = minutes * 60
      @paused = false

      while seconds > 0
        mins, secs = seconds.divmod(60)
        print "\r#{format('%02d:%02d', mins, secs)} remaining"
        sleep 1
        seconds -= 1
      end
      puts
    end
end
end

# To test:
# timer = PomodoroTimer.new
# timer.start
