pipeline {
  agent any
  stages {
    stage('dotnet restore and build') {
      agent any
      steps {
        sh 'dotnet restore'
        sh 'dotnet msbuild aspnetapp/aspnetapp.csproj'
      }
    }
  }
}
