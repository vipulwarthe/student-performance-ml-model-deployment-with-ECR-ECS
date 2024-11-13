# Student-Performance
### deploy end to end student performance ML model with AWS elastic beanstock and codepipeline##

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
* Create one Repo in ECR - give any name - and use push commands and run on terminal so it will create the docker image and push into the ECR repo.

* Now create ECS Cluster - give any name - 












