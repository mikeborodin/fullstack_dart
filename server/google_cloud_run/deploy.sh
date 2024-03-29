# Please install gcloud cli and authenticate by running: 
# brew install --cask  google-cloud-sdk
# gcloud auth login

project=$1

gcloud config set project $project
gcloud builds submit --tag gcr.io/$project/server-image .

gcloud run deploy $project  --image gcr.io/$project/server-image --region europe-west3 --platform managed --allow-unauthenticated --quiet