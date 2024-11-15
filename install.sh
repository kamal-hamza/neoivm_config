#!/bin/bash

# git repo
REPO_URL="https://github.com/kamal-hamza/nvim.git"

# dest folder
DEST_DIR="$HOME/.config/nvim/"

# Function to check if a command exists
check_command() {
	if ! command -v "$1" &>/dev/null; then
		echo "$1 is not installed!"
		return 1
	else
		echo "$1 is installed."
		return 0
	fi
}

# Check if fzf is installed
check_command "fzf"
fzf_installed=$?

# Check if node is installed
check_command "node"
node_installed=$?

# Check if npm is installed
check_command "npm"
npm_installed=$?

# Check if pip is installed
check_command "pip"
pip_installed=$?

# Check if grep is installed
check_command "grep"
grep_installed=$?

# Optional: Install missing tools (if user wants)
if [[ $fzf_installed -eq 1 || $node_installed -eq 1 || $npm_installed -eq 1 || $pip_installed -eq 1 || $grep_installed -eq 1 ]]; then
	read -p "Some tools are missing. Do you want to install them? (y/n): " answer
	answer=${answer,,} # Convert answer to lowercase

	if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
		echo "Installing missing tools..."

		# Install fzf if missing
		if [[ $fzf_installed -eq 1 ]]; then
			echo "Installing fzf..."
			if [[ "$OSTYPE" == "darwin"* ]]; then
				brew install fzf
			else
				sudo apt install fzf
			fi
		fi

		# Install node if missing
		if [[ $node_installed -eq 1 ]]; then
			echo "Installing node..."
			if [[ "$OSTYPE" == "darwin"* ]]; then
				brew install node
			else
				sudo apt install nodejs
			fi
		fi

		# Install npm if missing
		if [[ $npm_installed -eq 1 ]]; then
			echo "Installing npm..."
			if [[ "$OSTYPE" == "darwin"* ]]; then
				brew install npm
			else
				sudo apt install npm
			fi
		fi

		# Install pip if missing
		if [[ $pip_installed -eq 1 ]]; then
			echo "Installing pip..."
			if [[ "$OSTYPE" == "darwin"* ]]; then
				brew install python3
			else
				sudo apt install python3-pip
			fi
		fi

		# Install grep if missing (unlikely on Linux/macOS)
		if [[ $grep_installed -eq 1 ]]; then
			echo "Installing grep..."
			if [[ "$OSTYPE" == "darwin"* ]]; then
				brew install grep
			else
				sudo apt install grep
			fi
		fi

		echo "Missing tools installed successfully!"
	else
		echo "Installation skipped."
	fi
fi

echo "Cloning repository..."
git clone "$REPO_URL" "$DEST_DIR"
cd "$DEST_DIR" || exit

# Optional: Remove unnecessary files
rm -f .git README.MD LICENSE install.sh install.bat

echo "Setup complete!"
