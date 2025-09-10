git stash apply stash@{1}
# Stage everything
git add .

# Commit with a clear message
git commit -m "Restored changes from stash@{1}"

# Push to origin (master branch assumed)
git push origin master
