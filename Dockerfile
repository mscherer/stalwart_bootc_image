FROM quay.io/fedora/fedora-bootc@sha256:88c02d43511933ede7bc88ae2ab2b3eeb3c501109458af58d0eadc425b944fee

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
