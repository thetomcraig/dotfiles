alias sshdev="tmux rename-window 'DEV'; ssh polarisadmin@10.184.9.4"
alias sshsand="tmux rename-window 'SAND'; ssh -i ~/.ssh/polaris_sand_vm_ssh_key.txt polarisadmin@10.183.9.4"
alias sshint="tmux rename-window 'INT'; ssh -i ~/.ssh/polaris_int_vm_ssh_key.txt polarisadmin@10.185.9.4"

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
