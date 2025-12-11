FROM python:3.13

# Create a user
RUN useradd --create-home --shell /bin/bash --gid users --groups sudo user
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ENV HOME=/home/user
ENV APP=$HOME/app
USER user

WORKDIR /home/user/notebooks
COPY --chown=user:user requirements.txt .

# Install Jupyter and other dependencies for running the notebook server
# Add .local/bin to PATH
ENV PATH="/home/user/.local/bin:${PATH}"
RUN pip install --no-cache-dir -r requirements.txt

# Setup Jupyter kernels for different environments for each notebook
COPY --chown=user:user . .
RUN scripts/setup-kernels.sh

EXPOSE 8888

CMD ["jupyter", "notebook", "--no-browser", "--ServerApp.ip=0.0.0.0", "--ServerApp.port=8888"]
