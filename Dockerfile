FROM rocker/rstudio:4.4.2

RUN Rscript -e 'install.packages("remotes", repos="https://cloud.r-project.org")'
RUN Rscript -e 'remotes::install_version("cowsay", version = "0.8.0", repos = "https://cloud.r-project.org")'
RUN Rscript -e 'remotes::install_version("readr", version = "2.1.4")'