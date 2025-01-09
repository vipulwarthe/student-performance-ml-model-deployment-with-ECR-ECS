# Student-Performance
### deploy end to end student performance ML model with AWS ECR and AWS ECS

    Krish naik Repo link: https://github.com/krishnaik06/mlproject/
    ARCHNA Repo link- https://github.com/swapnil123kapile/MLProjects-archana
    vipul repo link:  https://github.com/vipulwarthe/student-performance

### First we Create instance with ubuntu AMI with t2.medium instance type with 30GB storage and sg-SSH/All Traffic-anywhere 

    sudo apt-get update && sudo apt-get upgrade -y    (download packages information and downloads and installs the updates for each outdated package and dependency on 
    your system)
       
    sudo apt install python3-venv -y          (install python environment)

    python3 -m venv MLPRO                     (create an isolated Python environment)

    source MLPRO/bin/activate                 (activate envirnoment mlpro env)

    mkdir mlproject                           (create one project directory)

    cd mlproject                              (enter in project directory)

### Login to your github account and create a new repo and paste cmds from github repo:

    echo "# End-to-end-ML-Project" >> README.md

    git add README.md

    git commit -m "First Commit"

    git status

    git branch -M main

    git branch

    git remote add origin https://github.com/vipulwarthe/mlproject.git

    git push -u origin main

    git remote -v    (additional command)

### Create .gitignore file with python template in mlproject repo on github

    git pull                     (It will pull the .gitignore file in VScode mlproject repo)

### create setup.py and requirements.txt in mlproject repo add a code in setup.py & requirements.txt

* setup.py will be responsible in creating my ML application as a package
* Now run below command first

      pip install -r requirements.txt 

      git status

      git add .

      git commit -m "Setup"

      git push -u origin main

### Create src (source) folder in mlproject and create below files in src on vs code add the code (this is the source file which help to manage the ml model)

    __init__.py               # in src
    logger.py
    exception.py
    utils.py

### create "components" (folder) in src folder & Create below files in components folder and add the code 

    __init__.py               # in components folder
    data_ingestion.py
    data_transformation.py
    model_trainer.py

### create "pipeline" (folder) in src & Create below files in pipeline folder and add the code (we train and predict the model)

    __init__.py              # in pipeline folder
    train_pipeline.py
    predict_pipline.py

* Now run below command it will generate the logs

      python3 src/logger.py
      pip install scikit-learn==1.1.3        (use below command before run data_ingestion.py file)
      git status
      git add .
      git commit -m "Logging and Exception"
      git push -u origin main

* Now check in git repo you will see all the files which you have commited and push.

### Create "notebook" folder in mlproject & drag and drop below two ipynb notebook files in it.

1 .EDA STUDENT PERFORMANCE.ipynb

2 .MODEL TRAINING.ipynb

### Create folder named "data" in "notebook" folder & drag and drop below "stud.csv" file in it.

* Now select the 1 & 2 .ipynb files, select the kernel 3.10 as per suggestion and run these files. if both files run successfully run 125 command on terminal and follow the next commands as mentioned.

* below commands for installtion of jupyterlab on server and run locally into the browser.
  
      pip3 install jupyterlab
      jupyter lab

### if above 2 commands not works for installtion of jupytelab then open new terminal and use below commands:

    source /home/ubuntu/MLPRO/bin/activate
    cd mlproject
    pip3 install jupyterlab
    sudo apt install jupyter-notebook
    jupyter notebook --generate-config
    jupyter notebook password    (create new password)
    jupyter-lab --ip 0.0.0.0 --no-browser --allow-root  

### Add new 2nd terminal if jupyther notebook is open on vscode.

    source MLPRO/bin/activate
    cd mlproject/ 
    git status
    git add .
    git commit -m "EDA and Problem Statement"
    git push -u origin main
    python src/components/data_ingestion.py
    git add .
    git commit -m "Data Ingestion"
    git push -u origin main
    python src/components/data_transformation.py
    python src/components/data_ingestion.py
    git status
    git add .
    git commit -m "Data Transformation Done"
    git push -u origin main
    python src/components/model_trainer.py 
    python src/components/data_ingestion.py
    git status
    git add .
    git commit -m "Model Training"
    git push -u origin main

### create one "templates" folder and create 2 files "index.html" and "home.html" and html code for application

* create "application.py" file in mlproject folder and paste the codes
       
* make some changes in code in last line -- add debug=True, port=5000 and run below command

      python application.py

* Above command redirect to the browser  (http://127.0.0.1:5000/predictdata)  or you can copy Public IP:5000 and paste it in browser

### Deploy application using AWS ECR and AWS ECS:

* First Launch the instace with ubuntu server and create the python environment and activate the environment.
* install Docker and AWS CLI on your server and configure AWS with your secret key and access key.
* Create one Repo in ECR and use push commands and run on terminal so it will create the docker image and push into the ECR repo.

### Go to the AWS ECR - 
-Create private repository - Name - sp-repo 
-Image tag mutability - Mutable 
-Encryption settings - AES-256 - Create
-select the repo and click on view push commands 

### Now create ECS Cluster 

-> give any name -> Go to ECS and create cluster -> Cluster configuration -> Go to ECS and create cluster -> Cluster configuration

-> Cluster name -> sp-cluster -> Default namespace -> optional

-> Infrastructure -> AWS Farget (serverless) -> other setting keep default (optional)

-> create  (it will take few minutes to create)

-> go to the task defination -> create new task defination

-> Task definition configuration -> Task definition family -> new-sp-task

-> Infrastructure requirements -> Launch type -> AWS Farget

-> other configuration keep default

-> Task roles -> conditional -> () -> Task execution role -> create new role

-> container 1 -> container details -> Name -> sp-repo -> Image URI - (paste image uri from ecr repo) - Essential container - yes

-Port mappings - add port - 5000 - TCP - HTTP 

-Resource allocation limits - conditional - cpu -1 , GPU -1 , Memory hard limit - 3, memory soft limit-1

-Environment variables - optional - Log collection - untick 

-other setting optional keep as it is - create

-you will see Task definition successfully created
-Now go to cluster and click on it - click on Task - Run new Task - 
-Now click on Deploy - Run task

-Create - Environment - Existing cluster - mycluster

-Compute configuration (advanced) - Compute options - Capacity provider strategy

-Capacity provider strategy - Use custom

-capacity provider - FARGET - Platform - latest

-Deployment configuration - Task 

-Family - new-sp-task  - Revision - 2 (latest) 

-Desired tasks - 1 - Task group - blank 

-Networking - select default VPC/default subnets/

-add existing security group

-other setting keep default - create   (Task launched)

-Now wait for Task status should be Running (refresh the task so it will running in state)

-click and open running task it will show you the task overview page

-copy the public IP and paste it in browser along with 5000 port and /predictdata

-you will see your application successfully running on Microsoft edge browser.


### Commands that we need to use for this project:

        sudo apt-get update
        sudo apt install python3-venv -y
        python3 -m venv MLPRO
        source MLPRO/bin/activate

### Install Docker:

        sudo vi docker.sh     (Paste below cmds in docker.sh file and save and quit with Esc :wq)
     
        # Add Docker's official GPG key:
        sudo apt-get update
        sudo apt-get install ca-certificates curl
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc

        # Add the repository to Apt sources:
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
        sudo apt install docker.io -y
        docker --version
        sudo usermod -aG docker $USER
        sudo chown $USER /var/run/docker.sock
        sudo systemctl start docker
        sudo systemctl enable docker
        sudo systemctl status docker

     
        sudo chmod +x docker.sh
        ./docker.sh 

 ### Install AWS CLI:
 
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        sudo apt install unzip
        unzip awscliv2.zip
        sudo ./aws/install
        /usr/local/bin/aws --version
        aws configure    (add secret key and secret access key and region)
    
 ### Clone the github repo:
      
        git clone https://github.com/vipulwarthe/student-performance-ml-model-deployment-with-ECR-ECS.git
        ls
        cd student-performance-ml-model-deployment-with-ECR-ECS/
  
 ### Add below push commands from ECR repo:
    
        17  aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 717279727098.dkr.ecr.us-east-1.amazonaws.com
        18  docker build -t sp-repo .
        19  docker tag sp-repo:latest 717279727098.dkr.ecr.us-east-1.amazonaws.com/sp-repo:latest
        20  docker push 717279727098.dkr.ecr.us-east-1.amazonaws.com/sp-repo:latest
        21  docker images   (check the docker image)


### Deletion Process:

-First stop the task

-deregister the task defination - delete the task defination

-Delete cluster

-Delete Image and delete Repo

-Delete IAM Role related to ECS

-Terminate the EC2 instance










