### Learn git and github

- What is git? Why we use it?
- Common git commands
- Remote git repository

#### install git and environmental setup

#### git setup  

```sh
# tell git who you are
git config --global user.name "Zenith Nobel"
git config --global user.email "ZN@msu.edu"
git config --global color.ui true
git config --global core.editor vim

```
#### Start git

```sh
git init # to start a git repository

# Another way to start a repo
git clone git://github.com/lh3/seqtk.git
```
#### Track files in git  
git add and git status

```sh
echo 'Hello world!' >> README
echo 'unstaged' >> unstage.txt
git status
git add README
git status
```
#### git commit - Take a snapshot of your project

```sh
git commit -m 'initial commit'
```

#### git diff - See the differences
```sh
# append information to README
echo '##Project Fusarium' >> README
git diff

# see more history
git log
git log --pretty=oneline --abbrev-commit
git commit -a -m 'add project title to the README file'
```

#### git mv and git rm - manipulate file within git folder

```sh
git mv README REAME.md

git status
git commit -m 'add markdown extension to README'
```
#### .gitignore - tell git what to ignore

```sh
#vim .gitignore
echo '*.dat' >> .gitignore
git add .gitignore
```

#### git reset - undoing a stage

```sh
echo '- TODO: bring a cake' >> README.md
git add README.md
git status

git reset HEAD README.md
git status
```
#### git push and git pull - use git remotely
- You will need to have a github or bitbucket account
- create a repository at 

```sh
git remote add origin git@github.com:wjidea/gitLearn.git
git remote -v
git push origin master
```