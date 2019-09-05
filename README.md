#DNB Workshop - Micronaut, Kafka and GraalVM

This is the source for the first DNB Workshop, where you’ll get hands-on experience with Micronaut, an up-and-coming microservice- and/or serverless application framework, Apache Kafka, a stream-processing software, and GraalVM, a virtual machine that runs JavaScript, Python, Ruby, R and JVM-based languages like Java. Throughout the afternoon, you will gradually be introduced to pervasive design patterns alongside both new and mature technologies.

Before attempting up for this workshop, please make sure you’ve installed Git and Docker. If you are running windows, you might consider creating a virtual machine running Ubuntu, using VirtualBox. Unix-based operating systems will run these programs natively.

###Part 0: Setup
To get started, you need to clone the workshop project from GitHub. Run the following command in your terminal, at the location you want the project to be stored.

    git clone https://github.com/dnbdev/workshop-1.git

Move into the newly created folder in your terminal. You’ll find a folder called ‘docker’. Move into it. Here you’ll find a docker-compose file, which contains the definition of a Kafka instance that we will be using later. Assuming you have docker installed, run the following command to launch the containers defined in the compose-file.

    docker-compose up -d

For the actual workshop content and instructions, look in the `instructions` folder.