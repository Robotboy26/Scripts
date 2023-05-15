# This will create a txt file called repoList.txt in the current folder with all of your github repos

touch repoList.txt
# Set your GitHub username and access token
GH_USERNAME=<github-username>
GH_TOKEN=<github-token>

# Set the base URL for the GitHub API
API_URL="https://api.github.com"

# Get a list of all your repositories using the GitHub API
REPO_LIST=$(curl -sSL -H "Authorization: token $GH_TOKEN" "$API_URL/user/repos?type=all&per_page=1000" | jq -r '.[].clone_url')

for REPO_URL in $REPO_LIST; do
    echo $REPO_URL >> repoList.txt
done
