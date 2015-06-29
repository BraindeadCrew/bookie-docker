FROM ubuntu
MAINTAINER Daroth <daroth@braindead.fr>
RUN apt-get update && apt-get install -y git make && apt-get autoclean -y
RUN git clone https://github.com/BraindeadCrew/Bookie.git /bookie
RUN git clone https://github.com/BraindeadCrew/bookie-download-cache.git /bookie/download-cache # speed up the make commands by caching the costy operation
WORKDIR /bookie
ENV NONINTERACTIVE true
RUN make sysdeps
RUN make install
CMD make run
