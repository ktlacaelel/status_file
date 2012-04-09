
# status = StatusFile.new '/tmp/status'
# status.send "Initialized on: #{Time.now}"
# status.send "Working... #{(1..100).to_a.shuffle.first}%"
# status.update
class StatusFile

  def initialize(file_path)
    @file_path = file_path
    @contents = []
  end

  def send data
    @contents << data
  end

  def update
    File.open(@file_path, 'w+') do |file|
      @contents.each do |line|
        file.puts line
      end
    end
  end

  def read
    File.read(@file_path)
  end

end
