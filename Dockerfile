FROM quay.io/fedora/fedora-bootc@sha256:8cb009b5aec9f1c726bcc18e5218f11b38dbccecb71b36d0380cf74a90590b14

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
