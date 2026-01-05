FROM quay.io/fedora/fedora-bootc@sha256:f9ecbf7fa768058d2ed7158c82e77553a15eb4e48b046e1e5372925325d9276b

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
