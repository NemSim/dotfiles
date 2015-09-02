desc 'Install these config files.'
task :install do
  unless File.exist? File.expand_path("~/.vim/bundle")
    step 'cloning vundle'
    system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
  end

  if File.exist? File.expand_path('~/.vimrc')
    step 'killing your .vimrc'
    system('rm -fr ~/.vimrc')
  end

  if File.exist? File.expand_path('~/.tmux.conf')
    step 'killing your .tmux.conf'
    system('rm -fr ~/.tmux.conf')
  end

  step 'linking .vimrc'
  system('ln -s ./dotfiles/vimrc ~/.vimrc')

  step 'linking .tmux.conf'
  system('ln -s ./dotfiles/tmuxconf ~/.tmux.conf')

  step 'installing vundle'
  system('vim +PluginInstall +qall')

  puts "(>'.')> DONE! <('.'<)"
end

task :default => :install
