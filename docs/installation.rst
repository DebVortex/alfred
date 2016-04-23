************
Installation
************

Prerequisites
=============

Make sure you have the latest versions of `pip
<https://pip.pypa.io/en/stable/>`_ and `setuptools
<https://bitbucket.org/pypa/setuptools>`_  installed.

::

    $ pip --version

.. note::

    The package managers of most Linux/Unix distributions usually use outdated
    versions of :program:`pip`. Please uninstall the package providing
    :program:`pip` (usually it's named ``python-pip``) and :ref:`reinstall it
    using the bootstrap script <pip_bootstrap_script>`.

Install/upgrade pip using ensurepip
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you have Python 3.4 or Python 2.7.9 (or newer) installed you can use
`ensurepip <https://docs.python.org/3/library/ensurepip.html>`_ to install or
upgrade :program:`pip`:

::

    $ python -m ensurepip --upgrade

If your Python version is too old you will simply see an error message like
that:

::

    $ python -m ensurepip --upgrade
    /usr/bin/python: No module named ensurepip

In this case :ref:`reinstall it using the bootstrap script
<pip_bootstrap_script>`.

.. _pip_bootstrap_script:

Install/upgrade pip using the bootstrap script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

:program:`pip` can be installed with the help from a `bootstrap script
<https://bootstrap.pypa.io/get-pip.py>`_. If :program:`curl` is installed, you
can use it to download :program:`pip` at the command line. Otherwise just use
the browser.

::

    $ curl -O https://bootstrap.pypa.io/get-pip.py

When the bootstrap script has been downloaded execute it to install
:program:`pip`:

::

    $ python get-pip.py

Installation for usage
======================

To install alfred for local use, you simply can run pip to install it after
downloading:

::
    $ pip install .


Installation for development
============================

To install alfred and all development tools, you simply can use the make
target:

::
    $ make develop
