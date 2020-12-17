node("slave_hd2-test_132.138") {
    def appspider 
    deleteDir()
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
	sh "docker -v"
	checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        appspider = docker.build("hub.ark.jcloud.com/zhangheng129/app-spider")
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        sh "docker logout hub.ark.jcloud.com"
        sh "rm -f /home/jenkins_bot/.docker/.dockercfg"
        sh "rm -f /home/jenkins_bot/.dockercfg"
        sh "rm -f /home/jenkins_bot/.docker/config.json"
        docker.withRegistry('http://hub.ark.jcloud.com', 'zhangheng129dockerhub') {
            appspider.push("${env.BUILD_NUMBER}")
        sh "rm -f /home/jenkins_bot/.docker/.dockercfg"
        sh "rm -f /home/jenkins_bot/.dockercfg"
        sh "rm -f /home/jenkins_bot/.docker/config.json"
        }
    }
}
