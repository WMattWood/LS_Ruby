class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  # def listen(&signal)
  #   self.record(signal.call) if block_given?
  # end

  def listen
    record (yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"