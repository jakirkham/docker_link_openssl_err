FROM continuumio/miniconda

WORKDIR test

RUN conda config --set show_channel_urls true && \
    rm -f environment.yml && \
    touch environment.yml && \
    echo "name: test"         >> environment.yml && \
    echo ""                   >> environment.yml && \
    echo "channels:"          >> environment.yml && \
    echo "  - conda-forge"    >> environment.yml && \
    echo ""                   >> environment.yml && \
    echo "dependencies:"      >> environment.yml && \
    echo "  - openssl"        >> environment.yml

RUN conda update -y -n root --all

RUN conda env update -n root -f environment.yml
