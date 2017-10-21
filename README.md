# nginx (warning very outdated and possibly broken)
Nginx reverse proxy using SSL.  

#### For production environments:  
You should first purchase some SSL certs and add them to resources/certs/.  

You're probably asking yourself why should you buy SSL certs when you can generate them. Well in order to answer that I'm going to use a comment I found somewhere on the Internet: "I often wonder why people don't accept my own printed money too ;)" (tgkprog May 22).  

#### Internal/Test environments:  
For testing purposes there's no need to buy an SSL cert, instead you can simply generate your own.  
`openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout resources/certs/cert.key -out resources/certs/cert.crt`  

Answer the questions that come up as best as you can, no need to be too particular.  
Country Name (2 letter code) [AU]:IE  
State or Province Name (full name) [Some-State]:Dublin  
Locality Name (eg, city) []:Dublin  
Organization Name (eg, company) [Internet Widgits Pty Ltd]:  
Organizational Unit Name (eg, section) []:  
Common Name (e.g. server FQDN or YOUR name) []:Ruben  
Email Address []:ruben.example@mail.ie   

#### Enabled new website / Update existing record:  
Enable/update records in the nginx/resources/sites-enabled/ folder.  
You can use "default.com.conf" as a base.  

#### Build/Run:  
Build command: `docker build -t nginx .`  
Run command: `docker run -d --name nginx -p 80:80 -p 443:443 nginx`

### How it all works:  
![alt tag](https://github.com/vasconr2/nginx/blob/master/Stack.png)  

First you will have to get a domain name for your application, configure it to forward request to either your firewall or directly to nginx. In the case you do have firewall, you will have to add a new rule that forwards HTTPS request (any for port 443) to nginx. Nginx will then perform some SSL and reverse proxy magic before redirecting the request to your application.  
