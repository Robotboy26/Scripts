# Set your GitHub username and access token
GH_USERNAME=<github-username>
GH_TOKEN=<github-token>

# Set the base URL for the GitHub API
API_URL="https://api.github.com"

# Get a list of all your repositories using the GitHub API
REPO_LIST=$(curl -sSL -H "Authorization: token $GH_TOKEN" "$API_URL/user/repos?type=all&per_page=1000" | jq -r '.[].clone_url')

# Read the list of wanted repositories from the file
WANTED_REPOS=$(cat wantedList.txt)

# Loop through each repository in the list
for REPO_URL in $WANTED_REPOS; do
    # Clone the repository if it's in the list
    git clone $REPO_URL || true
done
