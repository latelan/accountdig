#!/bin/bash

# 从指定html页面中提取中文姓名
# Usage: sh extract_chinese_name.sh "html_file"

file=$1
cat $file | grep "<li><a href=\"index_teacher_lesson.jsp?from=tea" | awk -F '>' '{print $3}' | awk -F '<'  '{print $1}' | tr -d ' '

