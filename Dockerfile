FROM quay.io/informaticslab/conda

WORKDIR /root

# Jupyter note book and Python 3 + tools
RUN conda install -y jupyter boto3
RUN conda install -y -c scitools iris cartopy
RUN conda install -y dask distributed

# Python 2 kernal
RUN conda create -y -n py2 python=2 ipykernel boto3
RUN bash -c "source activate py2 && \
             conda install -y -c scitools iris cartopy"
RUN bash -c "source activate py2 && jupyter kernelspec install-self"

# SHARPpy - https://github.com/sharppy/SHARPpy
RUN bash -c "source activate py2 && \
                conda install -y PySide"
RUN bash -c "source activate py2 && \
                pip install git+git://github.com/sharppy/SHARPpy.git@47ab1a683a631506be9770ad4b68e36e1268a5b7"

# R
RUN conda install -y -c r r-essentials


#Clojure
RUN update-ca-certificates -f
RUN curl -k https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /usr/local/bin/lein
RUN apt-get update
RUN chmod +x /usr/local/bin/lein
RUN apt-get install -y default-jre
RUN git clone https://github.com/roryk/clojupyter
RUN mkdir -p /etc/pki/tls/certs && ln -s /etc/ssl/certs/ca-certificates.crt /etc/pki/tls/certs/ca-bundle.crt
RUN apt-get -y install make cmake
RUN cd clojupyter && make && make install && cd .. && rm -rf clojupyter


# Scala
RUN curl -L -o coursier https://git.io/vgvpD && chmod +x coursier && mv ./coursier /bin/
RUN curl -L -o jupyter-scala https://git.io/vrHhi && \
    chmod +x jupyter-scala && \
    ./jupyter-scala && rm -f jupyter-scala

# custom JADE extions

RUN pip install --upgrade git+https://github.com/met-office-lab/jade_utils
RUN bash -c "source activate py2 && pip install --upgrade git+https://github.com/met-office-lab/jade_utils"
