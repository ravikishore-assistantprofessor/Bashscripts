awk '
FNR == 1 {
    # At the start of each file: reset line column count tracking
    if (NR == 1) {
        expected_cols = NF      # columns in the very first file
    }
    file_has_error = 0
}

{
    if (NF != expected_cols) {
        if (!file_has_error) {
            print "File with misaligned columns:", FILENAME
            print "  Expected columns:", expected_cols
            file_has_error = 1
        }
        print "    Line", FNR, "has", NF, "columns →", $0
    }
}
' FS='[ \t]+' *.txt

