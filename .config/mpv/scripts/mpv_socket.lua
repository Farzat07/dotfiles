-- mpvSockets, one socket per instance, removes socket on exit

package.path = mp.command_native({"expand-path", "~~/script-modules/?.lua;"})..package.path
local input = require "user-input-module"
local utils = require 'mp.utils'

local sock_dir = os.getenv("MPV_SOCKET_DIR") or
  utils.join_path(os.getenv("XDG_RUNTIME_DIR"), "mpv/sockets")
mp.command_native({capture_stdout = true, capture_stderr = true,
args = {"mkdir", "-p", sock_dir}, name = "subprocess", playback_only = false})

local sock_file = utils.join_path(sock_dir,
mp.get_opt("mpv_socket") or utils.getpid())

mp.set_property("options/input-ipc-server", sock_file)

local function check_active_socket(file_name)
  return mp.command_native({
    name = "subprocess",
    capture_stdout = true,
    capture_stderr = true,
    args = {"nc", "-NU", file_name},
    playback_only = false,
    stdin_data = '{ "command": ["get_property", "path"] }\n',
  }).status == 0
end

local function change_sockname()
  input.get_user_input(function(line, _)
    if line then
      local new_sock_file = utils.join_path(sock_dir, line)
      if check_active_socket(new_sock_file) then
        change_sockname()
      else
        mp.set_property("options/input-ipc-server", new_sock_file)
      end
    end
  end, { request_text = "set socket name:" })
end

mp.add_key_binding("alt+s", "NameIPCSocket", change_sockname)

local function update_socket_name()
  local new_name = mp.get_property("options/input-ipc-server")
  if sock_file ~= new_name then
    os.remove(sock_file)
  end
  sock_file = new_name
end

mp.observe_property("options/input-ipc-server", nil, update_socket_name)

local function shutdown_handler()
  os.remove(mp.get_property("options/input-ipc-server"))
end
mp.register_event("shutdown", shutdown_handler)
