desc 'Install these config files.'
task :install do
  unless File.exist? File.expand_path("~/.vim/bundle")
    puts 'cloning vundle'
    system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
  end

  if File.exist? File.expand_path('~/.vimrc')
    puts 'killing your .vimrc'
    system('rm -fr ~/.vimrc')
  end

  if File.exist? File.expand_path('~/.tmux.conf')
    puts 'killing your .tmux.conf'
    system('rm -fr ~/.tmux.conf')
  end

  puts 'linking .vimrc'
  system('ln -s ./dotfiles/vimrc ~/.vimrc')

  puts 'linking .tmux.conf'
  system('ln -s ./dotfiles/tmuxconf ~/.tmux.conf')

  puts 'installing vundle'
  system('vim +PluginInstall +qall')

  puts "(>'.')> DONE! <('.'<)"
end

task :default => :install
