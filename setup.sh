#!/bin/bash

# go up a directory
if [ ! -d "../gr_target" ]; then
	mkdir ../gr_target
fi

cd ../gr_target

# edit PREFIX
if grep -w "######_ADDED_BY_SCRIPT_#####" $HOME/.bashrc -q
then
	echo "PREFIX variable has already been set."
else
	echo "######_ADDED_BY_SCRIPT_#####" >> $HOME/.bashrc
	cd ../gr_target	

	echo "export PREFIX=$PWD" >> $HOME/.bashrc
	echo "PREFIX variable has been set.."

	echo "export PATH=$PATH:$PWD/bin:$PWD/lib"
	echo "PATH variable has been set.."


	echo "export PYTHONPATH=$PWD/lib/python2.7/dist-packages/"
	echo "PYTHONPATH variable has been set.."

	echo "export LD_LIBRARY_PATH=$PWD/lib:/usr/lib/:/usr/local/lib/"
	echo "LD_LIBRARY_PATH variable has been set.."

	echo "export PKG_CONFIG_PATH=$PWD/lib/pkgconfig/"
	echo "PKG_CONFIG_PATH variable has been set.."

	source $HOME/.bashrc
fi

# add the correct paths (PATH, PYTHONPATH, LD_LIBRARY_PATH,
# PKG_CONFIG_PATH)


# return back to directory
cd ../gr_dir
