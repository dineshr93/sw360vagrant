sudo apt-get update
sudo apt-get install default-jre
sudo apt-get install default-jdk

echo "Checking java home=============================="
echo $JAVA_HOME

sudo apt-get install couchdb -y

sudo wget https://raw.githubusercontent.com/dineshr93/sw360vagrant/master/download-packages.sh

sudo bash liferay-install.sh
sudo bash install-lucene.sh
sudo bash install-bundle-deps.sh
sudo bash etcsw360Prepare.sh

cd /

sudo git clone https://github.com/dineshr93/sw360.git
git checkout sw360-8.2.0-M1

cd sw360
sudo mvn package -P deploy -Dbase.deploy.dir=. -Dliferay.deploy.dir=/opt/liferay-ce-portal-7.2.1-ga2/deploy -Dbackend.deploy.dir=/opt/liferay-ce-portal-7.2.1-ga2/tomcat-9.0.17/webapps -Drest.deploy.dir=/opt/liferay-ce-portal-7.2.1-ga2/tomcat-9.0.17/webapps -DskipTests
