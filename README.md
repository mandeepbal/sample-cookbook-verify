# CI/CD Pipeline for Chef using Jenkins
- The CI/CD pipeline will automatically push Chef code to the Chef Servers after testing the code
- Continuous Delivery is insuring that code can be deployed quickly to all of the environments safely, using automated testing
- Continuous Deployment is the practice of continuously deploying to production after changes pass all automated tests
- Local Development flow is the process all contributors follow to develop and test their code
- Jenkins - Download the following plugins:
  - GitHub pull request builder plugin
### Installation:
* Install the plugin.  
* Go to ``Manage Jenkins`` -> ``Configure System`` -> ``GitHub pull requests builder`` section.

* Add GitHub usernames of admins (these usernames will be used as defaults in new jobs).  
* Under Advanced, you can modify:  
  * The phrase for adding users to the whitelist via comment. (Java regexp)  
  * The phrase for accepting a pull request for testing. (Java regexp)
  * The phrase for starting a new build. (Java regexp)  
  * The crontab line. This specify default setting for new jobs.  
* Under Application Setup
  * There are global and job default extensions that can be configured for things like:
  * Commit status updates
  * Build status messages
  * Adding lines from the build log to the build result message
  * etc.
* Save to preserve your changes.  
  - [Chef Identity Plugin](https://github.com/jenkinsci/chef-identity-plugin)
* Install the plugin.  
* Go to ``Manage Jenkins`` -> ``Configure System`` -> ``Chef Identity Management`` section.

* Select Add  
* Enter your Identity Name, User.pem and knife.rb
* Save to preserve your changes.  
