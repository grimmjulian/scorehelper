# Base image with R and Shiny
FROM rocker/shiny:latest

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev libssl-dev libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install renv
RUN R -e "install.packages(c('renv', 'pkgload'), repos='https://cloud.r-project.org/')"

# Copy your app and renv files into the image
COPY . /srv/shiny-server/

# Set working directory
WORKDIR /srv/shiny-server

# Restore renv environment (takes build time, but ensures all packages are installed)
RUN R -e "renv::restore(prompt = FALSE)"

# Expose Shiny port
EXPOSE 3838

# Run Shiny app
CMD R -e "options(shiny.autoload.r = FALSE, shiny.autoreload = TRUE);pkgload::load_all();shiny::runApp('.', host='0.0.0.0', port=3838)"
