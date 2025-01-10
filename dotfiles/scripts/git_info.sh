# ~/.zsh-scripts/git_info.sh

# Define colors from Catppuccin Macchiato
TEAL='\033[38;5;80m'        # Teal
PEACH='\033[38;5;215m'      # Peach
LAVENDER='\033[38;5;189m'   # Lavender
MAROON='\033[38;5;161m'     # Maroon
RESET='\033[0m'             # Reset color

# Function to display Git information
function git_info {
    # Check if the current directory is inside a Git repository
    if [ -d ".git" ] || git rev-parse --git-dir > /dev/null 2>&1; then
        # Get the current branch name
        branch=$(git rev-parse --abbrev-ref HEAD)

        # Get the last commit hash
        last_commit=$(git log -1 --pretty=format:"%h")

        # Get the status of the repository (clean or dirty)
        git_status=$(git status --porcelain)
        if [ -z "$git_status" ]; then
            repo_status="Clean"
        else
            repo_status="Dirty"
        fi

        # Output the Git information with Catppuccin colors
        echo -e "${TEAL}📦 Git repo detected${RESET}"
        echo -e "${PEACH}🔀 Current branch: $branch${RESET}"
        echo -e "${LAVENDER}💾 Last commit: $last_commit${RESET}"
        echo -e "${MAROON}🧹 Status: $repo_status${RESET}"
    fi
}

# Hook into the 'cd' command to automatically run git_info
function cd {
    builtin cd "$@"  # Call the original 'cd' command with the user's arguments
    git_info         # Run the git_info function after changing directories
}

# Call git_info when opening a new terminal session in a Git repository
git_info

