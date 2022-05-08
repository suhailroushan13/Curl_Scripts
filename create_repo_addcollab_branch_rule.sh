
#Creating a  repository using GitHub API of POST Method
# Bearer token is required to access the API

#Making a git repository using GitHub API of POST Method
#  The above code is adding a collaborator to the repository.
curl --location --request POST 'https://api.github.com/user/repos' \
    --header 'Authorization: Bearer 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' \
    --header 'Content-Type: application/json' \
    --data-raw '{
    "name" : "cs21_MAT7_ClassWork",
    "description" : "",
    "homepage":"https://github.com",
    "private": true,
    "has_issues":true,
    "has_projects":true,
    "has_wiki":true

}'

# Adding a README to the repository using GitHub API of POST Method
# Empty GitHub Repository cannot has branch Rule
git clone git@github.com:suhailroushan13/cs21_MAT7_ClassWork.git
cd cs21_MAT7_ClassWork
touch README.md
echo "This Repository has been created Successfully using GitHub API of POST Method" >> README.md
git add .
git commit -m "Initial commit"
git push origin master


# Inviting Collaborator to the repository using GitHub API of POST Method
curl -H "Authorization: token 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" "https://api.github.com/repos/suhailroushan13/cs21_MAT7_ClassWork/collaborators/160919733108" -X PUT -d '{"permission":"push"}'

# Creating a Branch Rule 

#!/bin/bash
set -e


export user="suhailroushan13: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" 
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

for cs21_MAT7_ClassWork in "${repositories[@]}"; do
    echo "========"
    echo "=======> cs21_MAT7_ClassWork"
    echo "========"
        
    curl \
        --silent \
        --user $user \
        --header "Accept: application/vnd.github.v3+json" \
        --request PUT \
        https://api.github.com/repos/suhailroushan13/cs21_MAT7_ClassWork/branches/master/protection \
        --data "$JSON"

done
