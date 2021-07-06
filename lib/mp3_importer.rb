require 'pry'

class MP3Importer

    attr_reader :path

    @@files = []

    def initialize(path)
        @path = path
        new_files = Dir.entries(@path).select do |file|
            file.end_with?("mp3")
        end
        new_files.each do |file|
            if @@files.include?(file) == false
            @@files << file
            end
        end
    end

    def files
        @@files
    end

    def import
        @@files.each do |file|
            Song.new_by_filename(file)
        end
    end
end