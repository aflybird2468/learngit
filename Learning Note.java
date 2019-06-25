Git 教程 from 廖雪峰老师

/*
 *1.Git简介
 *1.1安装git
 */
git config --global user.name "changlong"
git config --global user.email "aflybird.long@gmail.com"
// 注意：git config命令的--global参数，用了这个参数，表示你这台机器上所有的Git仓库都会使用这个配置

/*
 *1.2创建版本库
 */
mkdir learngit //mkdir命令用于创建learngit文件夹。
cd learngit 
pwd //pwd命令用于显示当前目录。
git init //初始化一个Git仓库，使用git init命令。
ls -ah //显示运行git init命令后生成的隐藏的.git文件。
//添加文件到Git仓库，分两步：1.使用命令git add <file>，注意，可反复多次使用，添加多个文件；
git add readme.txt
//2.使用命令git commit -m <message>，完成。
git commit -m "commit message"
/*
注意：
1.如果提交时与之前版本没有任何不同（没有对工作区做任何修改），则不会提交并提醒 
On branch master
nothing to commit, working tree clean

2.如果提交中在运行git add <file>命令时的<file>的大小写与本地的文件名大小写不同，则不会提交并提醒
On branch master
Changes not staged for commit:
        modified:   README.txt
*/

/*
 *2.时光穿梭机
 *2.1 版本回退
 */
//Git允许我们在版本的历史之间穿梭，使用命令git reset --hard commit_id。
/*
在Git中，用HEAD表示当前版本，也就是最新的提交1094adb...，
上一个版本就是HEAD^，上上一个版本就是HEAD^^，
往上100个版本写100个^比较容易数不过来，所以写成HEAD~100。
*/
git reset --hard commit_id
//穿梭前，用git log可以查看提交历史，以便确定要回退到哪个版本。HEAD指向的版本就是当前版本
git log
//如果嫌输出信息太多，可以加上--pretty=oneline参数，每次提交的内容显示在一行上。
git log --pretty=oneline
//要重返未来，用git reflog查看命令历史，以便确定要回到未来的哪个版本。
git reflog

/*
 *2.2工作区和暂存区
 */
 /*
 工作区（Working Directory）就是你在电脑里能看到的目录。
 版本库（Repository）工作区有一个隐藏目录.git，这个不算工作区，而是Git的版本库。
 Git的版本库里存了很多东西，其中最重要的就是称为stage（或者叫index）的暂存区，
 还有Git为我们自动创建的第一个分支master，以及指向master的一个指针叫HEAD。
 git add 命令将需要提交的文件修改通通放到暂存区，git commit命令一次性提交暂存区的所有修改至当前分支。
*/
git status //查看当前状态（查看有哪些文件被修改）。

/*
 *2.3管理修改
 */
//每次修改，如果不用git add到暂存区，那就不会加入到commit中。

/*
 *2.4撤销修改
 */
/*
场景1：当你改乱了工作区某个文件的内容，想直接丢弃工作区的修改时，
用命令git checkout -- file。

场景2：当你不但改乱了工作区某个文件的内容，还添加到了暂存区时，想丢弃修改，
分两步，第一步用命令git reset HEAD <file>，就回到了场景1，第二步按场景1操作。

场景3：已经提交了不合适的修改到版本库时，想要撤销本次提交，
参考 《2.1版本回退》 一节，不过前提是没有推送到远程库。
*/