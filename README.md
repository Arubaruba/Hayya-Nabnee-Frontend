#Hayya Nabnee Frontend

A website that helps volunteers find building projects

Works with [Hayya-Nabnee-Backend](https://github.com/Arubaruba/Hayya-Nabnee-Backend)


##How to set it up (Ubuntu)

0. Install Nginx: ```sudo apt-get install nginx```
0. Open **nginx.conf**, replace */home/andreas/Git/Hayya-Nabnee-Frontend* (2 Occurences)
 with the path to where you unzipped this repository
0. ```sudo cp nginx.conf /etc/nginx/sites-available/```
0. ```sudo restart nginx```
0. Test frontend, go to: [http://localhost:5667](http://localhost:5667)
0. [Set up backend server](https://github.com/Arubaruba/Hayya-Nabnee-Backend#how-to-set-it-up-ubuntu)
