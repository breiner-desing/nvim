local java = {}

function get_spring_boot_runner(profile, debug)
   local debug_param = ""
   if debug then
     debug_param = ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
   end 

   local profile_param = ""
   if profile then
     profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
   end
 --.. profile_param .. debug_param

   return ' mvn spring-boot:run ' .. debug_param
  
		end

function java.run_spring_boot(debug)
  vim.cmd('term ' .. 'mvn clean && mvn compile && ' .. get_spring_boot_runner(method_name, debug))
end

local dap = require('dap')

function java.attach_to_debug()

local date_server = {
      type = 'java';
      request = 'attach';
      name = "Attach to the process";
      hostName = 'localhost';
      port = '5005';
    }

		  dap.configurations.java = {date_server}
		
  dap.continue()
end 

-- view informations in debug
function java.show_dap_centered_scopes()
  local widgets = require'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end

return java
