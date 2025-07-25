gem install --user-install jekyll
export PATH="/home/runner/.local/share/gem/ruby/3.2.0/bin:$PATH"
echo "---------------------------------------------------"
echo "Open the site at http://$CODESPACE_NAME-4000.app.github.dev/"
echo "---------------------------------------------------"
jekyll serve --incremental