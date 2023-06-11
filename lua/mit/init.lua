local fn = vim.fn

-- Searches the git config for the user's name; if there
-- is none to be found, prompt for it.
local function get_author_name()
  local name = fn.trim(fn.system("git config --get user.name"))
  if name ~= "" then
    return name
  else
    name = fn.trim(vim.fn.input("Enter your name: "))
    vim.cmd([[redraw]])
    return name
  end
end

local function create_license_file()
  -- Parse the path of the current file to find the license template
  local file = io.open(fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h") ..
                       "/license_template.md", "r")

  -- Read that shit
  local template_lines = {}
  if file then
    for line in file:lines() do
      table.insert(template_lines, line)
    end
    file:close()
  else
    print("Failed to read the license template file.")
    return
  end

  -- Replace <YEAR> and <NAME> with the current year and author's name.
  -- I could have done this while reading the file, but a potential
  -- license template error (however unlikely) would be blocked by
  -- user input in that case.
  local author_name = get_author_name()
  local license_contents = {}
  for _, line in ipairs(template_lines) do
    local replaced_line = string.gsub(line, "<NAME>", author_name)
    replaced_line = string.gsub(replaced_line, "<YEAR>", os.date("%Y"))
    table.insert(license_contents, replaced_line)
  end

  -- Write the license file
  file = io.open(fn.getcwd() .. "/LICENSE.md", "w")
  if file then
    for _, line in ipairs(license_contents) do
      file:write(line .. "\n")
    end
    file:close()
    print("LICENSE.md file created.")
  else
    print("Failed to create the license file.")
  end
end

return {
  create_license_file = create_license_file
}
