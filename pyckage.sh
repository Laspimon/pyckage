mkdir -p build
if [ -f ./requirements.txt ]; then
    mkdir -p .pyckage
    while read PACKAGE
    do
        echo "$PACKAGE"
        if [ ! -L "$PACKAGE" ]; then
            echo "Installing $PACKAGE"
            /usr/bin/env pip install $PACKAGE -t .pyckage
            ln -s ".pyckage/$PACKAGE" $PACKAGE
        fi
    done < requirements.txt
fi

echo "Zipping..."
zip -q -r build/main.zip * -x "./build/" ".*.*" 
echo "Zipping...Done"

( echo '#!/usr/bin/env python3'; cat build/main.zip; ) >build/main

chmod 755 build/main

echo "File is in build/main"
echo "To run it, type:"
echo "cd build; ./main; cd .."
