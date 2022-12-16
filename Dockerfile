FROM continuumio/miniconda3

COPY . /app
WORKDIR /app

RUN conda create --name myenv python=3.8
RUN echo "source activate myenv" > ~/.bashrc
ENV PATH /opt/conda/envs/myenv/bin:$PATH
RUN conda install -y numpy scipy pandas
RUN conda install portaudio
RUN conda install pysoundfile -c conda-forge
RUN pip install diart

EXPOSE 5000
CMD ["python", "app.py", "microphone"]