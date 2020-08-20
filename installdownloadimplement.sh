sudo apt-get update
sudo apt-get install default-jre
sudo apt-get install default-jdk

echo "Checking java home=============================="
echo $JAVA_HOME

echo "Checking & installing couchdb=============================="
sudo apt-get install couchdb -y



sudo wget -P /requiredswforsw360 https://raw.githubusercontent.com/dineshr93/sw360vagrant/master/download-packages.sh
echo "Downloading packages=============================="
cd requiredswforsw360/

sudo bash download-packages.sh
echo "Downloaded all packages=============================="
cd packages/
sudo bash liferay-install.sh
echo "Completed liferay-install.sh=============================="
sudo bash install-lucene.sh
echo "Completed install-lucene.sh=============================="
sudo bash install-bundle-deps.sh
echo "Completed install-bundle-deps.sh=============================="
sudo bash etcsw360Prepare.sh
echo "Completed etcsw360Prepare.sh=============================="

cd /

echo "Cloning https://github.com/eclipse/sw360.git=============================="
sudo git clone https://github.com/eclipse/sw360.git
echo "git checkout sw360-8.2.0-M1=============================="
sudo git checkout sw360-8.2.0-M1

cd sw360
echo "mvn package -P deploy==========================="
sudo mvn package -P deploy -Dbase.deploy.dir=. -Dliferay.deploy.dir=/opt/liferay-ce-portal-7.2.1-ga2/deploy -Dbackend.deploy.dir=/opt/liferay-ce-portal-7.2.1-ga2/tomcat-9.0.17/webapps -Drest.deploy.dir=/opt/liferay-ce-portal-7.2.1-ga2/tomcat-9.0.17/webapps -DskipTests
