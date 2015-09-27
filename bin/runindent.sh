#!/bin/sh
#set -x
while [ $# -ne 0 ];do
  indent \
    -TFILE \
    -Tbool \
    -Tchainbase \
    -Tmacro5 \
    -Tscrbuf5 \
    -Tsiginfo_t \
    -Tsize_t \
    -Tuint32_t \
    --braces-after-if-line \
    --braces-after-struct-decl-line \
    --brace-indent0 \
    --comment-indentation36 \
    --case-brace-indentation0 \
    --declaration-comment-column36 \
    --continuation-indentation2 \
    --case-indentation2 \
    --else-endif-column36 \
    --line-comments-indentation0 \
    --honour-newlines \
    --indent-level2 \
    --line-length80 \
    --comment-line-length80 \
    --parameter-indentation0 \
    --no-blank-lines-after-declarations \
    --no-blank-lines-after-procedures \
    --break-after-boolean-operator \
    --no-blank-lines-after-commas \
    --dont-break-function-decl-args \
    --dont-break-function-decl-args-end \
    --dont-cuddle-do-while \
    --dont-cuddle-else \
    --no-space-after-casts \
    --dont-format-first-column-comments \
    --dont-format-comments \
    --no-parameter-indentation \
    --dont-line-up-parentheses \
    --no-space-after-function-call-names \
    --no-space-after-parentheses \
    --leave-optional-blank-lines \
    --no-tabs \
    --paren-indentation0 \
    --procnames-start-lines \
    --space-after-for \
    --space-after-if \
    --space-after-while \
    --struct-brace-indentation0 \
    $1
  shift
done
