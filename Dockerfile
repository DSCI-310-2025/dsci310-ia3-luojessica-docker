# Use Rocker RStudio image
FROM rocker/rstudio:4.4.2

# Set working directory
WORKDIR /home/rstudio

# Switch to root: install system dependencies
USER root

# Install renv package
RUN Rscript -e 'install.packages("renv", repos="https://cran.rstudio.com")'

# Copy renv files into the container
COPY renv.lock renv.lock
COPY renv/ renv/

# Restore R packages from renv.lock
RUN Rscript -e 'renv::restore()'

# Install remotes package for version pinning
RUN Rscript -e 'install.packages("remotes", repos="https://cran.rstudio.com/")'

# Use remotes to install cowsay version 0.8.0
RUN Rscript -e 'remotes::install_version("cowsay", version="0.8.0", repos="https://cran.rstudio.com/")'
# Use remotes to install devtools version 2.4.5
RUN Rscript -e 'remotes::install_version("devtools", version="2.4.5", repos="https://cran.rstudio.com/")'
# Use remotes to install memer package
RUN Rscript -e 'remotes::install_github("gaborcsardi/memer")'

# Switch back to rstudio user to maintain best practices
USER rstudio

# Copy and run cowsay script
COPY script.R script.R
CMD ["Rscript", "script.R"]

# Expose RStudio Server port
EXPOSE 8787