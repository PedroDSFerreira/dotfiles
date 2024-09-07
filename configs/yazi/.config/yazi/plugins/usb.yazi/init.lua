local state = ya.sync(function() return tostring(cx.active.current.cwd) end)

local function fail(s, ...)
    ya.notify { title = "Directory Picker", content = string.format(s, ...), timeout = 5, level = "error" }
end

-- Function to check if a directory exists
local function dir_exists(path)
    local ok, _, code = os.rename(path, path)
    return ok or code == 13  -- 13 means permission denied, so the path exists
end

-- Function to list folder names
local function list_dirs(path)
    local dirs = {}
    local p = io.popen('ls -d ' .. path .. '/*/ 2>/dev/null')  -- Redirect error output to /dev/null
    for dir in p:lines() do
        -- Extract only the folder name
        local folder_name = dir:match(".*/(.*)/")
        table.insert(dirs, folder_name)
    end
    p:close()
    return dirs
end

local function entry(_, args)
    local _permit = ya.hide()
    local cwd = state()
    local media_path = "/run/media/" .. os.getenv("USER")

    -- Check if the media path exists
    if not dir_exists(media_path) then
        return fail("Path %s does not exist.", media_path)
    end

    -- List directories
    local dirs = list_dirs(media_path)

    -- Check if any directories are found
    if #dirs == 0 then
        return fail("No USB devices detected.")
    end

    -- Use FZF to select a directory
    local cmd = [[echo "]] .. table.concat(dirs, "\n") .. [[" | fzf-tmux -p 80%]]
    local child, err = Command(os.getenv("SHELL")):args({ "-c", cmd }):cwd(cwd):stdout(Command.PIPED):stderr(Command.INHERIT):spawn()

    if not child then
        return fail("Failed to run fzf: %s", err)
    end

    local output, err = child:wait_with_output()
    if not output then
        return fail("Failed to read fzf output: %s", err)
    end

    local selected_dir = output.stdout:gsub("\n$", "")

    if selected_dir ~= "" then
        ya.manager_emit("cd", { media_path .. "/" .. selected_dir })
    end
end

return { entry = entry }
