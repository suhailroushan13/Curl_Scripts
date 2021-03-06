#Creating a  repository using GitHub API of POST Method
# Bearer token is required to access the API

#Making a git repository using GitHub API of POST Method
# The above code is adding a collaborator to the repository.
curl --location --request POST 'https://api.github.com/user/repos' \
--header 'Authorization: Bearer YOUR_TOKEN' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Suhail_MAT7_CS21",
    "description": "This is your first repository",
    "homepage": "https://github.com",
    "private": true,
    "has_issues": true,
    "has_projects": true,
    "has_wiki": true
}'




# # Adding a README to the repository using GitHub API of POST Method
# # Empty GitHub Repository cannot has branch Rule
git clone git@github.com:suhailroushan13/Suhail_MAT7_CS21.git
cd Suhail_MAT7_CS21
touch README.md
echo "This Repository has been created Successfully using GitHub API of POST Method for Suhail_MAT7_CS21" >> README.md
git add .
git commit -m "Initial commit"
git push origin master


curl -i -u "suhailroushan13:YOUR_TOKEN" -X PUT -d '' 'https://api.github.com/repos/suhailroushan13/Suhail_MAT7_CS21/collaborators/160919733108'

#  Creating a Branch Rule
#!/bin/bash
set -e

export user="suhailroushan13":"YOUR_TOKEN"
export branch="master"

declare -a repositories=(
    "repo-scripts"
    "sbt-dependency-updates-action"
)

JSON=$(
    cat <<'EOF'
    {
        "required_status_checks": null,
        "enforce_admins": true,
        "required_pull_request_reviews": {
            "required_approving_review_count": 1
        },
        "restrictions": null
    }
EOF
)

for Suhail_MAT7_CS21 in "${repositories[@]}"; do
    echo "========"
    echo "=======> Suhail_MAT7_CS21"
    echo "========"

    curl \
        --silent \
        --user $user \
        --header "Accept: application/vnd.github.v3+json" \
        --request PUT \
        https://api.github.com/repos/suhailroushan13/Suhail_MAT7_CS21/branches/master/protection \
        --data "$JSON"

done
