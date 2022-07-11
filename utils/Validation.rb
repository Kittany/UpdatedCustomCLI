module ValidationModule

    def inputCharactersValidation(name)

        forbiddenCharacters = ["/", "\\", ":","*", "?", '"', "<", ">","|" ] 
        for char in forbiddenCharacters do
            if name.include? char
                puts "Cannot create a file contain #{forbiddenCharacters.join(" ")} characters."
                return true
            end
        end

        return false

    end
    
end