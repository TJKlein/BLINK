# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.
#
#!/bin/bash

zeshel_data_folder="data"
if [[ ! -d zeshel_data_folder ]]; then
	mkdir -p $zeshel_data_folder
fi

fileid="1ZcKZ1is0VEkY9kNfPxIG19qEIqHE5LIO"
filename="zeshel.tar.bz2"
html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}

tar -xf $filename -C $zeshel_data_folder
rm ${filename}
