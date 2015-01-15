# Use phusion/passenger-full as base image. To make your builds reproducible, make sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for a list of version numbers.
FROM phusion/passenger-full:0.9.14
MAINTAINER Ben Petro <bpetro@bthree.com.au>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# If you're using the 'customizable' variant, you need to explicitly opt-in for features. Uncomment the features you want:
#
#   Build system and git.
RUN /build/utilities.sh
#   Ruby support.
RUN /build/ruby2.1.sh

# ...put your own build instructions here...
RUN rm -f /etc/service/nginx/down
ADD sites.conf /etc/nginx/sites-enabled/sites.conf
ADD nginx.conf /etc/nginx/conf.d/nginx.conf

#my startup script
RUN mkdir -p /etc/my_init.d
ADD container_startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh

#SKIP THIS STEP AND BRING IN SOURCE FROM HOST
#RUN git clone https://benpetro:k1llerbee@github.com/bthree/sws.git /home/sites

#RUN cd /home/sites/lms && bundle update
RUN cd /app/lms && bundle update

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*