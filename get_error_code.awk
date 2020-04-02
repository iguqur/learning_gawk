#!/usr/bin/awk -f

FILENAME==ARGV[1]{
    keys[$3] = $1
}

FILENAME==ARGV[4]{ # 处理不同文件
    find = 0
    for (id in keys) {
        if (id + 0. == $1 + 0.) { # 字符串转数字
            print $1, keys[id], $2, $3
            find = 1
            break
        }
    }
    if (find == 0) {
        print $1, "ERROR_CODE_", $2, $3
    }
}

#
# 执行命令如下：
# awk -f get_error_code.awk ~/workspace/sros-resources/error_code/enum.txt FS="\t" OFS="," ~/workspace/sros-resources/error_code/error_code.txt
# 不同文件不同分隔符
#

