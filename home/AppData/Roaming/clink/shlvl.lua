local current_shlvl = tonumber(os.getenv("SHLVL") or 0)

---@diagnostic disable-next-line: undefined-field
os.setenv("SHLVL", tostring(current_shlvl + 1))
