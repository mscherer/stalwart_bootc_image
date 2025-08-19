FROM quay.io/fedora/fedora-bootc@sha256:e12376f80d97814ebd3ca8c908ad4184ee08f526bea291230321a8db969d777b

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
