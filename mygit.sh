# DON'T TOUCH THE IF SENTENCE. Validating the number of parameters. You have to edit nothing
if [ $# -lt 2 ]; then
   echo Invalid number of parameters
   exit 1
fi

# Run a command on the left to check that the folder .git exists
git status &> /dev/null

# DON'T TOUCH THE IF SENTENCE. Validating that we are in a git folder
if [ $? -gt 0 ]; then
   echo Your current folder does not contain a Git repository
   exit 2
fi

# Run a command between `` to get the URL of your remote GitHub repository
#Just manually copy & paste the url from my git reposiroty at git hub page, the HTTPS ones
url=`git config --get remote.origin.url`

# DON'T TOUCH THE IF SENTENCE. Validating that your repository is synchronized with GitHub
if [ -z "$url" ]; then
   echo No remote URL from GitHub
   exit 3
fi

# Variables to store the arguments
main=$1
new_branch=$2

# Run a command on the left to check out your main/master branch
git checkout main &> /dev/null

# DON'T TOUCH THE IF SENTENCE. Validating the main or master exists
if [ $? -gt 0 ]; then
   echo Your main/master branch does not exist
   exit 4
fi

# Then, continue with the following requirements

#Creating the function 
gitAutomateScript(){
   git checkout $1
   git checkout -b $2
   mkdir $2
   git add $2
   git commit -m "New branch called $2"
   git push --set-upstream origin $2
   exit 5
}
