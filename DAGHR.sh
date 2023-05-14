# Set your GitHub username and access token
GH_USERNAME=<github-username>
GH_TOKEN=<github-personal-access-token-with-repo-permissions>

# Set the base URL for the GitHub API
API_URL="https://api.github.com"

# Get a list of all your repositories using the GitHub API
REPO_LIST=$(curl -sSL -H "Authorization: token $GH_TOKEN" "$API_URL/users/$GH_USERNAME/repos?per_page=1000" | jq -r '.[].clone_url')

# Loop through each repository and clone it
for REPO_URL in $REPO_LIST; do
    git clone $REPO_URL
done
