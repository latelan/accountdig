#!/bin/bash

# Usage: sh zhongwen_to_pinying.sh  "chinese_name"

chinese_name=$1;
data="zhongwen=$chinese_name&select_sd=%E6%97%A0%E5%A3%B0%E8%B0%83&select_dz=%E6%97%A0%E6%96%87%E5%AD%97&select_dy=%E9%9A%90%E8%97%8F";
uri="http://zhongwenzhuanpinyin.51240.com";

curl -s -d $data $uri | grep -Po '(?<="readonly">)[^<]*' | tr -d ' ';

