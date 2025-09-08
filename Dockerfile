FROM quay.io/fedora/fedora-bootc@sha256:91fb151db14f17871bb317260ebbb8b3f1f3ec5a21e0107c9b00021c31892eda

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
