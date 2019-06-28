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
# 要关联一个远程库，使用命令git remote add origin git@server-name:path/repo-name.git；
git remote add origin git@github.com:aflybird2468/learngit.git
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

