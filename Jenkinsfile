pipeline {
  agent { label 'Test'}
  stages {
    stage('dotnet restore and build') {
      agent any
      steps {
        sh 'dotnet restore'
        sh 'dotnet msbuild aspnetapp/aspnetapp.csproj'
      }
    }
      stage('docker build') {
      agent any
      steps {
        sh 'docker build -t mydockerimage .'
      }
    }
  }
}
