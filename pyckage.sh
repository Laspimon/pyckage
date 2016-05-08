mkdir -p build
if [ -f ./requirements.txt ]; then
    mkdir -p .pyckage
    # Download all packages in requirements.txt and place in the .pyckage dir.
    while read PACKAGE
    do
        echo "$PACKAGE"
        # Perform action if symlink does not exist.
        if [ ! -L "$PACKAGE" ]; then
            echo "Installing $PACKAGE"
            /usr/bin/env pip install $PACKAGE -t .pyckage
            # Create symlink, so that package may be imported.
            ln -s ".pyckage/$PACKAGE" $PACKAGE
        fi
    done < requirements.txt
fi

echo "Zipping..."
# Put all files, folders and sub-folders into a zip archive.
zip -q -r build/main.zip * -x "./build/" ".*.*" 
echo "Zipping...Done"

# Extract the contents of the entire zip file into a new file, and make it executable.
( echo '#!/usr/bin/env python3'; cat build/main.zip; ) >build/main

chmod 755 build/main

echo "File is in build/main"
echo "To run it, type:"
echo "cd build; ./main; cd .."
