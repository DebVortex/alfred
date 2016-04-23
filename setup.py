#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
from codecs import open

from setuptools import find_packages, setup

BASE_DIR = os.path.dirname(os.path.abspath(__file__))


def read(*paths):
    """Build a file path from *paths and return the contents."""
    with open(os.path.join(*paths), 'r', 'utf-8') as f:
        return f.read()

requires = []

extras_require = {
    'develop': [
        'bumpversion==0.5.3',
        'isort==4.2.2',
    ],
    'test': [
        'check-manifest==0.31',
        'coverage==4.0.3',
        'doc8==0.6.0',
        'flake8==2.5.2',
        'pytest==2.8.7',
        'tox==2.3.1',
    ],
    'docs': [
        'Sphinx==1.3.5',
    ]
}


setup(
    name='alfred',
    version='0.0.1',
    description='alfred is a extendable, voice or text controled tool to help you with various tasks.',  # noqa
    long_description=read(BASE_DIR, 'README.rst'),
    author='Max Brauer',
    author_email='max@max-brauer.de',
    entry_points={
        'console_scripts': [
            'alfred = alfred.main:main',
        ]
    },
    extras_require=extras_require,
    include_package_data=True,
    install_requires=requires,
    license='3-clause BSD',
    packages=find_packages(exclude=['tests*']),
    zip_safe=False,
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: Developers',
        'License :: 3-clause BSD',
        'Natural Language :: English',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: Implementation :: CPython',
    ],
)
