#!/bin/bash

FOLDER_NAME=dtr-backup-$(date +%Y-%m-%d-%H-%M)

FILE_NAME=dtr-auth-backup-$(date +%Y-%m-%d-%H-%M).json

BUCKET_NAME=fries-firestore-backups

PROJECT_ID=modern-diode-339415 # Replace with your project ID

export CLOUDSDK_CORE_PROJECT=$PROJECT_ID

export GOOGLE_APPLICATION_CREDENTIALS="/app/modern-diode-339415-firebase-adminsdk-l8t1h-9a1f830664.json"

# gcloud auth activate-service-account firebase-adminsdk-klheo@modern-diode-339415.iam.gserviceaccount.com --key-file=/app/modern-diode-339415-b6e71cbc756a.json

# gcloud firestore export gs://$BUCKET_NAME/$FOLDER_NAME

gcloud auth activate-service-account firebase-adminsdk-l8t1h@modern-diode-339415.iam.gserviceaccount.comfirebase-adminsdk-l8t1h@modern-diode-339415.iam.gserviceaccount.com --key-file=/app/modern-diode-339415-firebase-adminsdk-l8t1h-9a1f830664.json

firebase auth:export $FILE_NAME.json --format=JSON && \
gsutil -m cp -r $FILE_NAME.json gs://$BUCKET_NAME/$FOLDER_NAME/$FILE_NAME && \
rm $FILE_NAME.json