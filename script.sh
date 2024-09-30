#step1: checkout

mkdir local-repo
cd local-repo

git init
git clone https://github.com/tajgithub24/helloworld-java.git

#step2: Maven Build
cd helloworld-java
mvn clean package

#step3: Push to nexus
curl -v -u admin:admin@123 --upload-file target/java_war-1.0.0.war http://20.204.135.142:8081/repository/war-files/java-hello-world/java_war-1.0.0.war

#step4: deploy to application server
scp -r target/java_war-1.0.0.war azureuser@52.224.123.132:/home/azureuser/tomcat/webapps

