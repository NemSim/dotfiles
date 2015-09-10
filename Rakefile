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
    puts 'killing existing .vimrc'
    system("mv #{home_dir}.vimrc #{home_dir}.vimrc.backup")
  end

  if File.exist? File.expand_path("#{home_dir}.tmux.conf")
    puts 'killing existing .tmux.conf'
    system("mv #{home_dir}.tmux.conf #{home_dir}.tmux.conf.backup")
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
