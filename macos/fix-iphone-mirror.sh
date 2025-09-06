# Will need proctools installed
# -> brew install proctools

if brew list --formula | grep -q "^proctools\$"; then
    pkill "iPhone Mirroring"
    defaults delete com.apple.ScreenContinuity
    rm ~/Library/Containers/com.apple.ScreenContinuity/Data/Library/Preferences/com.apple.ScreenContinuity.plist
else
    echo "proctools is not installed. Running installation through brew..."
    brew install proctools
    echo "Please run this script again."
    exit 1
fi

