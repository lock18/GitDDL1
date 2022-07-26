#!/usr/bin/env groovy
import hudson.model.*
import hudson.EnvVars
import groovy.json.JsonSlurper
import groovy.json.JsonBuilder
import groovy.json.JsonOutput
import java.net.URL

String ISPW_Application     = "DDL1"        // Change to your assigned application
String HCI_Token            = "pmiddl0"     // Change to your assigned ID

node {
  stage ('Checkout')
  {
    // Get the code from the Git repository
    checkout scm
  }

  stage('Git to ISPW Synchronization')
  {
    gitToIspwIntegration app: "${ISPW_Application}",
    branchMapping: '''*main* => STG, per-branch'
    bug* => EMR, per-branch
    feature1* => QA1, per-branch
    feature2* => QA2, per-branch
    feature3* => QA3, per-branch''',
    //connectionId: '38e854b0-f7d3-4a8f-bf31-2d8bfac3dbd4', // CWC2
    connectionId: '91bae501-8b4d-4155-909d-2ad5aa9f3131', // Demo-CWCC
    credentialsId: "${HCI_Token}",
    gitCredentialsId: 'f710d911-5797-48ae-a5b8-6e2f3c31b3d1', // lock18
    gitRepoUrl: 'https://github.com/lock18/GitDDL1.git',
    //runtimeConfig: 'isp8', // CWC2
    runtimeConfig: 'ispw', // CWCC
    stream: 'FTSDEMO'
  }

  stage('Build ISPW assignment')
  {
    //ispwOperation connectionId: '38e854b0-f7d3-4a8f-bf31-2d8bfac3dbd4', // CWC2
    ispwOperation connectionId: '91bae501-8b4d-4155-909d-2ad5aa9f3131', // Demo-CWCC
    consoleLogResponseBody: false,
    //credentialsId: 'CWEZXXX-CES', // CWC2
    credentialsId: 'pmiddl0-CES', // CWCC
    ispwAction: 'BuildTask',
    ispwRequestBody: '''buildautomatically = true'''
  }

  stage('Deploy to Testing')
  {
    sleep(7)
    println "Deploy successfull!"
  }

  stage('Run TTT Tests')
  {
    sleep(10)
    println "TTT Tests successfull!"
  }

  stage('Retrieve Code Coverage')
  {
    sleep(5)
    println "Retrieve code successfull!"
  }

  stage('Run Sonar Analysis')
  {
    sleep(12)
    println "Sonar analysis successfull!"
  }


}