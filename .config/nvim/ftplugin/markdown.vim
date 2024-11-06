setlocal tabstop=4
command-buffer Run !linkhandler %:S
command-buffer WRun w | Run
