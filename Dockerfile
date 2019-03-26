FROM centos:7.4.1708

RUN yum install wget curl which -y \
	&& wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
	&& yum localinstall epel-release-latest-7.noarch.rpm -y \
	&& wget https://centos7.iuscommunity.org/ius-release.rpm \
	&& yum localinstall ius-release.rpm -y \
	&& yum install git2u-all.noarch -y \
	&& mkdir /mytemp && cd /mytemp \
	&& git clone https://github.com/Materij/materusgit.git
	
WORKDIR /

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
	&& yum install nodejs -y \
	&& npm install -g create-react-app \
	&& create-react-app myapp && cd /myapp \
	&& npm install @material-ui/core typescript \
	&& npm install editorconfig

WORKDIR /myapp/src
	
RUN mv App.js App.js.old \
	&& cp /mytemp/materusgit/App.js .

ENV PORT 80

WORKDIR "/myapp"

CMD ["npm","start"]
