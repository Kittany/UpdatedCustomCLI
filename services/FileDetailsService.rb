require_relative '../utils/Validation'
include ValidationModule

module FileDetailsServiceModule

    def listFiles(filesArr, path, dirName)
        # Checks if the user gives us dir name
        if dirName == nil
            # Show files in the current path
            for f in filesArr[path]
                puts f.getFileName
            end
            return
        end


        isDirNameExist = false

        for f in filesArr[path]
            # Check if the given dirName exist in the current folder & check if its a dir type
            if f.getFileName == dirName && f.getIsDir
                isDirNameExist = true
            end
        end

        if isDirNameExist
            # If: Path = "" which is (ROOT path) return the files of ROOT
            # Else: return files of the given dirName inside the current path
            files = path == "" ? filesArr[dirName] : filesArr[path + "/" +dirName]
            for f in files
                puts f.getFileName
            end
            return
        end
        puts "ls: cannot access '#{dirName}': No such file or directory"
    end

    # This function gives us how the files is being sorted in the app
    def listPathHierarchy(filesArr)
        filesArr.each do |path, files|
            print path == "" ? "\nPath[Root]: Files[" : "\nPath[#{path}]: Files["
            for f in files
                print "\t#{f.getFileName}\t"
            end
            puts "]\n"
        end
        puts "\n"
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
