# Official R Docker Image
FROM r-base

# Maintainer
MAINTAINER "Maximilian Irro" max@irro.at 

RUN apt-get update \
	&& apt-get install -y xdg-utils links2 lynx w3m imagemagick

ADD install.R /
RUN Rscript install.R

ADD run.sh /
RUN chmod +x /run.sh
EXPOSE 6311
ENV R_HOME /usr/lib/R
CMD /run.sh
