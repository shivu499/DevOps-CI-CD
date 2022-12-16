

pipeline {
     agent {
        node {
            // Restrict where this project can be run-testfile
            label 'nascom'
        }
   
        }
                 

    stages {
        stage('Build and package') {
            steps {
                    bat """
                 make """             
            }
        }
        stage('PC Lint') {
            steps {
                echo '..'
		    steps {
                    bat """
                 cpplint --extensions=h,c --output=junit source\triangle.c source\triangle.h 2> pc-lint.xml  """             
            }
            }
		
        }
        
		stage('Deploy To Artifactory') {
		    
            steps{
                 bat """
                   
                   echo "upload  build release to artifactory"
                   curl -H "X-JFrog-Art-Api:AKCp8nyNzzK17UPuvoK8vBkqd1frktKWGSfP8ZdXF498YoeTvHk1o9FVTceiZGCPRavQfr3bX" -T main.exe "https://skilllync.jfrog.io/artifactory/nascom-generic-local/Releases/"               
                    
                """
            }
        }//upload full content to artifactory


    }
}

