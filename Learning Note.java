Git �̳� from ��ѩ����ʦ

/*
 *1.Git���
 *1.1��װgit
 */
git config --global user.name "changlong"
git config --global user.email "aflybird.long@gmail.com"
// ע�⣺git config�����--global���������������������ʾ����̨���������е�Git�ֿⶼ��ʹ���������

/*
 *1.2�����汾��
 */
mkdir learngit //mkdir�������ڴ���learngit�ļ��С�
cd learngit 
pwd //pwd����������ʾ��ǰĿ¼��
git init //��ʼ��һ��Git�ֿ⣬ʹ��git init���
ls -ah //��ʾ����git init��������ɵ����ص�.git�ļ���
//����ļ���Git�ֿ⣬��������1.ʹ������git add <file>��ע�⣬�ɷ������ʹ�ã���Ӷ���ļ���
git add readme.txt
//2.ʹ������git commit -m <message>����ɡ�
git commit -m "commit message"
/*
ע�⣺
1.����ύʱ��֮ǰ�汾û���κβ�ͬ��û�жԹ��������κ��޸ģ����򲻻��ύ������ 
On branch master
nothing to commit, working tree clean

2.����ύ��������git add <file>����ʱ��<file>�Ĵ�Сд�뱾�ص��ļ�����Сд��ͬ���򲻻��ύ������
On branch master
Changes not staged for commit:
        modified:   README.txt
*/

/*
 *2.ʱ�⴩���
 *2.1 �汾����
 */
//Git���������ڰ汾����ʷ֮�䴩��ʹ������git reset --hard commit_id��
/*
��Git�У���HEAD��ʾ��ǰ�汾��Ҳ�������µ��ύ1094adb...��
��һ���汾����HEAD^������һ���汾����HEAD^^��
����100���汾д100��^�Ƚ�������������������д��HEAD~100��
*/
git reset --hard commit_id
//����ǰ����git log���Բ鿴�ύ��ʷ���Ա�ȷ��Ҫ���˵��ĸ��汾��HEADָ��İ汾���ǵ�ǰ�汾
git log
//����������Ϣ̫�࣬���Լ���--pretty=oneline������ÿ���ύ��������ʾ��һ���ϡ�
git log --pretty=oneline
//Ҫ�ط�δ������git reflog�鿴������ʷ���Ա�ȷ��Ҫ�ص�δ�����ĸ��汾��
git reflog

/*
 *2.2���������ݴ���
 */
 /*
 ��������Working Directory���������ڵ������ܿ�����Ŀ¼��
 �汾�⣨Repository����������һ������Ŀ¼.git��������㹤����������Git�İ汾�⡣
 Git�İ汾������˺ܶණ������������Ҫ�ľ��ǳ�Ϊstage�����߽�index�����ݴ�����
 ����GitΪ�����Զ������ĵ�һ����֧master���Լ�ָ��master��һ��ָ���HEAD��
 git add �����Ҫ�ύ���ļ��޸�ͨͨ�ŵ��ݴ�����git commit����һ�����ύ�ݴ����������޸�����ǰ��֧��
*/
git status //�鿴��ǰ״̬���鿴����Щ�ļ����޸ģ���

/*
 *2.3�����޸�
 */
//ÿ���޸ģ��������git add���ݴ������ǾͲ�����뵽commit�С�

/*
 *2.4�����޸�
 */
/*
����1����������˹�����ĳ���ļ������ݣ���ֱ�Ӷ������������޸�ʱ��
������git checkout -- file��

����2�����㲻�������˹�����ĳ���ļ������ݣ�����ӵ����ݴ���ʱ���붪���޸ģ�
����������һ��������git reset HEAD <file>���ͻص��˳���1���ڶ���������1������

����3���Ѿ��ύ�˲����ʵ��޸ĵ��汾��ʱ����Ҫ���������ύ��
�ο� ��2.1�汾���ˡ� һ�ڣ�����ǰ����û�����͵�Զ�̿⡣
*/