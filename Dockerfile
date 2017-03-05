# Official R Docker Image
FROM r-base

LABEL author="Maximilian Irro <max@irro.at>"
LABEL description="Rserve running in a docker container. With `animation` library, and some command line packages installed, needed to generate image files with R." 
LABEL version="1.0"

RUN apt-get update \
	&& apt-get install -y xdg-utils links2 lynx w3m imagemagick

ADD install.R /
RUN Rscript install.R

ADD run.sh /
RUN chmod +x /run.sh
EXPOSE 6311
ENV R_HOME /usr/lib/R
CMD /run.sh
