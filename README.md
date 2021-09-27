# app-ob

To run this project successfully, you need to meet the following prerequisite:
1. Owner Access to GCP project in form of service account. Create a json key from gcp and save it in `terraform/.keys/` directory. Add `.keys` directory to `.gitignore`
2. Create a bucket to be used for terraform remote state file.
3. Github account.
4. CircleCI account.


In CircleCI UI, configure the following environmental variables to be made available to CICD pipeline at runtime
- GCLOUD_SERVICE_KEY: Google Cloud Service account require by terraform to deploy helm chat to GKE
- GOOGLE_PROJECT_ID: Google Cloud Project ID
- GKE_CLUSTER_NAME: Name of the GKE cluster
- GOOGLE_COMPUTE_REGION: GCP region where GKE is provisioned.

<img width="1134" alt="Screenshot 2021-08-31 at 14 42 46" src="https://user-images.githubusercontent.com/10248484/131513366-7c118034-703e-4f54-885e-90efd8ea4b73.png">

### Clone this repository and change the origin to your own github repository.
   After cloning, and removing the default origin, follow the steps below to add your origin and push
- git remote add origin git@github.com:${GITHUB_USERNAME}/${GITHUB_REPO}.git
- git branch -M master
- git push -u origin master

### Setup CircleCI pipeline to read your own custom config
- Login into CircleCI UI with your github account https://app.circleci.com/.
- Follow the instructions to allow CCI to read your config file in `.circleci/config.yml` at the root of the repository.

### Push your changes to github
- make changes to your code. For instance, an empty commit!
- Watch the pipeline in CircleCI UI run the terraform jobs and deploy the helm chart to GKE

<img width="1174" alt="Screenshot 2021-08-31 at 14 44 26" src="https://user-images.githubusercontent.com/10248484/131513583-f9720195-a605-4ff4-901e-101b7ef0a2a8.png">




