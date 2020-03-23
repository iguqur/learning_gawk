#!/usr/bin/awk -f

BEGIN {
    FS = ","
    is_valid_line = 0
    id = 5301
}

{    
    if ($2 ~ /0x0001/) { 
        is_valid_line = 1
    } else if(is_valid_line && length($3) == 0) {
        exit 0
    }

    if (is_valid_line) {
        str = id ",mc." substr($6, 4) "," $7 ",0,0,,int,," $7 ",20,,,1"
        print str

        ++id
    }
}