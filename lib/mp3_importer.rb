class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files #parses the path to return an array
        d = Dir.new(@path)
        file_list = d.children
        file_list
    end

    def import
        files.each {|file| Song.new_by_filename(file)}
    end
end