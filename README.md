# pDESy-jupyterlab
This is the repository for executing [pDESy](https://github.com/pDESy/pDESy) in JupyterLab.

## How to run

### A. By using docker-compose.yml
1. [Install Docker](https://docs.docker.com/get-docker/) in your PC.

1. [Install Docker Compose](https://docs.docker.com/compose/install/) in your PC.

1. Get this repository.
    ```sh
    $ git clone https://github.com/pDESy/pDESy-jupyterlab.git 
    ```

1. Build.
    ```sh
    $ cd pDESy-jupyterlab
    $ docker-compose build
    ```

1. Run.
    ```sh
    $ docker-compose up
    ```

1. Access [http://localhost:8888/](http://localhost:8888/)
    - Default access token is `pDESy`. Please change this access token by editing Dockerfile.


### B. By using DockerHub image

1. [Install Docker](https://docs.docker.com/get-docker/) in your PC.

1. Download & Run
    
    - Ex.A: Just testing (not saved in your PC) 
        ```sh
        $ docker run --rm --name pdesy-jupyterlab -d -p 8888:8888 \
          taiga4112/pdesy-jupyterlab \
          jupyter-lab --no-browser --port=8888 --ip=0.0.0.0 \
          --allow-root --NotebookApp.token='pDESy'
        ```
        - Default access token is `pDESy`. Please change this access token

    - Ex.B: Run and Save the notebooks on your current directory in your PC
        ```sh
        $ mkdir notebook
        $ docker run --rm --name pdesy-jupyterlab -d -p 8888:8888 \
            -v $(pwd)/notebooks:/notebook -w /notebook \
            taiga4112/pdesy-jupyterlab \
            jupyter-lab --no-browser --port=8888 --ip=0.0.0.0 \
            --allow-root --NotebookApp.token='pDESy'
        ``` 
    
1. Access [http://localhost:8888/](http://localhost:8888/)
    - Default access token is `pDESy`. Please change this access token.

1. Kill image after finishing.
    ```sh
    $ docker kill pdesy-jupyterlab
    ```