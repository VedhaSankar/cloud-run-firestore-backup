FROM gcloud-sdk
ADD . ./app

WORKDIR /app

ADD gtcloud-creds.json

RUN some authenticate command
CMD exec script