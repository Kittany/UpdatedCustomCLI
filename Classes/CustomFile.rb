module CustomFileModule
    class CustomFile
        def initialize(fileName, isDir)
            @fileName = fileName
            @isDir = isDir
        end

        def getFileName
            return @fileName
        end

        def getIsDir
            return @isDir
        end
    end
end