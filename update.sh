git checkout --orphan newBranch
git add -A
git commit -am "commit message"
git branch -D master
git branch -m master
git push -f origin master