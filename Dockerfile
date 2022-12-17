FROM continuumio/miniconda3:latest

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# Set the working directory
WORKDIR /app

# Copy the environment file
COPY environment.yml .

# Create the environment
RUN conda install flask flask_cors 
RUN pip install diart
RUN conda install portaudio ffmpeg
RUN conda install pysoundfile -c conda-forge
RUN conda env create -f environment.yml

# Make RUN commands use the new environment
SHELL ["conda", "run", "-n", "myapp", "/bin/bash", "-c"]

# Copy the rest of the app
COPY . .

# Expose the port
EXPOSE 5000

# Run the app
CMD ["python", "app.py", "microphone"]

