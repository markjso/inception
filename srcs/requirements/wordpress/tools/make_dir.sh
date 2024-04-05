#!/bin/bash
if [ ! -d "/home/jmarks/data" ]; then
        mkdir ~/data
        mkdir ~/data/mariadb-data
        mkdir ~/data/wordpress-data
fi
