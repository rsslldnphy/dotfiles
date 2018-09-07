set -gx PATH /usr/local/bin $PATH
set -gx PATH ./node_modules/.bin $PATH
set -gx PATH ./Library/Python/2.7/bin/ $PATH

echo
echo "🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸"
echo 'Hello!' | figlet -f broadway | lolcat
echo
echo "🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸  🐈  😸"
echo
echo "ARE YOU READY TO DO THE CODE?" | lolcat
echo

set -x INFRA_HOME ~/Code/infra

set -x AURORA_PWD VG8G^%D*yAe6

# rbenv
set ANSIBLE_NOCOWS 1

# ssh-agent

setenv SSH_ENV $HOME/.ssh/environment
setenv AWS_PROFILE hu

set -x GPG_TTY (tty)

if [ -n "$SSH_AGENT_PID" ]
  ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
  if [ $status -eq 0 ]
    test_identities
  end
else
  if [ -f $SSH_ENV ]
    . $SSH_ENV > /dev/null
  end
  ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
  if [ $status -eq 0 ]
    test_identities
  else
    start_agent
  end
end

source ~/.env

alias gpf "git push --force-with-lease"
alias n nvim
alias e nvim
alias vi nvim
alias vim nvim
