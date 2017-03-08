from setuptools import find_packages, setup


setup(
    name="hytest",
    version="0.0.1",
    packages=find_packages(),
    package_data={
        'hytest': ['*.hy']
    },
    install_requires=[
        'hy',
        'pytest'
    ],
    author="Simon Gomizelj",
    author_email="simon@vodik.xyz",
    long_description="pytest plugin to run hy tests",
    license="MIT",
    platforms=['any'],
    entry_points={
        'pytest11': [
            'hytest=hytest.plugin'
        ]
    }
)
