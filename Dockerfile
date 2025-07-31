FROM quay.io/fedora/fedora-bootc@sha256:0f9666989dfb1efdaaef653619998cafacb63aff15cda5e8709a04cd73f52e0b

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
