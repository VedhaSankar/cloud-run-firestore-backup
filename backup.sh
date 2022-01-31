#!/bin/bash

FOLDER_NAME=dtr-backup-$(date +%Y-%m-%d-%H-%M)

FILE_NAME=dtr-auth-backup-$(date +%Y-%m-%d-%H-%M).json

BUCKET_NAME=fries-firestore-backups

PROJECT_ID=modern-diode-339415 # Replace with your project ID

gcloud firestore export gs://$BUCKET_NAME/$FOLDER_NAME

firebase --project=$PROJECT_ID auth:export $FILE_NAME.json --format=JSON && \
gsutil -m cp -r $FILE_NAME.json gs://$BUCKET_NAME/$FOLDER_NAME/$FILE_NAME && \
rm $FILE_NAME.json