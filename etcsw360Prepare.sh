set -e
sudo mkdir /etc/sw360
cd /etc/sw360
wget 'https://github.com/dineshr93/sw360/raw/master/build-configuration/resources/couchdb.properties'
wget 'https://github.com/dineshr93/sw360/raw/master/build-configuration/resources/search.properties'
wget 'https://github.com/dineshr93/sw360/raw/master/build-configuration/resources/sw360.properties'
wget 'https://github.com/dineshr93/sw360/raw/10.0.0-M1/build-configuration/resources/log4j.properties'
echo "Created etc/sw360 folder & populated!"
sudo mv /etc/couchdb/local.ini /etc/couchdb/.localini

wget -O local.ini -P /etc/couchdb/ 'https://github.com/dineshr93/sw360vagrant/raw/master/puppet/modules/sw360/templates/couchdb_local.ini.erb'
echo "altered etc/couchdb/local.ini file!"
