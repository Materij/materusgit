FROM centos:latest

RUN yum install epel-release -y \
	curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
	yum install git \
	mkdir mytemp && cd mytemp \
	git clone https://github.com/Materij/materusgit.git \
	yum install nodejs
	
RUN npm install -g create-react-app \
	create-react-app myapp && cd myapp \
	npm install @material-ui/core typescript \
	npm install editorconfig

RUN cd src \
	mv App.js App.js.old \
	cp /mytemp/materusgit/App.js . && cd ..

ENV PORT 80

CMD ["npm start"]
