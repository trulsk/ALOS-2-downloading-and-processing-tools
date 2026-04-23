#!/bin/sh
while read p; do
        echo  "Downloading $p"
        curl -k -l -s "sftp://ftp.gportal.jaxa.jp:2051/$p/" --user "USERNAME:PASSWORD" >> PATH/TO/IDS.TXT
        while read q; do

                if [ "$q" != "." ] && [ "$q" != ".." ];
                then

                curl -k -C - "sftp://ftp.gportal.jaxa.jp:2051/$p/$q" --user "USERNAME:PASSWORD" >> PATH/TO/DOWNLOADS/$q

                fi

        done PATH/TO/IDs.txt

        rm PATH/TO/IDs.txt
        
done <orders_list.txt

# end of file
