require_relative '../utils/Validation'
include ValidationModule

module FileDetailsServiceModule

    def listFiles(files)
        for f in files
            puts f.getFileName
        end
    end

    def goBack(path)
        # Check if were in the root path
        if path == ""
            puts "Cannot go back from the root path"
            return path
        end

        # Check if were in the first folder after the root folder
        if !path.include? "/"
            return "" # this return the root path
        end

        # This insures that we go back one folder even if we have nested folders that have the same folder name.   
        lastIndexOfFileName = path.reverse.index("/")
        return path.slice(0, path.size - lastIndexOfFileName - 1)
    end


    def goIn(dir, path, files)
        for f in files
            if f.getFileName == dir && f.getIsDir
                # If were in the root path we return only the dir name, if were in somewhere else we return the path with a (/) after the given dir name.
                return path == "" ? path + f.getFileName : path + "/" + f.getFileName
            end
        end
        puts "Dir doesn't exist.. please try again!\n"
        return path
    end
end
