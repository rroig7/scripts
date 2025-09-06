if brew list --formula | grep -q "^proctools\$"; then
    echo "proctools is installed via Homebrew."
else
    echo "proctools is not installed."
    exit 1
fi

