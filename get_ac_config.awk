#!/usr/bin/awk -f

BEGIN {
    FS = ","
    is_valid_line = 0
    id = 5501
}

{    
    if ($2 ~ /0x0080/) { 
        is_valid_line = 1
    } else if(is_valid_line && $2 == "0x0100") {
        exit 0
    }

    if (is_valid_line && $6 != "") {
        str = id ",ac." $6 "," $7 ",0,0,,int,," $8 ",20,,,1"
        print str

        ++id
    }
}