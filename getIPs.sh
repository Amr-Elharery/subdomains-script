(
echo "Prepared by"
echo "=================================="
echo "===========Amr Elharery==========="
echo "===========Ahmed Megzoo==========="
echo "=================================="

echo "  \ "
echo "   \ "
echo "      .--."
echo "     |o_o |"
echo "     |:/ |"
echo "    //   \ "
echo "   (|     | )"
echo "  /'_   /\`"
echo "  _)=(/"


echo "Domain you want to get subdomain"
read  domain

mkdir output
cd output
wget $domain.com -O $domain.html

cat $domain.html | grep "href=" | cut -d "/" -f3 | cut -d '"' -f2 | grep $domain.com | sort -u > $domain-IPs.txt

urls=`cat $domain-IPs.txt`

for url in $urls
do
	if [ $url ]
	then
		echo $url Has IP
		
		host $url | grep "has address" | cut -d " " -f4
		
		host $url | grep "has address" | cut -d " " -f4 >> $domain-result.txt
		
		echo ------
	else
		echo "Error, may be there are no sub domains."
		exit
	fi
done

echo Saved in $domain-result.txt
)
