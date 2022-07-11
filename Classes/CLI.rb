require_relative 'FileDetails'
include FileDetailsModule
require_relative '../services/FileDetailsService'
include FileDetailsServiceModule
require_relative '../utils/Validation'
include ValidationModule

module CLIModule
    class CLIController      
        @@FileDetails = []

        def self.create(fileName, path, isDir)
            if inputCharactersValidation(fileName) || isNameExist(fileName, @@FileDetails, path)
                return
            end

            @@FileDetails.push(FileDetails.new(fileName, path, isDir))
        end


        def self.ls(path)
            listFiles(@@FileDetails, path)
        end
        

        def self.cd(dir, path)
            return goIn(dir, path, @@FileDetails)
        end


        def self.cdOut(path)
            return goBack(path)
        end
    end
end