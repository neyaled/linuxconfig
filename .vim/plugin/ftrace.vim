fu! Ftrace_extract_cpu(cpu_number)
    let s:filename = expand("%")
    let s:cpu_nb = a:cpu_number
    let s:out = s:filename . "." . s:cpu_nb
    let s:lines = []
    let s:pattern = "^ " . s:cpu_nb . ")"

    echo "EXTRACT cpu " . s:cpu_nb . " FOR " . s:filename

    for s:line in readfile(s:filename)
        if match(s:line,s:pattern) > -1
            call add(s:lines,s:line)
        endif
    endfor

    call writefile(s:lines,s:out)

    echo "DONE"
endfunction

command! -nargs=1 FtraceExtractCpu :call Ftrace_extract_cpu(<args>)
