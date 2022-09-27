#!/bin/bash

file_name="$(date +%Y-%m-%d).tar.gz"
# 파일 이름 변수

cd /root/prometheus
# Prometheus 폴더로 이동
tar -zcvf $file_name data
# data파일 압축
mv $file_name /root
cd /root
# root 경로로 mv
aws s3 cp $file_name s3://my-chachacha-test-bucket/Prometheus_data/
# S3에 저장
rm -rf $file_name
# 기존 파일 삭제

