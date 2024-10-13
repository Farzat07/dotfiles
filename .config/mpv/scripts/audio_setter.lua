local function change_audio()
    local r = mp.command_native({
            name = "subprocess",
            capture_stdout = true,
            args = {'sh', '-c', "mpv --audio-device=help | tail -n+2 | fzf-tmux -p | awk '{printf $1}'"},
            playback_only = false,
        })

    if r.status == 0 and r.stdout ~= "" then
        mp.set_property("audio-device", string.sub(r.stdout, 2, -2))
    end
end

mp.add_key_binding("alt+a", "SetAudioDevice", change_audio)
