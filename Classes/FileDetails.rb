module FileDetailsModule
    class FileDetails
        def initialize(fileName, filePath,isDir)
            @fileName = fileName
            @filePath = filePath
            @isDir = isDir
        end

        def getFileDetails
            puts @fileName
            puts @filePath
            puts @isDir
        end

        def getFileName
            return @fileName
        end

        def getIsDir
            return @isDir
        end

        def getFilePath
            return @filePath
        end

    end
end