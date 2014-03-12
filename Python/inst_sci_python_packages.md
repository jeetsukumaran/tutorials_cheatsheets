# Installing Scientific Packages for Python3 on MacOS 10.9 Mavericks

## Installing pip
If you haven't installed the `pip` package for your version of Python, yet, I'd suggest to download it from [https://pypi.python.org/pypi/pip](https://pypi.python.org/pypi/pip), unzip it, and install it from the unzipped directory via 
<pre>python3 setup.py install</pre>


## Installing NumPy

Installing NumPy should be straight forward now using `pip`

<pre>python3 -m pip install numpy</pre>

The installation will probably take a few minutes due to the source files that have to be compiled for your machine. Once it is installed, `NumPy` should be available in Python via

```import numpy```

If you want to see a few examples of how to operate with NumPy arrays, you can check out my [Matrix Cheatsheet for Moving from MATLAB matrices to NumPy arrays](http://sebastianraschka.com/Articles/2014_matlab_vs_numpy.html)

## Installing SciPy

While the `clang` compiler worked fine for compiling the C source code for `numpy`, we now need an additional Fortran compiler in order to install `scipy`.   

#### Installing a Fortran Compiler
Unfortunately, MacOS 10.9 Mavericks doesn't come with a Fortran compiler, but it is pretty easy to download and install it.  
For example, `gfortran` for MacOS 10.9 can be downloaded from [http://coudert.name/software/gfortran-4.8.2-Mavericks.dmg](http://coudert.name/software/gfortran-4.8.2-Mavericks.dmg)

Once you installed it, it should be available from the command line, you can test it by typing

<pre>gfortran -v</pre>
Among other information, you will see the current version, e.g.,   
<pre>gcc version 4.8.2 (GCC)</pre>

#### Installing SciPy

Now, we should be good to go to install `SciPy` using `pip`.  
</pre>python3 -m pip install scipy</pre>

After it was successfully installed - might also take a couple of minutes due to the source code compilation - it should be available in Python via  
<pre>import scipy</pre>

## Installing matplotlib

The installation process for matplotlib should go very smoothly using `pip`, I haven't encountered any hurdles here.

<pre>python3 -m pip install matplotlib</pre>

After successful installation, it can be imported in Python via

<pre>import matplotlib</pre>

The `matplotlib` library has become my favorite data plotting tool recently, you can check out some examples in my little matplotlib-gallery on GitHub: [https://github.com/rasbt/matplotlib_gallery](https://github.com/rasbt/matplotlib_gallery)

## Installing IPython

#### Installing pyzmq

The IPython kernel requires the `pyzmq` package to run, `pyzmq` contains Python bindings for ØMQ, which is a lightweight and fast messaging implementation. It can be installed via `pip`.  

<pre>python3 -m pip install pyzmq</pre>


#### Installing pyside

When I was trying to install the `pyside` package, I had it complaining about `cmake` and `qmake`. Those can be downloaded from:

http://www.cmake.org/files/v2.8/cmake-2.8.12.2-Darwin64-universal.dmg
http://qt-project.org/downloads

#### Installing IPython

Now, I could finally install IPython with all its further dependencies (pygments, Sphinx, jinja2, docutils, markupsafe) via  

<pre>python3 -m pip install ipython[all]</pre>

By doing this, we would install IPython to a custom location, e.g., `/Library/Frameworks/Python.framework/Versions/3.3/lib/python3.3/site-packages/IPython`. 

You can find the path to this location by importing IPython in Python and then print its path:

<pre>>> import IPython
>> IPython.__path__</pre>

Finally, we can set an `alias` in our `.bash_profile` or `.bash_rc` file to conviniently run IPython from the console. E.g., 

<pre>alias ipython3="python3 /Library/Frameworks/Python.framework/Versions/3.3/lib/python3.3/site-packages/IPython/terminal/ipapp.py"</pre>

(Don't forget to `source` the `.bash_rc` or `.bash_profile` file afterwards)

Now you can run   

<pre>ipython3</pre>


from you shell terminal to launch the interactive IPython shell, and   


<pre>ipython3 notebook</pre>


to bring up the awesome IPython notebook in your browser, respectively.
