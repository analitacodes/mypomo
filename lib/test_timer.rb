require_relative 'pomodoro/timer'

puts "🔥 test_timer.rb is running"

timer = PomodoroTimer.new(0.1, 0.05)
puts "🔥 Timer created"

# Run the timer in a separate thread
timer_thread = Thread.new { timer.start }

# Wait a few seconds, then pause
sleep 3
puts "\n⏸️ Pausing timer..."
timer.pause

# Wait while paused
sleep 3

# Resume
puts "▶️ Resuming timer..."
timer.resume

# Wait for thread to finish before exiting
timer_thread.join

puts "✅ Timer finished"
