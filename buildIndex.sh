#parsing wiki dump
mkdir wiki
cat $1 | python buildInvertedIndexFromWikiDump.py  -o wiki
