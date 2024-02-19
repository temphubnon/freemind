FREEMIND=/usr/bin/freemind
if [ -f "$FREEMIND" ]; then
	sudo rm -rf /etc/freemind /usr/bin/freemind /usr/share/freemind /usr/share/applications/freemind.desktop $HOME/.freemind
fi
mkdir ~/.local/share/applications
mkdir ~/.programs
cp ./* ~/.programs -R
xdg-icon-resource install --context mimetypes --size 48 $HOME/.programs/icons/Freemind.png application-x-mindmap
echo 'Exec='$HOME'/.programs/Freemind/freemind.sh'>>$HOME/.programs/Freemind.desktop
echo 'Icon='$HOME'/.programs/icons/Freemind.png'>>$HOME/.programs/Freemind.desktop
desktop-file-install --rebuild-mime-info-cache --dir=$HOME/.local/share/applications ~/.programs/Freemind.desktop
cp $HOME/.local/share/applications/Freemind.desktop ~/Desktop/
chmod +x ~/.local/share/applications/Freemind.desktop
chmod +x ~/Desktop/Freemind.desktop
chmod +x ~/.programs/Freemind/freemind.sh
gio set ~/Desktop/Freemind.desktop "metadata::trusted" yes
gio set ~/.local/share/applications/Freemind.desktop "metadata::trusted" yes
xdg-mime install $HOME/.programs/mindmap-mime.xml
