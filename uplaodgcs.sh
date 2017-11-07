#!/bin/bash

#Cloud Shellで実行

#1.download
curl -o kankyo.csv https://ckan.open-governmentdata.org/dataset/ef0a812c-538b-4e54-ae3e-b22022a7c83a/resource/c60ccc29-811d-44f8-9aba-dcb660387927/download/kankyodata48.csv

#2.shift-jis to utf-8
sudo apt-get install nkf
nkf -w --overwrite kankyo.csv
nkf -g kankyo.csv

#3.upload gcs
gsutil mb -c regional -l us-east1 gs://${DEVSHELL_PROJECT_ID}-dataprep/
gsutil cp kankyo.csv gs://${DEVSHELL_PROJECT_ID}-dataprep/

