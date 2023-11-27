# julia-nnetsauce

Calling nnetsauce with PyCall

See also: https://www.digitalocean.com/community/tutorials/how-to-install-julia-programming-language-on-ubuntu-22-04

## Install Julia

Run (terminal):
```bash
wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.4-linux-x86_64.tar.gz
```

Run (terminal):
```bash
tar zxvf julia-1.9.4-linux-x86_64.tar.gz
```
Run (terminal):
```bash
code ~/.bashrc
```

Add to `.bashrc` (last line): 
```bash
export PATH="$PATH:julia-1.9.4/bin"
```

Run (terminal): 
```bash
source ~/.bashrc
```

Run (terminal): 
```bash
julia nnetsauce_example.jl
```
