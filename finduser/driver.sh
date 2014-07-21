#!/bin/bash

# 批量转换中文到拼音
# Usage: sh driver.sh "file"

file=$1
while read line
do
	sh zhongwen_to_pinying.sh $line
done < $file
