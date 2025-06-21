
    class PomodoroController < ApplicationController
      def start
        @output = capture_timer_output
      end
    
      private
    
      def capture_timer_output
        output = ""
        original_stdout = $stdout
        $stdout = StringIO.new
    
        # Run the timer
        Pomodoro::Timer.new(0.1, 0.05).start
    
        output = $stdout.string
        $stdout = original_stdout
        output
      end
    end
