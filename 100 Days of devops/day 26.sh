cd /usr/src/kodekloudrepos/official

git remote add dev_official /opt/xfusioncorp_official.git

git remote -v

git checkout master
git pull origin master

cp /tmp/index.html .

git add index.html
git commit -m "Add index.html to master branch"

git push -u dev_official master
