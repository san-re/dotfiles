
# new - ln -s /path/to/file /path/to/symlink
# udpate - ln -sf /path/to/file /path/to/symlink

# file="$HOME/.config/nvim"
# if [ -L ${file} ]; then
#   if [ -e ${file} ]; then
#     echo "Good link"
#   else
#     echo "Broken link"
#   fi
# elif [ -e ${file} ]; then
#   echo "Not a link"
# else
#   echo "Missing"
# fi
ln -sf ./nvim/ ~/.config/
