module FileDetailsServiceModule
    def isNameExist(fName, fArr, path)

        if fArr.size == 0
            return false
        end

        # Check if file Name is already exist
        for f in fArr do
            if f.getFilePath == path && fName == f.getFileName 
                puts "File Already exist"
                return true
            end
        end
        return false
    end

    def listFiles(files, path)
        for f in files do
            if f.getFilePath == path
                puts f.getFileName
            end
        end
    end

    def goBack(path)
        if path == ""
                puts "Cannot go back from the root path"
                return path
        end
        # Check for the first path
        if !path.include? "/"
            return ""
        end

        # This insures that we go back one folder even if we have nested folders that have the same folder name.   
        lastIndexOfFileName = path.reverse.index("/")
        return path.slice(0, path.size - lastIndexOfFileName - 1)
    end
    def goIn(dir, path, files)
        for f in files
            if dir == f.getFileName && f.getFilePath == path && f.getIsDir
                if path == ""
                    return path + f.getFileName
                else
                    return path + "/" + f.getFileName
                end
            end
        end
        puts "Dir doesn't exist.. please try again!\n"
        return path
    end
end