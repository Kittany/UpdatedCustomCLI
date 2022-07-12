require_relative 'Classes/CLI'
include CLIModule


class App
    def initialize
        @path = ""
    end


    def getInput
        print @path + ">"

        # Getting the input from the user
        input = gets.chomp.split(" ")
        command = input[0]

        # Exit 
        # if command == "exit" && input.size == 1
        if command == "exit"
            puts "Have a nice day :)!"
            return
        end

        #Input Validation
        if input.size > 2
            puts "Invalid command, please try again!\n"
            getInput
            return
        end
        
        # fileName works for both (dir, file)
        fileName = input[1]
        
        case command 
            # 1)
            when "ls"
            CLIController.ls(@path)
            
            # 2)
            when "mkfile"
            CLIController.create(fileName, @path, false)
            
            # 3)
            when "mkdir"
            CLIController.create(fileName, @path, true)

            # 4)
            when "cd"
            @path = CLIController.cd(fileName, @path)
            
            # 5)
            when "cd.."
            @path = CLIController.cdOut(@path)
        end
        getInput
    end
end


app = App.new
app.getInput