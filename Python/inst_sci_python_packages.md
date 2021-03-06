# Installing Scientific Packages for Python3 on MacOS 10.9 Mavericks

I just went through some pain (again) when I wanted to install some of Python's scientific libraries on my second Mac. I summarized the setup and installation process for future reference.  
If you encounter any different or additional obstacles let me know, and please feel free to make any suggestions to improve this short walkthrough.

![](../images/python_sci_pack_ing.png)

<hr>
####Sections
&#8226; [Consider a virtual environment](#venv)<br>
&#8226; [Installing pip](#pip)<br>
&#8226; [Installing NumPy](#numpy)<br>
&#8226; [Installing SciPy](#scipy)<br>
&#8226; [Installing matplotlib](#matplotlib)<br>
&#8226; [Installing IPython](#ipython)<br>
&#8226; [Updating installed packages](#updating)<br>

<br>
<hr>
<br>
<a name="venv"></a>
<br>
<br>
## Consider a virtual environment
<br>
Alternatively, in order to not mess around with our system packages, we can consider setting up an virtual environment when we want to install the additional scientific packages.   
To set up a new virtual environment, we can use the following command

<pre>[bash$]> python3 -m venv /path_to/my_virtual_env</pre>

and activate it via

<pre>[bash$]> source /path_to/my_virtual_env/bin/activate</pre>



<a name="pip"></a>
<br>
<br>
## Installing pip
<br>
`pip` is a tool for installing and managing Python packages. It makes the installation process for Python packages a lot easier, since they don't have to be downloaded manually.  
If you haven't installed the `pip` package for your version of Python, yet, I'd suggest to download it from [https://pypi.python.org/pypi/pip](https://pypi.python.org/pypi/pip), unzip it, and install it from the unzipped directory via 
<pre>[bash$]> python3 setup.py install</pre>


<a name="numpy"></a>
<br>
<br>
## Installing NumPy
<br>
Installing NumPy should be straight forward now using `pip`

<pre>[bash$]> python3 -m pip install numpy</pre>

The installation will probably take a few minutes due to the source files that have to be compiled for your machine. Once it is installed, `NumPy` should be available in Python via

<pre>>> import numpy</pre>

If you want to see a few examples of how to operate with NumPy arrays, you can check out my [Matrix Cheatsheet for Moving from MATLAB matrices to NumPy arrays](http://sebastianraschka.com/Articles/2014_matlab_vs_numpy.html)


<a name="scipy"></a>
<br>
<br>
## Installing SciPy
<br>
While the `clang` compiler worked fine for compiling the C source code for `numpy`, we now need an additional Fortran compiler in order to install `scipy`.   

<br>
#### Installing a Fortran Compiler
Unfortunately, MacOS 10.9 Mavericks doesn't come with a Fortran compiler, but it is pretty easy to download and install one.  
For example, `gfortran` for MacOS 10.9 can be downloaded from [http://coudert.name/software/gfortran-4.8.2-Mavericks.dmg](http://coudert.name/software/gfortran-4.8.2-Mavericks.dmg)

Just double-click on the downloaded .DMG container and follow the familiar MacOS X installation procedure. Once it is installed, the `gfortran` compiler should be available from the command line,. We can test it by typing

<pre>[bash$]> gfortran -v</pre>
Among other information, we will see the current version, e.g.,   
<pre>gcc version 4.8.2 (GCC)</pre>

<br>
#### Installing SciPy

Now, we should be good to go to install `SciPy` using `pip`.  
<pre>[bash$]> python3 -m pip install scipy</pre>

After it was successfully installed - might also take a couple of minutes due to the source code compilation - it should be available in Python via  
<pre>>> import scipy</pre>


<a name="matplotlib"></a>
<br>
<br>
## Installing matplotlib
<br>
The installation process for matplotlib should go very smoothly using `pip`, I haven't encountered any hurdles here.

<pre>[bash$]> python3 -m pip install matplotlib</pre>

After successful installation, it can be imported in Python via

<pre>>> import matplotlib</pre>

The `matplotlib` library has become my favorite data plotting tool recently, you can check out some examples in my little matplotlib-gallery on GitHub: [https://github.com/rasbt/matplotlib_gallery](https://github.com/rasbt/matplotlib_gallery)


<a name="ipython"></a>
<br>
<br>
## Installing IPython

<br>
#### Installing pyzmq

The IPython kernel requires the `pyzmq` package to run, `pyzmq` contains Python bindings for ØMQ, which is a lightweight and fast messaging implementation. It can be installed via `pip`.  

<pre>[bash$]> python3 -m pip install pyzmq</pre>

<br>
#### Installing pyside

When I was trying to install the `pyside` package, I had it complaining about the missing `cmake`. It can be downloaded from:

[http://www.cmake.org/files/v2.8/cmake-2.8.12.2-Darwin64-universal.dmg](http://www.cmake.org/files/v2.8/cmake-2.8.12.2-Darwin64-universal.dmg)

Just as we did with `gfortran` in the [Installing SciPy section](#scipy), double-click on the downloaded .DMG container and follow the familiar MacOS X installation procedure.  
We can confirm that it was successfully installed by typing  
<pre>[bash$]> cmake --version</pre>
into the command line where it would print something like

<pre>cmake version 2.8.12.2</pre>


<br>
#### Installing IPython

Now, we should finally be able to install IPython with all its further dependencies (pygments, Sphinx, jinja2, docutils, markupsafe) via  

<pre>[bash$]> python3 -m pip install ipython[all]</pre>

By doing this, we would install IPython to a custom location, e.g., `/Library/Frameworks/Python.framework/Versions/3.3/lib/python3.3/site-packages/IPython`. 

You can find the path to this location by importing IPython in Python and then print its path:

<pre>>> import IPython
>> IPython.__path__</pre>

Finally, we can set an `alias` in our `.bash_profile` or `.bash_rc` file to conviniently run IPython from the console. E.g., 

<pre>alias ipython3="python3 /Library/Frameworks/Python.framework/Versions/3.3/lib/python3.3/site-packages/IPython/terminal/ipapp.py"</pre>

(Don't forget to `source` the `.bash_rc` or `.bash_profile` file afterwards)

Now we can run   

<pre>[bash$]> ipython3</pre>


from you shell terminal to launch the interactive IPython shell, and   


<pre>[bash$]> ipython3 notebook</pre>


to bring up the awesome IPython notebook in our browser, respectively.


<a name="updating"></a>
<br>
<br>

## Updating installed packages
<br>
Finally, if we want to keep our freshly installed packages up to date, we'd run `pip` with the `--upgrate` flag, for example

<pre>[bash$]> python3 -m pip install numpy --upgrade </pre>
