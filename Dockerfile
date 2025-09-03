FROM quay.io/fedora/fedora-bootc@sha256:7fb00076dc037668c2036de34ffd3c51db8db1ac95520a8d837c2a7311abe02b

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
