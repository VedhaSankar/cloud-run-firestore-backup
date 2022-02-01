#!/bin/bash

FOLDER_NAME=dtr-backup-$(date +%Y-%m-%d-%H-%M)

FILE_NAME=dtr-auth-backup-$(date +%Y-%m-%d-%H-%M).json

BUCKET_NAME=fries-firestore-backups

PROJECT_ID=modern-diode-339415 # Replace with your project ID

export CLOUDSDK_CORE_PROJECT=$PROJECT_ID

export GOOGLE_APPLICATION_CREDENTIALS="/app/fb.json"

gcloud auth activate-service-account firebase-adminsdk-klheo@modern-diode-339415.iam.gserviceaccount.com --key-file=/app/md.json

gcloud firestore export gs://$BUCKET_NAME/$FOLDER_NAME

gcloud auth activate-service-account firebase-adminsdk-l8t1h@modern-diode-339415.iam.gserviceaccount.com --key-file=/app/fb.json

firebase auth:export $FILE_NAME.json --format=JSON --project $PROJECT_ID && \
gsutil -m cp -r $FILE_NAME.json gs://$BUCKET_NAME/$FOLDER_NAME/$FILE_NAME && \
rm $FILE_NAME.json 