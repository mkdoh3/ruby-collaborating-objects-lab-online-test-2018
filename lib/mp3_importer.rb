# require 'pry'
# class MP3Importer
#   attr_reader :path
#   def initialize(path)
#     @path = path
#   end
#   def files
#     #don't parse the file more than once?
#     @files ||=
#       Dir.entries(path).filter { |file_name| file_name.end_with?('.mp3') }
#   end
#   def import
#     files.each { |file_name| Song.new_from_filename(file_name) }
#   end
# end
class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect { |f| f.gsub("#{path}/", '') }
  end

  def import
    files.each { |f| Song.new_by_filename(f) }
  end
end
