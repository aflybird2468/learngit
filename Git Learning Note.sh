####    Git 教程 from 廖雪峰老师    ####
     
####    1.Git简介   ####
####    1.1安装git  ####
git config --global user.name "changlong"
git config --global user.email "aflybird.long@gmail.com"
# 注意：git config命令的--global参数，用了这个参数，表示你这台机器上所有的Git仓库都会使用这个配置

####    1.2创建版本库   ####
mkdir learngit    # mkdir命令用于创建learngit文件夹。
cd learngit 
pwd    # pwd命令用于显示当前目录。
git init    # 初始化一个Git仓库，使用git init命令。
ls -ah    # 显示运行git init命令后生成的隐藏的.git文件。
# 添加文件到Git仓库，分两步：1.使用命令git add <file>，注意，可反复多次使用，添加多个文件；
git add readme.txt
# 2.使用命令git commit -m <message>，完成。
git commit -m "commit message"
####     注意： ####
# 1.如果提交时与之前版本没有任何不同（没有对工作区做任何修改），则不会提交并提醒 
# On branch master
# nothing to commit, working tree clean
# 2.如果提交中在运行git add <file>命令时的<file>的大小写与本地的文件名大小写不同，则不会提交并提醒
# On branch master
# Changes not staged for commit:
#         modified:   README.txt

   
####    2.时光穿梭机    ####
# 要随时掌握工作区的状态，使用git status命令。
# 如果git status告诉你有文件被修改过，用git diff可以查看修改内容。

####    2.1 版本回退    ####
# Git允许我们在版本的历史之间穿梭，使用命令git reset --hard commit_id。
# 在Git中，用HEAD表示当前版本，也就是最新的提交1094adb...，
# 上一个版本就是HEAD^，上上一个版本就是HEAD^^，
# 往上100个版本写100个^比较容易数不过来，所以写成HEAD~100。
git reset --hard commit_id
# 穿梭前，用git log可以查看提交历史，以便确定要回退到哪个版本。HEAD指向的版本就是当前版本
git log
# 如果嫌输出信息太多，可以加上--pretty=oneline参数，每次提交的内容显示在一行上。
# 参数--pretty=oneline：一行显示，只显示哈希值和提交说明（--online本身也可以作为单独的属性）
git log --pretty=oneline
# 要重返未来，用git reflog查看命令历史，以便确定要回到未来的哪个版本。
git reflog

####    2.2工作区和暂存区   ####
# 工作区（Working Directory）就是你在电脑里能看到的目录。
# 版本库（Repository）工作区有一个隐藏目录.git，这个不算工作区，而是Git的版本库。
# Git的版本库里存了很多东西，其中最重要的就是称为stage（或者叫index）的暂存区，
# 还有Git为我们自动创建的第一个分支master，以及指向master的一个指针叫HEAD。
# git add 命令将需要提交的文件修改通通放到暂存区，git commit命令一次性提交暂存区的所有修改至当前分支。
git status    # 查看当前状态（查看有哪些文件被修改）。

####    2.3管理修改 ####
# 每次修改，如果不用git add到暂存区，那就不会加入到commit中。

####    2.4撤销修改 ####   
# 场景1（撤销工作区的修改）：当你改乱了工作区某个文件的内容，想直接丢弃工作区的修改时
#（此时只是相对于上次commit又修改了某个文件，没有执行git add和git commit命令），
# 用命令git checkout -- file。
# 执行后回到上次git commit状态。
git checkout -- file   
# 场景2（撤销暂存区的修改）：当你不但改乱了工作区某个文件的内容，还添加到了暂存区时
#（此时相对于上次commit，不仅修改了某个文件，还执行了git add命令），想丢弃修改，分两步，
# 第一步用命令git reset HEAD <file>，就回到了场景1，第二步按场景1操作。
git reset HEAD <file>     
# 场景3：已经提交了不合适的修改到版本库时，想要撤销本次提交，
# 参考 《2.1版本回退》 一节，不过前提是没有推送到远程库。
  
####    2.5删除文件 ####
git add test.txt
git commit -m "add test.txt"
rm test.txt    
# 在Git中，删除也是一个修改操作。
# 文件从文件管理器中删除后，工作区和版本库就不一致了。
# 场景1：确实要从版本库中删除该文件
git rm test.txt
git commit -m "remove test.txt"
# 场景2：删错了，撤销工作区的修改，参考 《2.4撤销修改》 一节场景1
git checkout -- test.txt
 
# 注意：从来没有被添加到版本库就被删除的文件，是无法恢复的！
 
####    3.远程仓库  ####
# 注册GitHub账号，创建SSH Key:
ssh-keygen -t rsa -C "youremail@example.com"
# 生成后在用户主目录里可以找到.ssh目录，里面有id_rsa和id_rsa.pub两个文件
# 然后在GitHub上添加公钥id_rsa.pub

####    3.1 添加远程库  ####
# 要关联一个远程库，使用命令git remote add origin git@server-name:path/repo-name.git；，origin为远程库名字
git remote add origin git@github.com:aflybird2468/learngit.git
# 如果在使用命令git remote add时本地库已经关联了一个远程库
# 可以先用git remote -v查看远程库信息（远程库名称 <name> ）
git remote -v
# 可以删除已有的GitHub远程库，name为远程库名称
git remote rm <name>
# 添加多个远程库
git remote add github git@github.com:michaelliao/learngit.git    # 关联GitHub的远程库，远程库的名称叫github
git remote add gitee git@gitee.com:liaoxuefeng/learngit.git    # 关联码云的远程库，远程库的名称叫gitee
# 关联后，使用命令git push -u origin master第一次推送master分支的所有内容；
git push -u origin master
# 此后，每次本地提交后，只要有必要，就可以使用命令git push origin master推送最新修改；

####    3.2 从远程库克隆    ####
# 从GitHub克隆一个远程库到本地,eg:
git clone git@github.com:aflybird2468/gitskills.git     
# GitHub给出的地址不止一个，还可以用
# https:// github.com/aflybird2468/gitskills.git或https:// github.com/aflybird2468/gitskills这样的地址。
# 要克隆一个仓库，首先必须知道仓库的地址，然后使用git clone命令克隆。
# Git支持多种协议，包括https，但通过ssh支持的原生git协议速度最快。
 
####    4.分支管理          ####
####    4.1创建与合并分支   ####
git branch    # 查看分支：
git branch <name>    # 创建分支，<name>为 分支 名字
git checkout <name>    # 切换分支
git checkout -b <name>    # 创建+切换分支
git merge <name>    # 合并某分支到当前分支
# 合并时提示 “Fast-forward” ，这种合并方式是“快进模式”，也就是直接把master指向dev的当前提交，所以合并速度非常快。
# 但这种模式下，删除分支后，会丢掉分支信息。此外，还有其他方式的合并，看下文。
git branch -d <name>    # 删除分支

####    4.2解决冲突 #### 
# 当Git无法自动合并分支时，就必须首先解决冲突。解决冲突后，再提交，合并完成。
# 解决冲突就是：把Git合并失败的文件手动编辑为我们希望的内容，再提交。
# 用git log --graph命令可以看到分支合并图。
# 参数--abbrev-commit：仅显示SHA-1的前几个字符，而非所有的40个字符
git log --graph --pretty=oneline --abbrev-commit

####    4.3分支管理策略 #### 
# 合并分支时，如果可能，Git会用Fast forward模式，但这种模式下，删除分支后，会丢掉分支信息，看不出来做过合并。
# 如果要强制禁用Fast forward模式，Git就会在merge时生成一个新的commit，这样，从分支历史上就可以看出分支信息，能看出来曾经做过合并。
# --no-ff方式的git merge，--no-ff参数，表示禁用Fast forward
git merge --no-ff -m "merge with no-ff" <name>
git log --graph --pretty=oneline --abbrev-commit    # 合并后，用git log 查看分支历史
####    分支策略 ####
# 在实际开发中，我们应该按照几个基本原则进行分支管理：
# 首先，master分支应该是非常稳定的，也就是仅用来发布新版本，平时不能在上面干活；
# 那在哪干活呢？干活都在dev分支上，也就是说，dev分支是不稳定的，到某个时候，比如1.0版本发布时，
# 再把dev分支合并到master上，在master分支发布1.0版本；
# 你和你的小伙伴们每个人都在dev分支上干活，每个人都有自己的分支，时不时地往dev分支上合并就可以了。


####    4.4Bug分支	#### 
#　修复bug时，我们会通过创建新的bug分支进行修复，然后合并，最后删除；
#　当手头工作没有完成时，先把工作现场git stash一下，然后去修复bug，修复后，再git stash pop，回到工作现场。
git stash    # stash功能，可以把当前工作现场“储藏”起来，等以后恢复现场后继续工作
git stash list    # 查看储藏的工作现场
# 恢复工作现场的方式
# 如果你想应用更早的储藏，你可以通过名字指定它，像这样：git stash apply stash@{2}。
# 如果你不指明，Git 默认使用最近的储藏并尝试应用它
git stash apply   # 1.恢复后，stash储藏的内容并不删除，你需要用git stash drop来删除；
git stash drop    # 可以加名字也可以不加，与git stash apply相似
git stash pop    # 2.恢复的同时把stash储藏的内容也删了

####    4.5Feature分支	#### 
# 开发一个新feature，最好新建一个分支；
# 如果要丢弃一个没有被合并过的分支，可以通过git branch -D <name>强行删除。
git branch -D <name>

####    4.6多人协作	#### 
# 要查看远程库的信息，用git remote
git remote
# 或者，用git remote -v显示更详细的信息
git remote -v
####    4.6.1推送分支	####
# 推送分支，就是把该分支上的所有本地提交推送到远程库。推送时，要指定本地分支，这样，Git就会把该分支推送到远程库对应的远程分支上
git push origin master
# 如果要推送其他分支，比如dev，就改成
git push origin dev
# 通常，master、dev等要时刻与远程同步；bug、feature不一定要与远程同步
####    4.6.2抓取分支	####
# 多人协作时，当你的小伙伴的最新提交和你试图推送的提交有冲突，解决办法很简单，Git已经提示我们，
# 先用git pull把最新的提交从origin/dev抓下来，然后，在本地合并，解决冲突，再推送
git pull
 # There is no tracking information for the current branch.
 # Please specify which branch you want to merge with.
 # See git-pull(1) for details.
 # 
 #     git pull <remote> <branch>
 # 
 # If you wish to set tracking information for this branch you can do so with:
 # 
 #     git branch --set-upstream-to=origin/<branch> dev
# git pull也失败了，原因是没有指定本地dev分支与远程origin/dev分支的链接，根据提示，设置dev和origin/dev的链接：
git branch --set-upstream-to=origin/dev dev
#再pull：
git pull
# git pull成功，但是合并可能有冲突，需要手动解决，解决的方法和分支管理中的解决冲突完全一样。解决后，提交，再push

# 因此，多人协作的工作模式通常是这样：
# 首先，可以试图用git push origin <branch-name>推送自己的修改；
# 如果推送失败，则因为远程分支比你的本地更新，需要先用git pull抓取远程的最新提交，并试图合并；
# 如果合并有冲突，则解决冲突，并在本地提交；
# 没有冲突或者解决掉冲突后，再用git push origin <branch-name>推送就能成功！
# 如果git pull提示no tracking information，则说明本地分支和远程分支的链接关系没有创建，用命令git branch --set-upstream-to <branch-name> origin/<branch-name>。
# 这就是多人协作的工作模式，一旦熟悉了，就非常简单。

####    小结	####
# 查看远程库信息，使用git remote -v；
# 本地新建的分支如果不推送到远程，对其他人就是不可见的；
# 从本地推送分支，使用git push origin branch-name，如果推送失败，先用git pull抓取远程的新提交；
# 在本地创建和远程分支对应的分支，使用git checkout -b branch-name origin/branch-name，本地和远程分支的名称最好一致；
# 建立本地分支和远程分支的关联，使用git branch --set-upstream branch-name origin/branch-name；
# 从远程抓取分支，使用git pull，如果有冲突，要先处理冲突。

####    4.7ReBase	####
# 暂时不写

####    5.标签管理	####
# Git的标签就是指向某个commit的指针（跟分支很像对不对？但是分支可以移动，标签不能移动）。
# 通俗来说，tag就是一个让人容易记住的有意义的名字，它跟某个commit绑在一起。

####    5.1创建标签	####
# 创建的标签都只存储在本地，不会自动推送到远程。
# 1.命令git tag <tagname>用于新建一个标签，默认为HEAD（默认标签是打在最新提交的commit上）；
git tag v0.1
# 2.也可以指定一个commit id，通过git log --pretty=oneline --abbrev-commit命令查找历史提交的commit id，敲入命令：
git tag v0.9 commit_id
# 3.创建带有说明的标签，用-a指定标签名，-m指定说明文字
git tag -a 1.0 -m "statement"
# 命令git tag可以查看所有标签。注意，标签不是按时间顺序列出，而是按字母排序的。
git tag
#　查看某个标签的标签信息
git show v1.0

#注意：标签总是和某个commit挂钩。如果这个commit既出现在master分支，又出现在dev分支，那么在这两个分支上都可以看到这个标签。

####    5.2操作标签	####
# 命令git push origin <tagname>可以推送一个本地标签；
git push origin v1.0
# 命令git push origin --tags可以推送全部未推送过的本地标签；
git push origin --tags
# 命令git tag -d <tagname>可以删除一个本地标签；
# 因为创建的标签都只存储在本地，不会自动推送到远程。所以，打错的标签可以在本地安全删除。
# 如果标签已经推送到远程，要删除远程标签就麻烦一点，先从本地删除，然后，从远程删除。删除命令也是push。
git tag -d v0.1
# 命令git push origin :refs/tags/<tagname>可以删除一个远程标签。
git push origin :refs/tags/v0.1

####    6.使用GitHub	####
# 1.在GitHub上，可以任意Fork开源仓库；
# 在某个项目主页点“Fork”，就会在自己账号下克隆出该项目。
# eg: 在Bootstrap项目主页https://github.com/twbs/bootstrap点“Fork”，从自己账号下clone。
git clone git@github.com:aflybird2468/bootstrap.git
# 2。自己拥有Fork后的仓库（自己账号下）的读写权限；
# 一定要从自己的账号下clone仓库，这样你才能推送修改。
# 如果你想修复bootstrap的一个bug，或者新增一个功能，立刻就可以开始干活，干完后，往自己的仓库推送。
# 如果从bootstrap的作者的仓库地址git@github.com:twbs/bootstrap.git克隆，因为没有权限，你将不能推送修改。
# 3.可以推送pull request给官方仓库来贡献代码。
# 如果你希望bootstrap的官方库能接受你的修改，你就可以在GitHub上发起一个pull request。当然，对方是否接受你的pull request就不一定了。

####    7.使用码云	####
# 暂时不写

####    8.自定义Git	####
####    8.1忽略特殊文件	####
# 在Git工作区的根目录下创建一个特殊的.gitignore文件，然后把要忽略的文件名填进去，Git就会自动忽略这些文件。
# GitHub提供的各种配置文件：https://github.com/github/gitignore
# git add一个被.gitignore忽略了的文件到Git，会发现添加不了，如果确实想添加该文件，可以用-f强制添加到Git：
git add -f <file>
# 若发现可能是.gitignore写得有问题，需要找出来到底哪个规则写错了，可以用git check-ignore命令检查
git check-ignore -v <file>
####    小结	####
# 忽略某些文件时，需要编写.gitignore；
# .gitignore文件本身要放到远程版本库里，并且可以对.gitignore做版本管理！

####    8.2配置别名	####
# 告诉Git：以后st就表示status
git config --global alias.st status
# 用co表示checkout，ci表示commit，br表示branch
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
# 在2.4撤销修改一节中，我们知道，命令git reset HEAD file可以把暂存区的修改撤销掉（unstage），重新放回工作区。既然是一个unstage操作，就可以配置一个unstage别名：
git config --global alias.unstage 'reset HEAD'
# 此时，git unstage test.py 命令相当于 git reset HEAD test.py
# 配置一个git last，让其显示最后一次提交信息：
git config --global alias.last 'log -1'
# 此时，git last 命令相当于 git log -l
# 实用，配置一个 git lg，让其图形化显示log，显示效果极佳。
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
####    配置文件	####
# 配置Git的时候，加上--global是针对当前用户起作用的，如果不加，那只针对当前的仓库起作用。
# 配置文件放哪了？每个仓库的Git配置文件都放在.git/config文件中，不加--global就是修改的该文件。
# 别名就在[alias]后面，要删除别名，直接把对应的行删掉即可。
# 当前用户的Git配置文件放在该用户主目录下的一个隐藏文件.gitconfig；加上--global后就是修改的该文件。
# 配置别名也可以直接修改这个文件，如果改错了，也可以删掉文件重新通过命令配置。

####    8.3搭建Git服务器	####
# 暂时不写

####    期末总结	####
# 国外网友制作的Git Cheat Sheet，建议打印出来备用：https://github.github.com/training-kit/downloads/github-git-cheat-sheet.pdf
# Git的官方网站：http://git-scm.com