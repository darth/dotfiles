local fs = vim.fn.globpath(vim.o.rtp, 'spell/*.add', false, true)
for _, f in ipairs(fs) do
    if (vim.fn.filereadable(f) == 1) then
        if (not (vim.fn.filereadable(f .. '.spl') == 1) or
            (vim.fn.getftime(f) > vim.fn.getftime(f .. '.spl'))) then
            vim.cmd('silent mkspell! ' .. vim.fn.fnameescape(f))
        end
    end
end
