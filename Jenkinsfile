pipeline {
  	environment {
    	DOCKER_REGISTRY = "shirnissan/"
    	registryCredential = 'docker-creds'
		IMAGE_TAG = "${BUILD_NUMBER}"
  	}
	agent {
		node {
			label 'master'
		}
	}
   	stages {
        stage('Docker ps') {
			steps {
				sh "docker ps"
			}
		}
		stage('Docker build and tag') {
			steps {
       				sh "docker build -t ${DOCKER_REGISTRY}dotnet-demo:${BUILD_NUMBER} ."
			}
		}
		stage('Login to docker hub') {
			steps {
				sh "docker login --username=${env.DOCKERHUB_USER_NAME} --password=${env.DOCKERHUB_PASSWORD}"
			}
		}
		stage('Docker push') {
			steps {
				sh "docker push  ${DOCKER_REGISTRY}dotnet-demo:${BUILD_NUMBER}"
			}
		}
		stage('Docker run'){
			steps{
				script{
                    // The script triggers PayloadJob on every node.
                    // It uses Node and Label Parameter plugin to pass the job name to the payload job.
                    // The code will require approval of several Jenkins classes in the Script Security mode
                    def vms = [:]
                    def names =  nodeNames('TerraformVM')
                    for (int i=0; i<names.size(); ++i) {
                        def nodeName = names[i];
                            // Into each branch we put the pipeline code we want to execute
                            vms["node_" + nodeName] = {
                                node(nodeName) {
					sh "docker run -p 8080:80 -d ${DOCKER_REGISTRY}dotnet-demo:${BUILD_NUMBER}"
                                }
                            }
                    }   
                    // Now we trigger all vms
                    parallel vms
		        }
		}
        }
    }

	post {
		always {
			cleanWs deleteDirs: true, notFailBuild: true
		}
	}
}



// This method collects a list of Node names from the current Jenkins instance
@NonCPS
def nodeNames(def labelToSelect) {
  return jenkins.model.Jenkins.instance.nodes.collect { node -> node.getLabelString().contains(labelToSelect) ? node.name : null }
}
