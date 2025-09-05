
git checkout -b datacenter

cp /tmp/index.html .

git add index.html
git commit -m "Add index.html to datacenter branch"

git push -u origin datacenter

git checkout master
git merge datacenter

git push origin master
