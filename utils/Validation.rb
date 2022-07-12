module ValidationModule

    def inputCharactersValidation(name)
        if name == nil
            puts "Please insert a file name.."
            return true
        end

        forbiddenCharacters = ["/", "\\", ":","*", "?", '"', "<", ">","|" ] 
        for char in forbiddenCharacters do
            if name.include? char
                puts "Cannot create a file contain #{forbiddenCharacters.join(" ")} characters."
                return true
            end
        end

        return false
    end
    

    def isNameExist(name, path, files)
        # Check if file Name is already exist
        for f in files
            if f.getFileName == name
                puts "File Already exist"
                return true
            end
        end
        
        return false
    end
end