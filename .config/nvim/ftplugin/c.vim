command-buffer Compile w | make %:r:S
command-buffer CompileM w | !gcc -o %:r:S %:S -lm
command-buffer Make w | !make %:r:S
command-buffer -nargs=* Run split | terminal chmod +x %:p:S; %:p:S <args>
