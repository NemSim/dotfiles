desc 'Install these config files.'
task :install, :home_dir do |t, args|
  args.with_defaults(home_dir: '~/')
  home_dir = args[:home_dir]
  home_dir << '/' if home_dir[-1] != '/'
  puts "Installing dotfiles into #{home_dir} ..."

  if File.exist? File.expand_path("#{home_dir}.bashrc")
    puts 'killing existing .bashrc'
    system("mv #{home_dir}.bashrc #{home_dir}.bashrc.backup")
  end

  unless File.exist? File.expand_path("#{home_dir}.vim/bundle")
    puts 'cloning vundle'
    system("mkdir -p #{home_dir}.vim/bundle")
    system("git clone https://github.com/VundleVim/Vundle.vim.git #{home_dir}.vim/bundle/Vundle.vim")
    system("chown -R vagrant:vagrant #{home_dir}/.vim")
  end

  if File.exist? File.expand_path("#{home_dir}.vimrc")
    puts 'killing existing .vimrc'
    system("mv #{home_dir}.vimrc #{home_dir}.vimrc.backup")
  end

  if File.exist? File.expand_path("#{home_dir}.tmux.conf")
    puts 'killing existing .tmux.conf'
    system("mv #{home_dir}.tmux.conf #{home_dir}.tmux.conf.backup")
  end

  puts "linking #{home_dir}dotfiles/bashrc to #{home_dir}.bashrc"
  system "ln -s #{home_dir}dotfiles/bashrc #{home_dir}.bashrc"

  puts "linking #{home_dir}dotfiles/vimrc to #{home_dir}.vimrc"
  system "ln -s #{home_dir}dotfiles/vimrc #{home_dir}.vimrc"

  puts "linking #{home_dir}dotfiles/tmuxconf to #{home_dir}.tmux.conf"
  system "ln -s #{home_dir}dotfiles/tmuxconf #{home_dir}.tmux.conf"

  puts 'installing vundle'
  system("vim +PluginInstall +qall")

  puts 'installing ruby 2.2.x'
  system('rbenv install 2.2.2')
  system('rbenv global 2.2.2')

  puts "(>'.')> DONE! <('.'<)"
end

task :default => :install
