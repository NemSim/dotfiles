desc 'Install these config files.'
task :install, :home_dir do |t, args|
  args.with_defaults(home_dir: '~/')
  home_dir = args[:home_dir]
  puts "Installing dotfiles into #{home_dir} ..."

  unless File.exist? File.expand_path("#{home_dir}.vim/bundle")
    puts 'cloning vundle'
    system("git clone https://github.com/VundleVim/Vundle.vim.git #{home_dir}.vim/bundle/Vundle.vim")
  end

  if File.exist? File.expand_path("#{home_dir}.vimrc")
    puts 'killing your .vimrc'
    system("rm -fr #{home_dir}.vimrc")
  end

  if File.exist? File.expand_path("#{home_dir}.tmux.conf")
    puts 'killing your .tmux.conf'
    system("rm -fr #{home_dir}.tmux.conf")
  end

  puts 'linking .vimrc'
  system("ln -s #{home_dir}dotfiles/vimrc #{home_dir}.vimrc")

  puts 'linking .tmux.conf'
  system("ln -s #{home_dir}dotfiles/tmuxconf #{home_dir}.tmux.conf")

  puts 'installing vundle'
  system("vim +PluginInstall +qall")

  puts "(>'.')> DONE! <('.'<)"
end

task :default => :install
