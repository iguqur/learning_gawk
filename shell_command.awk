#!/usr/bin/awk -f

# 在awk中使用shell命令
# ll 添加一列输出文件的绝对位置
# 
# 操作如下：
#
# » ll | awk -f shell_command.awk                                                                                                               john@john-pc
# total 12K
# -rwxrwxr-x 1 john john 1.4K 9月  28 21:08 covert_string_to_number.awk /home/john/my_project/learning_gawk/covert_string_to_number.awk
# -rw-rw-r-- 1 john john  744 9月  28 21:34 README.md /home/john/my_project/learning_gawk/README.md
# -rw-rw-r-- 1 john john  170 10月 25 22:28 shell_command.awk /home/john/my_project/learning_gawk/shell_command.awk

{
    if (NR > 1) { # 跳过第一行
    "readlink -f " $9 | getline filepath; print $0 " " filepath
    } else {
        print $0
    }
}