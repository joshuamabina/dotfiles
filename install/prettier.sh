#!/bin/bash

# Define variables
PRETTIER_GLOBAL_CMD="npm install --global prettier @prettier/plugin-php"
PRETTIER_CONFIG_FILE="$HOME/.prettierrc"

# Function to install Prettier and the PHP plugin globally
install_prettier() {
    echo "Installing Prettier and PHP plugin globally..."
    $PRETTIER_GLOBAL_CMD
}

# Function to create the Prettier configuration file
create_prettier_config() {
    echo "Creating Prettier configuration file at $PRETTIER_CONFIG_FILE..."
    cat <<EOL > "$PRETTIER_CONFIG_FILE"
{
  "arrowParens": "always",
  "bracketSameLine": false,
  "bracketSpacing": true,
  "semi": true,
  "singleQuote": false,
  "jsxSingleQuote": false,
  "quoteProps": "as-needed",
  "trailingComma": "all",
  "singleAttributePerLine": false,
  "htmlWhitespaceSensitivity": "css",
  "vueIndentScriptAndStyle": false,
  "proseWrap": "preserve",
  "insertPragma": false,
  "printWidth": 80,
  "requirePragma": false,
  "tabWidth": 2,
  "useTabs": false,
  "embeddedLanguageFormatting": "auto",
  "plugins": ["@prettier/plugin-php"]
}
EOL
}

# Execute functions
install_prettier
create_prettier_config

echo "Prettier setup complete."
