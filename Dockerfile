FROM quay.io/fedora/fedora-bootc@sha256:a5e806f1d114fc4f31cc1da06650da64c1e6f42a03dd4b365a3906e051cdb907

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
