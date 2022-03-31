#!/bin/bash

inotifywait -r -m -e modify ./pkms | 
   while read path _ file; do 
       echo $path$file modified
   done

