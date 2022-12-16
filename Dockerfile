FROM continuumio/miniconda3

COPY . /app
WORKDIR /app

RUN conda create --name myenv python=3.8
RUN echo "source activate myenv" > ~/.bashrc
ENV PATH /opt/conda/envs/myenv/bin:$PATH
RUN pip install flask_cors
RUN conda install -y numpy scipy pandas
RUN conda install portaudio
RUN conda install pysoundfile -c conda-forge
RUN conda install ffmpeg
RUN pip install diart flask
RUN cd /src
RUN cd /diart
EXPOSE 5000
CMD ["python", "app.py", "microphone"]