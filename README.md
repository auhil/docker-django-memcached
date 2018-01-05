#开启docker服务
	docker service start

#构建docker镜像(进入Dockerfile所在目录)
	docker build -t auhil .

#打包docker镜像
	docker save -o auhil.tar auhil

#导入docker镜像
	docker load < auhil.tar

#启动auhil镜像
	docker run --name auhil -itd -p 80:80 -v /root/auhil/:/var/www/html/auhil --privileged=true auhil

#启动镜像中的memcached
	docker exec -d auhil memcached -d -u root

#启动镜像中的httpd
	docker exec -d auhil httpd

#进入镜像的bash（exit退出）
	docker exec -it auhil /bin/bash

#httpd参数：
	httpd -k start|stop|restart
