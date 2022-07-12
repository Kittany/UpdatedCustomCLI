require_relative 'CustomFile'
include CustomFileModule
require_relative '../utils/Validation'
include ValidationModule
require_relative '../services/FileService'
include FileServiceModule


module CLIModule
    class CLIController 
        # Creating a new hash this way allows us to create a new hash (key) without the need of checking 
        # the key everytime we create a new hash, e.g (@@filesDB["pathTest"] ||= []), this approach is more elegant and it help us to
        # prevent the app from crashing when we use the (ls) command right when we start the app.
        @@filesDB = Hash.new {|h,k| h[k]=[]}


        def self.create(fileName, path, isDir)
            # Some Validations
            if inputCharactersValidation(fileName) || isNameExist(fileName, path, @@filesDB[path])
                return
            end
            
            # Inserting new file to the specified path
            @@filesDB[path] << CustomFile.new(fileName, isDir)
        end


        def self.ls(path, dirName)
            listFiles(@@filesDB, path, dirName)
        end
        
        def self.lsph()
            listPathHierarchy(@@filesDB)
        end

        def self.cd(dir, path)
            return goIn(dir, path, @@filesDB[path])
        end


        def self.cdOut(path)
            return goBack(path)
        end
    end
end