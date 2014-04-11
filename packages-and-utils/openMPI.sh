# Tested on CentOS 6.5

# Install mpi package itself for development
yum install openmpi-devel

# Unfortunately, MPI installer is quite stupid and `which mpicc` will show nothing.
# Lets correct it.
ln -s /usr/lib64/openmpi/bin/mpicc /usr/bin/mpicc
ln -s /usr/lib64/openmpi/bin/mpic++ /usr/bin/mpic++
ln -s /usr/lib64/openmpi/bin/mpirun /usr/bin/mpirun

# From now you can compile mpi code, but while executing `mpirun -np 1 myprog` you will
# see `main: error while loading shared libraries: libmpi.so.1: cannot open shared object \
# file: No such file or directory`. It is because libmpi.so is not in `/usr/lib[64]/`
# It is neccessary to add the following expression into `~/.bashrc`
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/openmpi/lib/