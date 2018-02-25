#!/usr/bin/env bash

export BDB_PREFIX="/usr/local/db4"
mkdir ${BDB_PREFIX}
cd ${BDB_PREFIX}

curl -O http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -zxf db-4.8.30.NC.tar.gz
rm -f db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix/
../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$BDB_PREFIX
make install