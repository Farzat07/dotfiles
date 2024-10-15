if mp.get_opt("print_filenames") == "yes" then
  for i = 0,mp.get_property("playlist-count")-1,1
  do print("STARTFILE:= " .. mp.get_property("playlist/" .. i .. "/filename"))
  end
end
