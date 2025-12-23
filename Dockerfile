FROM quay.io/fedora/fedora-bootc@sha256:181fe2609e25bab7863a51e7f386c05cbd95d6f909174e4c0ec9c95d0a5f1f4d

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
