SET editor="C:/Program Files/Sublime Text/sublime_text.exe"

REM new repository
mkdir repo_new
cd repo_new
git init
git status

REM user setup for commit
git config --global user.name "yeel"
git config --global user.email "evil.carmen666@gmail.com"

REM starting work
touch file.txt
git add .
git status
REM remove from add
REM git rm --cached <file>

REM empty directory
mkdir empty
cd empty
touch .gitkeep
cd ..
git status
git add .

REM commit
git commit -m "first commit"

REM master
cd ..
mkdir repo_master
cd repo_master
git init
cd ../repo_new
git remote add origin "../repo_master"
REM wrong way
git push --set-upstream origin master
REM correct way
cd ..
rm -rf repo_master
mkdir repo_master
cd repo_master
git init --bare
cd ../repo_new
git push --set-upstream origin master
git push

REM root-commit
cd ..
mkdir repo_test
cd repo_test
git init
touch rand.txt
git add .
git commit -m "aaa"
git remote add origin " ../repo_master "
git push --set-upstream origin master
cd ..
rm - rf repo_test

REM clone
git clone "./repo_master" "repo_cloned"
cd repo_cloned
git status

REM conflict
%editor% file.txt
git status
REM roll back to last fixed version
REM git restore ...
REM auto add all unstaged changes to commit
REM git commit -a
git add .
git commit -m "second"
git push
cd ../ repo_new
%editor% file.txt
git add .
git commit -m "other second"
git push
git pull
REM conflict resolution
%editor% file.txt
git add file.txt
git commit -m "merged"
git status
git push

REM history
git log