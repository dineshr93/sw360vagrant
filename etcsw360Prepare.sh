set -e
sudo mkdir /etc/sw360
cd /etc/sw360
wget 'https://github.com/dineshr93/sw360/raw/master/build-configuration/resources/couchdb.properties'
wget 'https://github.com/dineshr93/sw360/raw/master/build-configuration/resources/search.properties'
wget 'https://github.com/dineshr93/sw360/raw/master/build-configuration/resources/sw360.properties'

sudo mv /etc/couchdb/local.ini /etc/couchdb/.localini

wget -O local.ini -P /etc/couchdb/ 'https://github.com/dineshr93/sw360vagrant/raw/master/puppet/modules/sw360/templates/couchdb_local.ini.erb'
