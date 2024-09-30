#!/usr/bin/env groovy
node {
    def version = readFile('VERSION')
    stage('checkout') {
        checkout scm
    }
    stage('Clean') {
        sh "chmod +x mvnw"
        sh "./mvnw clean"
    }
    stage('Test') {
        try {
            sh "./mvnw test"
        } catch (err) {
            throw err
        } finally {
            junit 'target/surefire-reports/*.xml'
        }
    }
    stage('Package Build') {
        sh "./mvnw -B -DskipTests package"
    }

    /* Building image with scripted pipeline*/
    /* Created from https://jenkins.io/doc/book/pipeline/docker/ */
    stage('Docker Image Build, Tag and Push') {

        docker.withRegistry('', 'dockercredentials-id') {
            def customImage = docker.build("albertolaley/greeting:latest")

            //Push the container to the custom Registry
            customImage.push()
            customImage.push(version)
        }
    }
    stage('Remove unused local image') {
        sh "docker image rm -f albertolaley/greeting:latest"
        sh "docker image rm -f albertolaley/greeting:" + version
    }

    /*Creating images Using docker commands*/
    /*
    stage('Docker Image Build') {
        def customImage = docker.build("greeting:latest")
        //customImage.push('latest')
    }
    stage('Push image to repository') {
        sh "docker login -u albertolaley -p ******* docker.io"
        sh "docker tag greeting:latest albertolaley/greeting:latest"
        sh "docker push  albertolaley/greeting:latest"
    }
     */

}