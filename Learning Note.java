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
1.如果提交时与之前版本没有任何不同，则不会提交并提醒 
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