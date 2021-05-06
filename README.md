# pDESy-jupyterlab
This is the repository for executing [pDESy](https://github.com/pDESy/pDESy) in JupyterLab.

## How to run

### A. By using docker-compose.yml (Only Linux and MacOS)
1. [Install Docker](https://docs.docker.com/get-docker/) in your PC.

1. [Install Docker Compose](https://docs.docker.com/compose/install/) in your PC.

1. Get this repository.
    ```sh
    $ git clone https://github.com/pDESy/pDESy-jupyterlab.git 
    ```

1. Build.
    ```sh
    $ cd pDESy-jupyterlab
    $ docker-compose build # --no-cache should be added after updating Dockerfile
    ```

1. Run.
    ```sh
    $ docker-compose up
    ```

1. Access [http://localhost:8888/](http://localhost:8888/)
    - Default access token is `pDESy`. Please change this access token by editing Dockerfile.

1. Down.
    ```sh
    $ docker-compose down
    ```

### B. By using Dockerfile

1. [Install Docker](https://docs.docker.com/get-docker/) in your PC.

1. Download & Run

    - Run and Save the notebooks on your current directory in your Linux or MacOS PC
        ```sh
        $ docker build -t pdesy-jupyterlab . # --no-cache should be added after updating Dockerfile
        $ docker run --rm --name pdesy-jupyterlab -d -p 8888:8888 -v $(pwd)/notebooks:/notebooks -w /notebooks pdesy-jupyterlab jupyter-lab --no-browser --port=8888 --ip=0.0.0.0 --allow-root --NotebookApp.token='pDESy'
        ```

    - Run and Save the notebooks on your current directory in your Windows PC
        ```sh
        $ docker build -t pdesy-jupyterlab . # --no-cache should be added after updating Dockerfile
        $ docker run --rm --name pdesy-jupyterlab -d -p 8888:8888 -v ${pwd}/notebooks:/notebooks -w /notebooks pdesy-jupyterlab jupyter-lab --no-browser --port=8888 --ip=0.0.0.0 --allow-root --NotebookApp.token='pDESy'
        ```

1. Access [http://localhost:8888/](http://localhost:8888/)
    - Default access token is `pDESy`. Please change this access token.

1. Kill image after finishing.
    ```sh
    $ docker kill pdesy-jupyterlab
    ```
