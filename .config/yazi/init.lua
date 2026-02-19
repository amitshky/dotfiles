function Linemode:all()
    local time = math.floor(self._file.cha.mtime or 0)

    if time == 0 then
        time = "-"
    else
        time = os.date("%Y-%m-%d %H:%M", time)
    end

    local size = self._file:size()
    local size_str = size and ya.readable_size(size) or "-"
    local permissions = self._file.cha:perm() or "-"

    return string.format("%s %s %s", size_str, permissions, time)
end
