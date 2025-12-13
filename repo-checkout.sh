#!/bin/bash
# Update & rebuild backend only

source "$(dirname "$0")/envsetup.sh"

echo "Checkout git branches.."

cd $REPO_ROOT

repo forall -c '
    # Get the revision (branch name) from the manifest
    BRANCH_NAME="${REPO_RREV}";
    
    # Only proceed if we are in detached HEAD state (which we are after sync)
    if git rev-parse --symbolic-full-name HEAD | grep -q "refs/heads"; then
        # Already on a branch, skip initialization
        :
    else
        echo "Creating local branch for ${REPO_PROJECT}: ${BRANCH_NAME}";
        # Check out the local branch, linking it to the remote branch
        git checkout -b "${BRANCH_NAME}" "github/${BRANCH_NAME}";
    fi
'