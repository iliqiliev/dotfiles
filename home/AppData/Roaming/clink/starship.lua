local starship_exe = string.format(
   '"%s/scoop/apps/starship/current/starship.exe"',
   os.getenv("USERPROFILE")
)

---@diagnostic disable

local starship_prompt = clink.promptfilter(5)

start_time = os.clock()
end_time = 0
curr_duration = 0
is_line_empty = true

clink.onbeginedit(function()
   end_time = os.clock()
   if not is_line_empty then
      curr_duration = end_time - start_time
   end
end)

clink.onendedit(function(curr_line)
   start_time = os.clock()
   if string.len(string.gsub(curr_line, "^%s*(.-)%s*$", "%1")) == 0 then
      is_line_empty = true
   else
      is_line_empty = false
   end
end)

function starship_prompt:filter(prompt)
   return io.popenyield(
      starship_exe
         .. " prompt"
         .. " --status="
         .. os.geterrorlevel()
         .. " --cmd-duration="
         .. math.floor(curr_duration * 1000)
         .. " --terminal-width="
         .. console.getwidth()
         .. " --keymap="
         .. rl.getvariable("keymap")
   ):read("*a")
end

local characterset = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
local randomkey = ""
math.randomseed(os.time())
for i = 1, 16 do
   local rand = math.random(#characterset)
   randomkey = randomkey .. string.sub(characterset, rand, rand)
end

os.setenv("STARSHIP_SHELL", "cmd")
os.setenv("STARSHIP_SESSION_KEY", randomkey)
