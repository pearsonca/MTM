# GitHub practical

## BEFORE YOU START ##

1. Check if git is installed. Go to a Command Prompt window and type: `git --version`
2. _If step 1 does not report a version_: go to https://git-scm.com/download, download appropriate version for your computer, and install accepting the default options.
3. Create a github account at https://github.com/join
4. Download GitHub Desktop from https://desktop.github.com/
5. Open it, and sign in using your GitHub account

## PART 1: WORKING ON YOUR OWN ##

1. Open GitHub Desktop
2. There should be 4 options underneath “Let’s get started!”
3. Click “Create a New Repository on your Hard Drive”
4. Fill in the details about your new repository
5. Create Repository
6. Once you’ve created it, it asks if you would like to publish to GitHub. Say yes!
7. What happened now? Hint: check on GitHub.com in your account
8. The app asks if you want to view the Files in the repository
9. Say yes. Is there anything there?
10. Go back to RStudio, and create a new R script. Write something, then save the script into the repository. 
11. What has happened in the GitHub Desktop app?
12. Now we are going to commit this change. In the app make sure the file is selected in the check box. Write a commit message (make it useful, but not too long). Press commit.
13. What has happened? Has the file appeared on GitHub.com? 
14. The blue button asks if you want to push to the origin. Say yes.
15. What has happened now? Has the file appeared on GitHub.com? Can you see the commit message?
16. Go back to RStudio. Make some changes to the script. Save it. 
17. Check in the GitHub app. What has happened? 
18. Add a commit message, commit, and push. 
19. Go back to RStudio, make another script and save it in the same folder.
20. Commit and push.

### Now what?

1. Find the repository folder. 
2. DELETE IT!
3. Go back to the GitHub app. What does it say?
4. Press “Clone again”.
5. What has happened?

### What if the repository exists on Github but you want to work on a different computer?

1. Delete the repository folder again.
2. In the app, this time click “remove”.
—> OH NO! (or is it…)
3. Back at the main menu, click “Clone a Repository from the Internet”
4. Select the URL tab, and put in the URL of the repository on GitHub, click Clone.
5. Check for the folder on your computer.
It’s back! (or it should be)

If you were working on this analysis on 2 (or more) computers, git can help you stay up to date.
But, the difference is you need the “Pull” button as well.
What does this do? 

Key points:

 - Whenever you save a file in the repository (the special folder) the App will track it.
 - If you want to keep those changes, commit and push them to GitHub.com.
 - Write a useful commit message for each one, to help you remember what they do.
 - Make each commit quite small (~2-5 per day, if you’re doing analysis all day)
 - More than 1 person can do this at the same time and it will help you keep track of all the changes.

Extension:
What does Git Ignore do?

## PART 2: PAIR EXERCISE ##

1. Invite your partner to your repository
2. Modify the file in this repository and then save, commit and push it.
3. Now the partner should check if they have the changes. No!
4. They need to “Pull” changes from Github.com. Find the right button, and click it.
5. Do the same, but for the other partner.
6. Next, both edit the same file, commit the changes, and both push at the same time.
7. What has happened? 

You’ve got a merge conflict!

8. Follow the instructions to choose the lines you want to keep in the file
9. Then commit and merge! And push the commit.
10. Check on github.com how this looks in the commit log.
11. Both pull and check what the file looks like now.

Well done!
