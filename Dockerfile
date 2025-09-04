FROM quay.io/fedora/fedora-bootc@sha256:0ead499af6057402ed4ef3075c802ed71dd56abe158a98e4517eb4c0f0dba792

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
