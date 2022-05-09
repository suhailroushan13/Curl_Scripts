
#Creating a  repository using GitHub API of POST Method
# Bearer token is required to access the API

#Making a git repository using GitHub API of POST Method
#  The above code is adding a collaborator to the repository.
curl --location --request POST 'https://api.github.com/user/repos' \
--header 'Authorization: Bearer YOUR_TOKEN' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Suhail",
    "description": "This is your first repository",
    "homepage": "https://github.com",
    "private": false,
    "has_issues": true,
    "has_projects": true,
    "has_wiki": true
}'

# Adding a README to the repository using GitHub API of POST Method
# Empty GitHub Repository cannot has branch Rule
git clone git@github.com:{OWNER_USERNAME}/{REPOSITORY_NAME}.git
cd {REPOSITORY_NAME}
touch README.md
echo "This Repository has been created Successfully using GitHub API of POST Method" >> README.md
git add .
git commit -m "Initial commit"
git push origin master


# Inviting Collaborator to the repository using GitHub API of POST Method
curl -H "Authorization: token {TOKEN}" \ "https://api.github.com/repos/{OWNER_USERNAME}/{REPOSITORY_NAME}/collaborators/{COLLABORATOR_NAME}" -X PUT -d '{"permission":"push"}'

# Creating a Branch Rule 

#!/bin/bash
set -e


export user="{OWNER_USERNAME}":"{TOKEN}"
export branch="master" 

declare -a repositories=(
    "repo-scripts"
    "sbt-dependency-updates-action"
)

JSON=$(cat << 'EOF'
    {
        "required_status_checks": null,
        "enforce_admins": true,
        "required_pull_request_reviews": {
            "required_approving_review_count": 0
        },
        "restrictions": null
    }
EOF
)

for {REPOSITORY_NAME} in "${repositories[@]}"; do
    echo "========"
    echo "=======> {REPOSITORY_NAME} "
    echo "========"
        
    curl \
        --silent \
        --user $user \
        --header "Accept: application/vnd.github.v3+json" \
        --request PUT \
        https://api.github.com/repos/{OWNER_USERNAME}/{REPOSITORY_NAME}/branches/master/protection \
        --data "$JSON"

done
